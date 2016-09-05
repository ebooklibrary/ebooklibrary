<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../library/libraryTop.jsp" %>
<script type="text/javascript">
	$(function() {
		
	});//document.ready
	
	function validate_userid(userid) {
		var pattern=new RegExp(/^[a-zA-Z0-9_]+$/g);
		return pattern.test(userid);
		/*
		정규식 /^[a-zA-Z0-9_]+$/g
		a에서 z,A에서 Z,0에서 9사이의 숫자나 _로 시작하거나 끝나야 한다는 의미
		닫기 대괄호(]) 뒤의 +기호는 이 패턴이 한번 또는 그 이상 반복된다는 의미
		*/
	}

</script>

	<h1>회원가입</h1>
	<form action="<c:url value='/member/register.do'/>" method="post">
		아이디 : <input type="text" name="userId"><br>
		이름 : <input type="text" name="userName"><br>
		비밀번호 : <input type="text" name="pwd"><br>		
		전화번호 : <input type="text" name="hp1">-
		<input type="text" name="hp2">-
		<input type="text" name="hp3"><br>
		생일 : <input type="text" name="birth"><br>
		성별 : <input type="radio" name="gender" value="M">남자
		<input type="radio" name="gender" value="F">여자<br>
		
		
		<input type="submit" value="가입">
	</form>
<%@ include file="../library/libraryBottom.jsp"%>