<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../library/libraryTop.jsp" %>

	<h1>회원가입</h1>
	<form action="<c:url value='/member/register.do'/>" method="post">
		아이디 : <input type="text" name="username"><br>
		비밀번호 : <input type="text" name="pwd"><br>
		이메일 : <input type="text" name="email1">@
		<input type="text" name="email2"><br>
		전화번호 : <input type="text" name="tel1">-
		<input type="text" name="tel2">-
		<input type="text" name="tel3"><br>
		생일 : <input type="text" name="birth"><br>
		성별 : <input type="radio" name="gender" value="M">남자
		<input type="radio" name="gender" value="F">여자
		
		<input type="submit" value="가입">
	</form>
<%@ include file="../library/libraryBottom.jsp"%>