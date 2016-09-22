<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../library/libraryTop.jsp" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/library/loginForm.css" />

<%@ include file="mypageRightMenu.jsp" %>
<script type="text/javascript">
	$(function() {
		
		$("#regForm").submit(function() {
			if($("#pwd").val()!=$("#pwd2").val()){
				alertify.alert("두 비밀번호가 다릅니다");
				return false;
			}
		});
		
	});
</script>
    
<div id="regiWrapper" class="FormWrapperDiv">
<p id="titlePtag">비밀번호 변경</p>
	<form action="<c:url value='/member/pwdChange.do'/>" method="post" id="regForm">
	<label for="userName">변경할 비밀번호</label>
	<input type="password" name="pwd" id="pwd"><br>
	<label for="userName">비밀번호 확인</label>
	<input type="password" id="pwd2"><br>
	
	<input type="submit" id="chgSubmit" value="비밀번호 변경">
	</form>
</div>



<%@ include file="../library/libraryBottom.jsp" %>