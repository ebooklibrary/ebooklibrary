<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../../admin/libraryAdminTop.jsp"%>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/clear.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/library/bookList.css" />

<script type="text/javascript" src="<c:url value='/jquery/jquery-3.1.0.min.js'/>"></script>

<link rel="stylesheet" href="<c:url value='/css/jqueryui.css'/>">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>

<!-- 폼태그 -->
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<!-- common js -->
<script type="text/javascript" src="<c:url value='/js/common.js'/>"></script>


<script type="text/javascript">
	$(document).ready(function() {
		//$( "#sortDiv input" ).checkboxradio();
		
		/* alert 커스텀 */
		alertify.set({ labels: {
			    ok     : "예",
			    cancel : "아니오"
			} }); 

		/* 버튼 리버스 (좌우 위치이동) */
		alertify.set({ buttonReverse: true });
		
		$("#schDivColor").css("background-color","rgba(0, 250, 250, 0.5)");
		$("#genre").html(l);
		
		$(".cartFrm").submit(function() {
			if (${empty sessionScope.userId }) {
				/* 
				alertify.alert("로그인하여 주세요.");
				$(location).attr('href', "<c:url value='/member/login.do'/>");
				 */
				
				alertify.alert("로그인하여 주세요.", function (e) {
				    if (e) {
				    	$(location).attr('href', "<c:url value='/member/login.do'/>");
				    }
				});
				
				return false;
			}
			$.ajax({
				url:"<c:url value='/shop/cart/cartInsert.do'/>",
				type:"POST",
				data: $(this).serializeArray(),
				success:function(res){
					if (res<0) {
						alertify.alert("이미 장바구니 목록에 추가되었습니다.");
					}
				},
				error:function(xhr, status, error){
					alertify.alert(status+":"+error);
				}
			});
		});
		
		$('#searchInput').keydown(function (e){
		    if(e.keyCode == 13){
		    	$("#searchFrm").submit();
		    }
		})
		
		 /* 조건별 검색 */
		$("#searchSpan span").click(function() {
			$("#searchSpan span").css("border","");
			$(this).css("border","1px solid pink");
			var index=$("#searchSpan").find("span").index(this);
			if (index==0) {
				$("#searchInput").attr("name","title");
			}
			if (index==1) {
				$("#searchInput").attr("name","publisher");
			}
			if (index==2) {
				$("#searchInput").attr("name","writer");
			}
			if (index==3) {
				$("#searchInput").attr("name","title");
				/* $("#titleInput").attr("name","genre"); */
				$("#genre").show();
			}else{
				$("#genre").hide();
				$("#genre").val("0");
			}
		});
		 
		 /* 조건별 검색 후 */
		 var title="${bookSearchVo.title}";
		 var publisher="${bookSearchVo.publisher}";
		 var writer="${bookSearchVo.writer}";
		 var genre="${bookSearchVo.genre}";
		 if (title.length>0 && title!="") {
			 $("#searchSpan span:nth-of-type(1)").css("border","1px solid pink");
			 $("#searchInput").attr("name","title");
			 $("#searchInput").val("${param.title }");
		}
		 if (publisher.length>0 && publisher!="") {
			 $("#searchSpan span:nth-of-type(2)").css("border","1px solid pink");
			 $("#searchInput").attr("name","publisher");
			 $("#searchInput").val("${param.publisher }");
		}
		 if (writer.length>0 && writer!="") {
			 $("#searchSpan span:nth-of-type(3)").css("border","1px solid pink");
			 $("#searchInput").attr("name","writer");
			 $("#searchInput").val("${param.writer }");
		}
		 if (genre.length>0 && genre!="0") {
			 $("#searchSpan span:nth-of-type(1)").css("border","");
			 $("#searchSpan span:nth-of-type(4)").css("border","1px solid pink");
			 $("#searchInput").attr("name","title");
			 $("#genre").show();
			 $("#genre").val("${bookSearchVo.genre}");
		}
		
		 /* 조건별 정렬 */
		<!-- sales,publication,lowPrice,highPrice -->
		<%-- ${bookSearchVo.bookSort=='sales'} --%>
		var bookSort="${bookSearchVo.bookSort}";
		//alert(bookSort);
		$("#sortDiv li").click(function() {
			//alert(bookSort);
			var index=$("#sortDiv").find("li").index(this);
			//alert(index);
			if (index==3) {
				$("#bookSort").val("sales");
			}else if (index==2) {
				$("#bookSort").val("publication");
			}else if (index==1) {
				$("#bookSort").val("lowPrice");
			}else if (index==0) {
				$("#bookSort").val("highPrice");
			}
			$("#searchFrm").submit();
		});
		/* 정렬 후 글씨 변화 */
		var bookSort="${bookSearchVo.bookSort}";
		if (bookSort=='sales') {
			$("#sortDiv li:nth-of-type(4)").css("font-weight",'bold');
		}else if (bookSort=='publication') {
			$("#sortDiv li:nth-of-type(3)").css("font-weight",'bold');
		}else if (bookSort=='lowPrice') {
			$("#sortDiv li:nth-of-type(2)").css("font-weight",'bold');
		}else if (bookSort=='highPrice') {
			$("#sortDiv li:nth-of-type(1)").css("font-weight",'bold');
		}
		
		/* 장바구니 클릭시 메시지 */
		$(".cart").click(function() {
			if (${!empty sessionScope.userId }) {
				$(this).find(".popuptext").show().delay(2000)
				.queue(function (next) {
					$(this).hide();
					next();
				});
			}
		});
		
		
		/* 
		$(".cart").click(function() {
			$("#cartFrm").submit();
		});
		 */
		
		 $("#bookTitleP, #bookListDiv img").click(function() {
			 
			 var bookNo=$(this).parent().parent().find("input[name=bookNo]").val();
			 /* alert($("#session").val()); */
			 if($("#session").val()==null || $("#session").val()==""){
				 $(location).attr('href', "<c:url value='/book/bookDetail.do?bookNo="+bookNo+"'/>");
			 }else{
				 $(location).attr('href', "<c:url value='/admin/book/bookDetail.do?bookNo="+bookNo+"'/>");
			 }
			 
		});
		 
		 $(".bookDelete").click(function() {
			var bookNo=$(this).parent().parent().parent().find("input[name=bookNo]").val();
			/* alert(bookNo); */
			
			alertify.confirm("정말로 책을 삭제하시겠습니까?", function (e) {
				if (e) {
					$(location).attr('href', "<c:url value='/admin/book/bookDelete.do?bookNo="+bookNo+"'/>");
			    } else {
			    	return false;
			    }
			});
			
		});
		 
		 $(".bookEdit").click(function() {
			var bookNo=$(this).parent().parent().parent().find("input[name=bookNo]").val();
			$(location).attr('href', "<c:url value='/admin/book/bookEdit.do?bookNo="+bookNo+"'/>");
			
		});
		 
		
	}); //ready
	
	function pageFunc(curPage) {
		document.searchFrm.currentPage.value=curPage;
		document.searchFrm.submit();
	}
	

