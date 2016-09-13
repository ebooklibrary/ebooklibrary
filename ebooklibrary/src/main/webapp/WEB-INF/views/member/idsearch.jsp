<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 찾기</title>
</head>
<body>
	<h1>아이디 찾기</h1>
	
	<form action="" method="post">
	<label for="userName">이름</label>
	<input type="text" name="userName" id="userName"><br>
	<label for="birth">생일</label>
	<input type="text" name="birth" id="birth"><br>
	<label for="gender">성별</label>
	<input type="radio" name="gender" value="M" checked="checked">남자
	<input type="radio" name="gender" value="F" >여자<br>
	<label for="hp">전화번호</label>
		<select name="hp1" id="hp1">
			<option value="010">010</option>
			<option value="011">011</option>
			<option value="016">016</option>			
			<option value="017">017</option>			
			<option value="019">019</option>			
		</select>-
	<input type="text" name="hp2" id="hp2" size="4">-
	<input type="text" name="hp3" id="hp3" size="4"><br>
	<input type="submit" value="찾기">
	</form>
	<c:if test="${empty result}">
		<span>검색결과가 없습니다</span>
	</c:if>
	<c:if test="${!empty result}">
		<span>아이디 : ${result }</span>
	</c:if>
</body>
</html>