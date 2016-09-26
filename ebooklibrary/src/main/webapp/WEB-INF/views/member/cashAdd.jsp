<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>북코인 충전</title>

<script type="text/javascript" src="<c:url value='/jquery/jquery-3.1.0.min.js'/>"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/library/member.css" />
<!-- alert -->
<!-- ideally at the bottom of the page -->
<!-- also works in the <head> -->
<%-- <c:url value='/alertify.js-0.3.11/themes/alertify.core.css'/> --%>
<script src="<c:url value='/alertify.js-0.3.11/lib/alertify.min.js'/>"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.1.js"></script>
<script type="text/javascript">
	$(function() {
		$("#cashButton").click(function() {
			$.ajax({
				url:"<c:url value='/cash/cashAddOk.do'/>",
				data:"userId=${sessionScope.userId}&cash="+$('#cashwrite').val(),
				type:"post",
				success:function(res){
					if(res>0){						
						var IMP = window.IMP;
						IMP.init('imp52577413'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용.
						
						IMP.request_pay({
						    pg : 'inicis', // version 1.1.0부터 지원. 
						        /*
						            'kakao':카카오페이,
						            'inicis':이니시스, 'html5_inicis':이니시스(웹표준결제), 
						            'nice':나이스, 
						            'jtnet':jtnet, 
						            'uplus':LG유플러스,
						            'danal':다날
						        */
						    pay_method : 'card', // 'card':신용카드, 'trans':실시간계좌이체, 'vbank':가상계좌, 'phone':휴대폰소액결제
						    merchant_uid : 'merchant_' + new Date().getTime(),
						    name : '포도서관',
						    amount : $("#cashwrite").val(),
						    buyer_email : ''+$("#userId").val(),
						    buyer_name : ''+$("#userName").val(),
						}, function(rsp) {
						    if ( rsp.success ) {
						    	//결제후 정보
						    	 var imp_uid= rsp.imp_uid; //고유아이디
						         var merchant_uid= rsp.merchant_uid; //상점거래ID
						         var paid_amount= rsp.paid_amount; //결제가격
						         var apply_num= rsp.apply_num;	//카드승인번호
						         
						    	$.ajax({
									url:"<c:url value='/cash/cashCharge.do'/>",
									data:"impUid="+imp_uid+"&merchantUid="+merchant_uid
									+"&userid=${sessionScope.userId}&price="+paid_amount
									+"&applyNum="+apply_num,
									type:"POST",
									success:function(res){
										alert('결제가 완료되었습니다.');
										window.opener.location.reload();
										window.close();
									},error: function(xhr,status, error){
										$.ajax({
											url:"<c:url value='/cash/cashMinusOk.do'/>",
											data:"userId=${sessionScope.userId}&cash="+$('#cashwrite').val(),								
											type:"POST",
											success:function(res){
												alert('결제실패');
											},error: function(xhr,status, error){
												alert("에러발생 - "+status +":" + error);
											}
										});//ajax
									}
								});//ajax
								  
						    } else {
						    	$.ajax({
									url:"<c:url value='/cash/cashMinusOk.do'/>",
									data:"userId=${sessionScope.userId}&cash="+$('#cashwrite').val(),								
									type:"POST",
									success:function(res){
										alert('결제실패');
									},error: function(xhr,status, error){
										alert("에러발생 - "+status +":" + error);
									}
								});
						    }
						});//IMP.request_pay
					}else{
						alert('충전 db작업 실패')
					}
				},error: function(xhr,status, error){
					alert("에러발생 - "+status +":" + error);		
				}
			});//ajax	
			
		});
			
	})//jquery
	
	function closeSelf(){
		opener.location.reload();
		self.close();
	}
	
</script>

</head>
<body>
	<div id="cashContainer">
	<h1>북코인 충전하기</h1>
		<div id="cashAdd">			
			<div class="cashInfo">고객정보</div>		
			<div class="cashMenu">회원아이디</div>
			<div class="cashval">${vo.userId }</div>
			<div class="cashMenu">회원이름</div>
			<div class="cashval">${vo.userName }</div>
			<div class="cashMiddle">
				<span class="cashHave" style="background-color: #EBFBFF">현재 보유한 북코인</span>
				<span class="cashBook">${vo.cash } 코인</span>
			</div>		  	
		</div>
		<div id="cashCharge">
			<div>북코인 충전하기</div>
			<div>
				<span>북코인충전은 신용/체크카드로 충전이 가능합니다</span>
				<div class="cashch">
					충전할 금액 <input type="text" id="cashwrite" size="7">					
				</div>
			</div>
		</div><br>
		<div><button id="cashButton">북코인 충전</button></div>
			
		<input type="hidden" id="userId" name="userId" value="${vo.userId }">
		<input type="hidden" id="userName" name=userName value="${vo.userName }">
	</div>
</body>
</html>