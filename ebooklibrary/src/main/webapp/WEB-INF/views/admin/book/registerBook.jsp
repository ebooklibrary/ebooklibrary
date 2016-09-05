<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../libraryAdminTop.jsp" %>
책 업로드 페이지
<br><br>

<form action="<c:url value='/admin/book/uploadBook.do'/>" id="bookfrm1" name="bookfrm1" enctype="multipart/form-data" method="post">
	책을 올려 봅시다!<br><br>
	
	<span>책파일</span><input type="file" id="bookFileName" name="bName">
	<span>책커버</span><input type="file" id="coverFileName" name="cName">
	<span>책제목</span><input type="text" id="title" name="title">
	<span>출판사</span><input type="text" id="publisher" name="publisher">
	<span>작가명</span><input type="text" id="writer" name="writer">
	<!-- <span>출판일</span><input type="text" id="publication" name="publication"> -->
	<span>장르</span><input type="text" id="genre" name="genre">
	<span>가격</span><input type="text" id="price" name="price">
	<span>요약</span><input type="text" id="summary" name="summary">
	
	
	
	
	
	
	
	<input type="submit" id="btBookUp" name="btBookUp" value="확인">
</form>

<%@ include file="../libraryAdminBottom.jsp" %>