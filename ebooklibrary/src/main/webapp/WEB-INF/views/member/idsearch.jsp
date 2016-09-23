<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 찾기</title>
<script type="text/javascript" src="<c:url value='/jquery/jquery-3.1.0.min.js'/>"></script>
<!-- 달력 from jquery ui -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css">
<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/library/loginForm.css" />

<script type="text/javascript">
$(document).ready(function() {
	
	 $("#birth").datepicker({
			dateFormat:"yymmdd",
			changeMonth: true,
			changeYear:true,
			dayNamesMin:['일','월','화','수','목','금','토'],
			monthNames:['1월','2월','3월','4월','5월','6월',
			            '7월','8월','9월','10월','11월','12월'],
	 		yearRange: '1900:2100'
	});
	 
	// Getter
	var monthNamesShort = $( "#birth" ).datepicker( "option", "monthNamesShort" );
	// Setter
	$( "#birth" ).datepicker( "option", "monthNamesShort", ['1월','2월','3월','4월','5월','6월',
	                                   			            '7월','8월','9월','10월','11월','12월'] );
});//document.ready
	
</script>

</head>
<body>
	<h1>아이디 찾기</h1>
	
	<form action="" method="post">
	<label for="userName">이름</label>
	<input type="text" name="userName" id="userName"><br>
	<label for="birth">생일</label>
	<input type="text" name="birth" id="birth" readonly="readonly"><br>
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