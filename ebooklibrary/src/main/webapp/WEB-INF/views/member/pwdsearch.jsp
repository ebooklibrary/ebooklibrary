<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 찾기</title>
<script type="text/javascript" src="<c:url value='/jquery/jquery-3.1.0.min.js'/>"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/library/loginForm.css" />
<script type="text/javascript">
$(function() {
	$("#searchPwd").submit(function() {
		if(!validate_userid($("#userId").val())){
			alert("아이디(이메일)을 입력해주세요")
			$("#userId").focus();
			return false;
		}
	})	
});
	
function validate_userid(userid) {
	var pattern=new RegExp(/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/);
	return pattern.test(userid);		
}
</script>
</head>
<body>
	<h1>비밀번호 찾기</h1>
	<form action="" method="post" id="searchPwd">
		<label for="userId">아이디(이메일)</label>
		<input type="text" name="userId" id="userId"><br>
		<input type="submit" value="이메일에 비밀번호 보내기">
	</form>
</body>
</html>