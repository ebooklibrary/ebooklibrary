<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../libraryTop.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
		$("#genre").html(l);
		
		$(".cartFrm").submit(function() {
			$.ajax({
				url:"<c:url value='/shop/cart/cartInsert.do'/>",
				type:"POST",
				data: $(this).serializeArray(),
				success:function(res){
					if (res<0) {
						alert("이미 장바구니 목록에 추가되었습니다.");
					}
				},
				error:function(xhr, status, error){
					alert(status+":"+error);
				}
			});
		});
		
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
			$(this).find(".popuptext").show().delay(2000)
			.queue(function (next) {
				$(this).hide();
				next();
			});
			
		});
		/* 
		$(".cart").click(function() {
			$("#cartFrm").submit();
		});
		 */
		
		
	}); //ready
	
	function pageFunc(curPage) {
		document.frmPage.currentPage.value=curPage;
		document.frmPage.submit();
	}
	

</script>

	<div id="bookListWrapper">
	
		
	
		<p><span id="countSpan">${alist.size()}</span> 건의  검색결과 
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
		
		<form action="<c:url value='/admin/book/bookList.do'/>" method="post" id="searchFrm">
			<p id="searchSpan">검색 키워드 : 
				<span>제목</span>
				<span>출판사</span>
				<span>작가</span>
				<span>장르<select name="genre" id="genre" style="display:none; margin-left: 5px;"></select></span>
			</p>
			<input type="text" class="w3-input" id="searchInput" name="title">
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
			<input type="hidden" id="bookNo" name="bookNo" value="${vo.bookNo }">
		</c:if>
			<div id="bookListDiv">
				<img alt="테스트" src="<c:url value='/book_upload/${vo.coverFileName }'/>">
				<p id="bookTitleP">[${vo.genre}] ${vo.title }</p>
				<div class="choice">
				
						<c:if test="${!empty vo.userId}">
							이미 가지고 있지롱
						</c:if>
						<c:if test="${empty vo.userId}">
							<div class="cart">
							<input type="submit" id="cart" name="cart" value="장바구니 추가" class="cart">
							<span class="popuptext">${vo.title } 장바구니 추가</span>
							</div>
							
							<input type="button" id="buy" name="buy" value="바로구매">
							
						</c:if>
						
				</div>
				<div id="bookSummaryDiv">${vo.summary }</div>
				<div id="bookPriceDiv">
					<p>구매가격 : <fmt:formatNumber value="${vo.price }" pattern="#,###,###" />원</p>
					<p>대여가격 : 일당 100원</p>
				</div>
			</div>
		</form>
		</c:forEach>
		
		<%-- 
		<!-- 페이징 처리를 위한 form 시작-->
		<form name="frmPage" method="post" action="<c:url value='/shop/order/orderList.do'/>">
			<input type="hidden" name="startDay" value="${dateSearchVO.startDay }">
			<input type="hidden" name="endDay" value="${dateSearchVO.endDay }">
			<input type="hidden" name="currentPage">
		</form>
		<!-- 페이징 처리 form 끝 -->
		 --%>
		 
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
	<!-- 사이드 장바구니 -->
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
<%@include file="../libraryBottom.jsp"%>