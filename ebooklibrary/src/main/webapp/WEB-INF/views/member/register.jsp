<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../library/libraryTop.jsp" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/library/loginForm.css" />
<!-- 달력 from jquery ui -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css">
<script type="text/javascript" src="<c:url value='/js/common.js'/>"></script>
<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
<script type="text/javascript">
	$(function() {
		
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
		
		$("#regForm").submit(function() {
			if($("#userName").val().length<1){
				alert("이름을 입력하세요");				
				$("#userName").focus();
				return false;
			}else if($("#pwd").val().length<1){
				alert("비밀번호를 입력하세요");				
				$("#pwd").focus();
				return false;
			}else if($("#pwd").val()!=$("#pwd2").val()){
				alert("두 비밀번호가 다릅니다");				
				$("#pwd2").focus();
				return false;
			}else if(!validate_birth($("#birth").val())){
				alert("생일을 입력해주세요");				
				$("#birth").focus();
				return false;
			}else if($("#chkId").val()!='Y'){
				alert("아이디를 다시확인해주세요");				
				$("#userId").focus();
				return false;
			}else if($("#emailStatus").val()!='Y'){
				alert("이메일 인증을 해주세요");
				return false;
			}
		});//submit
		$("#userId").keyup(function() {
			if(validate_userid($("#userId").val())){
				$.ajax({
					url:"<c:url value='/member/chkId.do'/>",
					data:"userId="+$("#userId").val(),
					type:"GET",
					success:function(res){
						var result="";
						if(res==1){
							result="이미 등록된 아이디 입니다.";
							$("#chkId").val('N');
						}else if(res==0){
							result="사용가능한 아이디 입니다.";
							$("#chkId").val('Y');
						}
						$("#message").html(result);
					},
					error:function(xhr,status,error){
						alert(status+":"+error);
					}
				});
			}else{
				//유효성 검사를 통과하지 못한경우
				$("#message").html("아이디에는 이메일을 적어주세요");
				$("#chkId").val('N');
			}
		});
		
		$("#btnEmail").click(function() {
			if($("#chkId").val()=='Y'){
				$.ajax({
					url:"<c:url value='/emailConfirm.do'/>",
					data:"receiver="+$("#userId").val(),
					type:"POST",
					success:function(res){
						alert(res);
						$("#btnEmailOk").click(function() {
							if(res==$("#confirm").val()){
								$("#emailconfirm").css("visibility","hidden");
								$("#emailOk").css("visibility","visible");
								$("#emailNo").css("visibility","hidden");
								$("#emailStatus").val("Y")
							}else{
								$("#emailNo").css("visibility","visible");
								$("#emailStatus").val("N")
							}
						})
					},
					error:function(xhr,status,error){
						alert(status+":"+error);
					}			
				})
			}else{
				alert("아이디를 확인해 주세요");
				$("#userId").focus();
			}//if
		})//btnEmail
	});//document.ready
	/* 
	function validate_userid(userid) {
		var pattern=new RegExp(/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/);
		return pattern.test(userid);		
	}
	function validate_birth(birth) {
		var pattern=new RegExp(/^[0-9]{6}$/);
		return pattern.test(birth);
	}
 */
</script>
<div id="regiWrapper" class="FormWrapperDiv">
	<p id="titlePtag">회원가입</p>
	<form action="<c:url value='/member/register.do'/>" method="post" id="regForm">
		<label for="userId">아이디(이메일)</label>
		<input type="text" name="userId" id="userId" placeholder="아이디는 이메일을 적어주세요"><br>
		<span id="message" style="color: red;"></span><br>
		
		<span id="emailconfirm">

		<!-- <span>이메일 인증하기</span> -->
		<input type="button" value="인증번호 발송" id="btnEmail"><br>

		<labal for="confirm">인증번호</labal>		
		<input type="text" name="confirm" id="confirm" size="10">
		<input type="button" value="확인" id="btnEmailOk">
		</span>
		<span id="emailOk" style="visibility: hidden;"> 인증되었습니다</span>
		<input type="hidden" id="emailStatus" value="N">
		<span id="emailNo" style="visibility: hidden;"> 인증번호를 다시 확인해주세요</span><br>
		
		<label for="userName">이름</label>
		<input type="text" name="userName" id="userName"><br>
		<label for="pwd">비밀번호</label>
		<input type="password" name="pwd" id="pwd"><br>	
		<label for="pwd2">비밀번호 확인</label>
		<input type="password" name="pwd2" id="pwd2"><br>
		<label for="hp" class="lineLabel">전화번호</label>
		<select name="hp1" id="hp1">
			<option value="010">010</option>
			<option value="011">011</option>
			<option value="016">016</option>			
			<option value="017">017</option>			
			<option value="019">019</option>			
		</select>
		<input type="text" name="hp2" id="hp2"> -
		<input type="text" name="hp3" id="hp3"><br>
		<label for="birth">생일</label>
		<input type="text" class="w3-input" name="birth" id="birth" readonly><br>
		<label for="gender" class="lineLabel">성별</label>
		<input type="radio" name="gender" value="M" checked="checked">남자
		<input type="radio" name="gender" value="F" >여자<br>
		<input type="hidden" name="chkId" id="chkId">
		
		<input type="submit" id="regiSubmit" value="가입">
	</form>
</div>
<%@ include file="../library/libraryBottom.jsp"%>