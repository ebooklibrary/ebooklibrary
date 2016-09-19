<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../library/libraryTop.jsp" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/library/loginForm.css" />    
<div id="regiWrapper" class="FormWrapperDiv">
<p id="titlePtag">비밀번호 변경</p>
	<form action="<c:url value='/member/pwdChange.do'/>" method="post" id="regForm">
	<label for="userName">변경할 비밀번호</label>
	<input type="password" name="userName" id="userName"><br>
	<label for="userName">비밀번호 확인</label>
	<input type="password" name="userName" id="userName"><br>

	<input type="submit" id="chgSubmit" value="비밀번호 변경">
	</form>
</div>

<%@ include file="mypageRightMenu.jsp" %>

<%@ include file="../library/libraryBottom.jsp" %>