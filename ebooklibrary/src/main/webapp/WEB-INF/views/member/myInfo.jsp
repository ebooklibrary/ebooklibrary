<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../library/libraryTop.jsp" %>
<!-- 달력 from jquery ui -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css">
<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/library/loginForm.css" />
<script type="text/javascript">
$(function() {
	
	 $("#birth").datepicker({
			dateFormat:"yymmdd",
			changeMonth: true,
			changeYear:true,
			dayNamesMin:['일','월','화','수','목','금','토'],
			monthNames:['1월','2월','3월','4월','5월','6월',
			            '7월','8월','9월','10월','11월','12월']
		});
	// Getter
	var monthNamesShort = $( "#birth" ).datepicker( "option", "monthNamesShort" );
	// Setter
	$( "#birth" ).datepicker( "option", "monthNamesShort", ['1월','2월','3월','4월','5월','6월',
	                                   			            '7월','8월','9월','10월','11월','12월'] );
	
});//document.ready
	

</script>



<div id="regiWrapper" class="FormWrapperDiv">
<p id="titlePtag">내정보 수정</p>
	<form action="<c:url value='/member/myInfo.do'/>" method="post" id="regForm">
	<label for="userName">이름</label>
	<input type="text" name="userName" id="userName" value=${memberVo.userName } readonly="readonly"><br>

	<label for="hp" class="lineLabel">전화번호</label>
	<select name="hp1" id="hp1">
		<option value="010"
			<c:if test="${memberVo.hp1==010 }">selected</c:if>
		>010</option>
		<option value="011"
			<c:if test="${memberVo.hp1==011 }">selected</c:if>
		>011</option>
		<option value="016"
			<c:if test="${memberVo.hp1==016 }">selected</c:if>
		>016</option>			
		<option value="017"
			<c:if test="${memberVo.hp1==017 }">selected</c:if>
		>017</option>			
		<option value="019"
			<c:if test="${memberVo.hp1==019 }">selected</c:if>
		>019</option>			
	</select>
	<input type="text" name="hp2" id="hp2" value=${memberVo.hp2 }>-
	<input type="text" name="hp3" id="hp3" value=${memberVo.hp3 }><br>
	<label for="birth">생일</label>
	<input type="text" name="birth" id="birth" value="${memberVo.birth }" readonly="readonly"><br>
	<label for="gender" class="lineLabel">성별</label>
	<input type="radio" name="gender" value="M" checked="checked">남자
	<input type="radio" name="gender" value="F" >여자<br>
	
	<input type="submit" id="chgSubmit" value="회원정보 수정">
	</form>
</div>

<%@ include file="mypageRightMenu.jsp" %>

<%@ include file="../library/libraryBottom.jsp" %>