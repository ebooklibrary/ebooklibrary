<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../../admin/libraryAdminTop.jsp"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/clear.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/library/bookDetail.css" />

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
		
		$("#bookEdit").click(function() {
			var bookNo=${bookVo.bookNo };
			$(location).attr('href', "<c:url value='/admin/book/bookEdit.do?bookNo="+bookNo+"'/>");
		});
		
	});
	
</script>
	<form method="post" id="cartFrm" class="cartFrm">
	<input type="hidden" id="bookNo" name="bookNo" value="${bookVo.bookNo }">
	<div id="DetailBookDiv">
		<div id="DetailbookCover">
			<img alt="책 커버 이미지" src="<c:url value='/book_upload/${bookVo.coverFileName }'/>">
		</div>
		
		<div id="DetailBookInfo">
			<div id="DetailBooktitle" class="DetailBookInfo">${bookVo.title }</div>
			
			<div class="DetailBookInfo">
				<span id="DetailBookgenre">${bookVo.genre }</span>
				<span id="DetailBookwriter">${bookVo.writer } 지음</span>
				<span id="DetailBookpublication"><fmt:formatDate value="${pubDate }" pattern="yyyy년 MM월 dd일"/> 출간</span>
			</div>
			<div id="DetailBooksales" class="DetailBookInfo"><span>누적판매량 : <fmt:formatNumber value="${bookVo.sales }" pattern="#,###"/>부</span></div>
			<div id="DetailBookprice" class="DetailBookInfo">
				<span>판매 가격 : ${bookVo.price }원</span><span>대여 가격 : 일당 100원</span>
			</div>
			
				<div class="choice">				
					<input type="button" id="bookEdit" name="bookEdit" value="수정하기" class="bookEdit">
				</div>
		</div>
		
		<div id="DetailBooksummary">
			<p>책 소개</p>
			${bookVo.summary }
		</div>
		
		<p id="goList"><a href="<c:url value='/admin/book/bookList.do'/>">책목록으로</a></p>
	
	</div>
	</form>

<%@include file="../libraryAdminBottom.jsp"%>