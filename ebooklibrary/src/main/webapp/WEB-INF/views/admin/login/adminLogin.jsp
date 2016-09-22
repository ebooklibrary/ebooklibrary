<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../libraryAdminTop.jsp" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/library/loginForm.css" />
<script type="text/javascript">
$(function() {
	
})//document.ready


</script>
<div id="loginWrapper" class="FormWrapperDiv">
		<p id="titlePtag">관리자 로그인</p>
		<form action="" method="post">
			아이디 : <input type="text" name="userId">
			비밀번호 : <input type="password" name="pwd">
			<input type="hidden" name="authCode" value='ADMIN'>
			<input type="submit" id="loginSubmitBt" value="로그인">
		</form>
</div>
<%@ include file="../libraryAdminBottom.jsp" %>