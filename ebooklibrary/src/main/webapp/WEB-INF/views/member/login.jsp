<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../library/libraryTop.jsp" %>
<script type="text/javascript">
$(function() {
	$("#seachId").click(function() {				
		window.open("<c:url value='/member/idsearch.do'/>",
				"idsearch",
		"width=450,height=400,left=50,top=50,resizable=yes,location=yes");
		});
	
	$("#seachPwd").click(function() {				
		window.open("<c:url value='/member/pwdsearch.do'/>",
				"pwdsearch",
		"width=450,height=400,left=50,top=50,resizable=yes,location=yes");
		});
})//document.ready


</script>

	<c:if test="${empty sessionScope.userId }">
		<h1>로그인 화면</h1>
		<form action="" method="post">
			아이디 : <input type="text" name="userId">
			비밀번호 : <input type="password" name="pwd">
			<input type="submit" value="로그인">
		</form><br>
		<a href="<c:url value='/member/register.do'/>">회원가입</a><br>
		<button id="seachId">아이디 찾기</button>   
		<button id="seachPwd">비밀번호 찾기</button>   
	
		
	</c:if>
	
	<c:if test="${!empty sessionScope.userId }">
		<h1>비밀번호를 한번 더 입력해주세요</h1>
		<form action="<c:url value='/member/myInfoChk.do'/>" method="post">
			아이디 : <input type="text" name="userId" 
			value="${sessionScope.userId }" readonly="readonly">
			비밀번호 : <input type="password" name="pwd">
			<input type="submit" value="로그인">
		</form>
	</c:if>
<%@ include file="../library/libraryBottom.jsp" %>