</script>

	<div id="bookListWrapper">
		<c:if test="${pagingInfo.totalRecord > alist.size() }">
		<p><span id="countSpan">${alist.size()}</span> 건의  검색결과
		</c:if> 
		<c:if test="${pagingInfo.totalRecord == alist.size() }">
		<p><span id="countSpan">${pagingInfo.totalRecord}</span> 건의  검색결과
		</c:if> 
			<c:if test="${!empty bookSearchVo.title}">
				"${bookSearchVo.title}" - 제목별 검색 결과
			</c:if>
			<c:if test="${!empty bookSearchVo.publisher}">
				"${bookSearchVo.publisher}" - 출판사별 검색 결과
			</c:if>
			<c:if test="${!empty bookSearchVo.writer}">
				"${bookSearchVo.writer}" - 작가별 검색 결과
			</c:if>
			<c:if test="${!empty bookSearchVo.genre && bookSearchVo.genre !='0'}">
				"${bookSearchVo.genre}" - 장르별 검색 결과
			</c:if>
			<c:if test="${!empty bookSearchVo.searchKeyword}">
				"${bookSearchVo.searchKeyword}" - 통합검색 결과
			</c:if>
		</p>
		
		<form action="<c:url value='/admin/book/bookList.do'/>" name="searchFrm" method="post" id="searchFrm">
		<input type="hidden" name="currentPage" value="${bookSearchVo.currentPage }">
			<p id="searchSpan">검색 키워드 : 
				<span>제목</span>
				<span>출판사</span>
				<span>작가</span>
				<span>장르<select name="genre" id="genre" style="display:none; margin-left: 5px;"></select></span>
			</p>
			<input type="text" class="w3-input" id="searchInput" name="title" placeholder="조건별 검색을 원할시 위의 원하시는 조건을 클릭 후 검색하세요.">
			<!-- <input type="hidden" id="titleInput" name=""> -->
		
		
			<div id="sortDiv">
				<input type="hidden" name="bookSort" id="bookSort">
				<!-- sales,publication,lowPrice,highPrice -->
				<%-- ${bookSearchVo.bookSort=='sales'} --%>
					<nav>
						<ul>
							<li>높은가격</li>
							<li>낮은가격</li>
							<li>신상품</li>
							<li>판매량</li>
						</ul>
					</nav>
					<%-- 
					<label for="highPrice">높은가격</label>
					<input type="button" name="bookSort" id="highPrice" value="highPrice"
					<c:if test="${bookSearchVo.bookSort=='highPrice'}">
						checked='checked'
					</c:if>
					>
					 --%>
			</div>
		</form>
		<c:if test="${empty alist }">
			검색하신 책은 없습니다.
		</c:if>
		
		<c:forEach var="vo" items="${alist}">
		<form method="post" id="cartFrm" class="cartFrm">
		<c:if test="${!empty sessionScope.userId }">
			<input type="hidden" id="userId" name="userId" value="${sessionScope.userId }">
			<input type="hidden" id="price" name="price" value="${vo.price }">
		</c:if>
			<input type="hidden" id="bookNo" name="bookNo" value="${vo.bookNo }">
			<div id="bookListDiv">
				<img alt="책 커버 이미지" src="<c:url value='/book_upload/${vo.coverFileName }'/>">
				<p id="bookTitleP">[${vo.genre}] ${vo.title }</p>
				<c:if test="${sessionScope.adminAuchCode=='ADMIN' }">
					<div class="choice">
						<input type="submit" id="bookEdit" name="bookEdit" value="수정" class="bookEdit">
						<c:if test="${vo.sales == 0 }">
							<input type="button" class="bookDelete" id="bookDelete" name="bookDelete" value="삭제">
						</c:if>
					</div>
				</c:if>
				
				<c:if test="${sessionScope.adminAuchCode!='ADMIN' }">				
					<div class="choice">				
						<c:if test="${vo.userId == sessionScope.userId}">
							구매하신 상품입니다.
						</c:if>
						<c:if test="${vo.userId != sessionScope.userId}">
							<div class="cart">
							<input type="submit" id="cart" name="cart" value="장바구니 추가" class="cart">
							<span class="popuptext">${vo.title } 장바구니 추가</span>
							</div>
							
							<input type="button" id="buy" name="buy" value="바로구매">
							
						</c:if>						
					</div>
				</c:if>
				<div id="bookSummaryDiv">${vo.summary }</div>
				<div id="bookPriceDiv">
					<p>구매가격 : <fmt:formatNumber value="${vo.price }" pattern="#,###,###" />원</p>
					<p>대여가격 : 일당 100원</p>
				</div>
			</div>
		</form>
		</c:forEach>
		 
		<div class="divPage">		
			<ul class="pagination">
			<!-- 페이지 번호 추가 -->		
			<c:if test="${pagingInfo.firstPage>1 }">
			  <li><a href="#" onclick="pageFunc(${pagingInfo.firstPage-1})">&laquo;</a></li>
			</c:if>
			
		
			<!-- [1][2][3][4][5][6][7][8][9][10] -->
			<c:forEach var="i" begin="${pagingInfo.firstPage }" 
			end="${pagingInfo.lastPage }">
				<c:if test="${i==pagingInfo.currentPage }">
					<li><a class="active" href="#">${i }</a></li>
					<input type="hidden" name="currentPage" value="${i }">
				</c:if>
				<c:if test="${i!=pagingInfo.currentPage }">
					<li><a href="#" onclick="pageFunc(${i})">${i }</a>
					</li>
				</c:if>
			</c:forEach>
				
			<c:if test="${pagingInfo.lastPage<pagingInfo.totalPage }">
				<li>
					<a href="#" onclick="pageFunc(${pagingInfo.lastPage+1})">&raquo;</a>
				</li>
			</c:if>
			<!--  페이지 번호 끝 -->
			</ul>
		</div>
		
	</div>
	<c:if test="${!empty sessionScope.adminAuchCode }">
		<input type="hidden" id="session" value="${sessionScope.adminAuchCode }">
	</c:if>
	<c:if test="${empty sessionScope.adminAuchCode }">
		<input type="hidden" id="session">
	</c:if>
	
	
	<!-- 사이드 장바구니 -->
	<c:if test="${sessionScope.adminAuchCode!='ADMIN' }">	
		<div id="cartDiv">
			<nav>
				<ul>
					<li>장바구니 목록</li>
					<c:forEach var="map" items="${cartList }">
						<li>${map['TITLE'] }</li>
					</c:forEach>
					<li><a href="<c:url value='/shop/cart/cartList.do'/>">구매 페이지</a></li>
				</ul>
			</nav>
		</div>
	</c:if>
<%@include file="../libraryAdminBottom.jsp"%>