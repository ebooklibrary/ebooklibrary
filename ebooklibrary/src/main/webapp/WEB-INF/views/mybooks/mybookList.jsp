<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나의 책 리스트</title>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/clear.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/library/bookList.css" />

<script type="text/javascript" src="<c:url value='/jquery/jquery-3.1.0.min.js'/>"></script>

<link rel="stylesheet" href="<c:url value='/css/jqueryui.css'/>">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>

<!-- alert -->
<!-- ideally at the bottom of the page -->
<!-- also works in the <head> -->
<%-- <c:url value='/alertify.js-0.3.11/themes/alertify.core.css'/> --%>
<script src="<c:url value='/alertify.js-0.3.11/lib/alertify.min.js'/>"></script>
<!-- include the core styles -->
<link rel="stylesheet" href="<c:url value='/alertify.js-0.3.11/themes/alertify.core.css'/>" />
<%-- <link rel="stylesheet" href="<c:url value='/alertify.js-0.3.11/themes/alertify.bootstrap.css'/>" /> --%>
<!-- include a theme, can be included into the core instead of 2 separate files -->
<link rel="stylesheet" href="<c:url value='/alertify.js-0.3.11/themes/alertify.default.css'/>" />

<!-- 폼태그 -->
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<!-- common js -->
<script type="text/javascript" src="<c:url value='/js/common.js'/>"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		/* alert 커스텀 */
		alertify.set({ labels: {
			    ok     : "예",
			    cancel : "아니오"
			} }); 

		/* 버튼 리버스 (좌우 위치이동) */
		alertify.set({ buttonReverse: true });
		
		$(".bookDelete").click(function() {
			
			var hide=$(this).parent().find(".hide").val();
			var bookNo=$(this).parent().find(".bookNo").val();
			if (hide=='N') {
				alertify.confirm("이 책은 내 서재의 목록에서 제외됩니다. (책이 지워지는 것은 아닙니다.)", function (e) {
					if (e) {
						$(location).attr('href', "<c:url value='/mybooks/deleteMybook.do?bookNo="+bookNo+"&hide="+hide+"'/>");
				    } else {
				    	alertify.alert("목록 제외를 취소하셨습니다.");
				    	return false;
				    }
				});
			}
			if (hide=='Y') {
				alertify.confirm("이 책을 내 서재의 목록으로 다시 불러옵니다.", function (e) {
					if (e) {
						$(location).attr('href', "<c:url value='/mybooks/deleteMybook.do?bookNo="+bookNo+"&hide="+hide+"'/>");
				    } else {
				    	alertify.alert("목록 불러오기를 취소하셨습니다.");
				    	return false;
				    }
				});
			}
			
			/* 
			var bookNo=$(this).parent().find(".bookNo").val();
			alert(bookNo);
			$(location).attr('href', "<c:url value='/mybooks/deleteMybook.do?bookNo="+bookNo+"'/>");
			 */
		});
	});


function pageFunc(curPage) {
	document.searchFrm.currentPage.value=curPage;
	document.searchFrm.submit();
}

</script>
</head>
<body>

	
	<div id="bookListWrapper">
		
		<form action="<c:url value='/mybooks/mybookList.do'/>" name="searchFrm" method="post" id="searchFrm">
			<input type="hidden" name="currentPage" value="${bookSearchVo.currentPage }">
			검색 :
			<input type="text" class="w3-input" id="searchInput" name="searchKeyword" style="border-bottom: 1px solid green; margin-bottom: 100px;">
		</form>
		<c:if test="${empty alist }">
			보유하고 계신 책은 없습니다.
		</c:if>
		
		<c:forEach var="map" items="${alist }">
		<form method="post" id="cartFrm" class="cartFrm">
		<c:if test="${!empty sessionScope.userId }">
			<%-- <input type="hidden" id="price" name="price" value="${vo.price }"> --%>
			<%-- <input type="hidden" id="bookNo" name="bookNo" value="${vo.bookNo }"> --%>
		</c:if>
			<div id="bookListDiv">
				<img alt="테스트" src="<c:url value='/book_upload/${map["COVER_FILE_NAME"] }'/>">
				<p id="bookTitleP">${map["TITLE"] }</p><%-- [${map["GENRE"] }]  --%>
					<div class="choice">
						<c:if test="${map['HIDE']=='N' }">
							<input type="button" id="bookDelete" class="bookDelete" name="bookDelete" value="책 숨기기">
						</c:if>
						<c:if test="${map['HIDE']=='Y' }">
							<input type="button" id="bookDelete" class="bookDelete" name="bookDelete" value="책 보이기">
						</c:if>
						<input type="hidden" id="bookNo" class="bookNo" name="bookNo" value="${map['BOOK_NO'] }">
						<input type="hidden" id="hide" class="hide" name="hide" value="${map['HIDE'] }">
					</div>
				<div id="bookSummaryDiv">${map["SUMMARY"] }</div>
				<div id="bookPriceDiv">
					<p>구매가격 : <fmt:formatNumber value="${map['PRICE'] }" pattern="#,###,###" />원</p>
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
	

</body>
</html>