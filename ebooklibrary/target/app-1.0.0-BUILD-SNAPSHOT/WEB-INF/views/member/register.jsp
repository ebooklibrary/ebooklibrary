<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<c:url value='/jquery/jquery-3.1.0.min.js'/>"></script>
<script type="text/javascript">

</script>
</head>
<body>
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
</body>
</html>