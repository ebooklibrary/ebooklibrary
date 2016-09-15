<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>이건 북리스트</title>
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
		$( "#sortDiv input" ).checkboxradio();
		$("#genre").html(l);
		
		/* 
		$("#searchFrm").submit(function() {
			$.ajax({
				url:"<c:url value='/admin/book/bookList.do'/>",
				type:"POST",
				data: $(this).serializeArray(),
				success:function(res){
					
				},
				error:function(xhr, status, error){
					alert(status+":"+error);
				}
			});
		});
		 */
		
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
		
		 /* 정렬 후 */
		var bookSort="${bookSearchVo.bookSort}"
		alert(bookSort);
		
		
		/* 조건별 정렬 */
		$("#sortDiv input[type=radio]").click(function() {
			if (this.checked) {
				alert($(this).val());
				$("#searchFrm").submit();
			}
		});
		
		$(".cart").click(function() {
			$(this).find(".popuptext").show().delay(2000)
			.queue(function (next) {
				$(this).hide();
				next();
			});
			
		});
		
		
		
		
		
	});
	
	

</script>

</head>
<body>

	<div id="bookListWrapper">
	
		
	
		<p>도서 검색 결과 페이지</p>
		<p>12건의  검색결과 : 
			<c:if test="${!empty bookSearchVo.title}">
				"${bookSearchVo.title}" - 제목별 검색 결과
			</c:if>
			<c:if test="${!empty bookSearchVo.publisher}">
				"${bookSearchVo.publisher}" - 출판사별 검색 결과
			</c:if>
			<c:if test="${!empty bookSearchVo.writer}">
				"${bookSearchVo.writer}" - 작가별 검색 결과
			</c:if>
			<c:if test="${bookSearchVo.genre !='0'}">
				"${bookSearchVo.genre}" - 장르별 검색 결과
			</c:if>
		</p>
		
		<form action="<c:url value='/admin/book/bookList.do'/>" method="post" id="searchFrm">
			<p id="searchSpan">검색 : 
				<span>제목</span>
				<span>출판사</span>
				<span>작가</span>
				<span>장르<select name="genre" id="genre" style="display:none; margin-left: 5px;"></select></span>
			</p>
			<input type="text" class="w3-input" id="searchInput" name="title">
			<!-- <input type="hidden" id="titleInput" name=""> -->
		
		
			<div id="sortDiv">
				<!-- salesVal,newBook,lowPrice,highPrice -->
				<fieldset>
					<legend>정렬</legend>
					<label for="a">판매량</label>
					<input type="radio" name="bookSort" id="a" value="sales"
					<c:if test="${bookSearchVo.bookSort=='sales'}">
						checked='checked'
					</c:if>
					>
					<label for="b">신상품</label>
					<input type="radio" name="bookSort" id="b" value="publication"
					<c:if test="${bookSearchVo.bookSort=='publication'}">
						checked='checked'
					</c:if>
					>
					<label for="c">낮은가격</label>
					<input type="radio" name="bookSort" id="c" value="lowPrice"
					<c:if test="${bookSearchVo.bookSort=='lowPrice'}">
						checked='checked'
					</c:if>
					>
					<label for="d">높은가격</label>
					<input type="radio" name="bookSort" id="d" value="highPrice"
					<c:if test="${bookSearchVo.bookSort=='highPrice'}">
						checked='checked'
					</c:if>
					>
				</fieldset>
			</div>
		</form>
		<c:if test="${empty alist }">
			검색하신 책은 없습니다.
		</c:if>
		
		<c:forEach var="vo" items="${alist}">
			<div id="bookListDiv">
				<img alt="테스트" src="<c:url value='/book_upload/${vo.coverFileName }'/>">
				<p id="bookTitleP">[${vo.genre}] ${vo.title }</p>
				<div class="choice">
					<input type="checkbox" id="chkBookList" name="chkBookList">
					<div class="cart">
					<input type="button" id="cart" name="cart" value="장바구니" class="cart">
					<span class="popuptext">${vo.title } 장바구니 추가</span>
					</div>
					
					<input type="button" id="buy" name="buy" value="바로구매">
					<!-- <input type="text" id="quantity" name="quantity"> -->
				</div>
				<div id="bookSummaryDiv">${vo.summary }</div>
				<div id="bookPriceDiv">
					<p>구매가격 : <fmt:formatNumber value="${vo.price }" pattern="#,###,###" />원</p>
					<p>대여가격 : 일당 100원</p>
				</div>
			</div>
		</c:forEach>
		<div id="choiceAll">
			<input type="button" id="cart" name="cart" value="모두 장바구니" class="cart">
			<input type="button" id="buy" name="buy" value="모두 바로구매">
		</div>
	</div>

</body>
</html>