<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../library/libraryTop.jsp" %>
	<c:if test="${empty sessionScope.userId }">
		<h1>로그인 화면</h1>
		<form action="" method="post">
			아이디 : <input type="text" name="userId">
			비밀번호 : <input type="password" name="pwd">
			<input type="submit" value="로그인">
		</form><br>
		<a href="#">회원가입</a>
		<a href="#">아이디 찾기</a><br>
		<a href="#">비밀번호 찾기</a>
	
		
	</c:if>
	
	<c:if test="${!empty sessionScope.userId }">
		<h1>비밀번호를 한번 더 입력해주세요</h1>
		<form action="/member/myInfoChk.do" method="post">
			아이디 : <input type="text" name="userId" 
			value="${sessionScope.userId }" readonly="readonly">
			비밀번호 : <input type="password" name="pwd">
			<input type="submit" value="로그인">
		</form>
	</c:if>
<%@ include file="../library/libraryBottom.jsp" %>