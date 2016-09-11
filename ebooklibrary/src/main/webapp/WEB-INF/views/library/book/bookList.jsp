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
<script type="text/javascript">
	$(document).ready(function() {
		$( "#sortDiv input" ).checkboxradio();
	});

</script>

</head>
<body>

	<div id="bookListWrapper">
	
		
	
		<p>도서 검색 결과 페이지</p>
		
		<p>12건의  검색결과 : "${searchKeyword }"</p>
		
		<p id="searchSpan">검색 : </p><input type="text" class="w3-input" id="searchKeyword" name="searchKeyword">
		
		<div id="sortDiv">
		  <fieldset>
		  	<legend>정렬</legend>
		    <label for="radio-1">판매량</label>
		    <input type="radio" name="radio-1" id="radio-1">
		    <label for="radio-2">신상품</label>
		    <input type="radio" name="radio-1" id="radio-2">
		    <label for="radio-3">낮은가격</label>
		    <input type="radio" name="radio-1" id="radio-3">
		    <label for="radio-4">높은가격</label>
		    <input type="radio" name="radio-1" id="radio-4">
		  </fieldset>
		</div>
		
		<div id="bookListDiv">
			<img alt="테스트" src="/ebooklibrary/book_upload/이드커버20160909224712065.JPG">
			<p>[장르] 책 제목</p>
			<div id="choice">
				<input type="checkbox" id="chkBookList" name="chkBookList">
				
				<input type="button" id="cart" name="cart" value="장바구니">
				<input type="button" id="buy" name="buy" value="바로구매">
				<!-- <input type="text" id="quantity" name="quantity"> -->
			</div>
			<div id="bookSummaryDiv">책 요약</div>
			<div id="bookPriceDiv">
				<p>구매가격 : 25,000원</p>
				<p>대여가격 : 일당 100원</p>
				<p>대여현황 : 3/4</p>
			</div>
			
		</div>
	
	</div>

</body>
</html>