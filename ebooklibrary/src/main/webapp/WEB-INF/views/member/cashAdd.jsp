<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>북코인 충전</title>

<script type="text/javascript" src="<c:url value='/jquery/jquery-3.1.0.min.js'/>"></script>
<!-- alert -->
<!-- ideally at the bottom of the page -->
<!-- also works in the <head> -->
<%-- <c:url value='/alertify.js-0.3.11/themes/alertify.core.css'/> --%>
<script src="<c:url value='/alertify.js-0.3.11/lib/alertify.min.js'/>"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.1.js"></script>
<script type="text/javascript">
	$(function() {
		$("#cashadd").click(function() {
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
	<!-- 
	<input type="radio" name="cash" value="3000" id="3000" checked="checked">
	<label for="3000">3000코인 </label>
	
	<input type="radio" name="cash" value="5000" id="5000">
	<label for="5000">5000코인 </label>
	
	<input type="radio" name="cash" value="10000" id="10000">
	<label for="10000">10000코인 </label>
	
	<input type="radio" name="cash" value="20000" id="20000">
	<label for="20000">20000코인 </label>
	
	<input type="radio" name="cash" value="30000" id="30000">
	<label for="30000">30000코인 </label>	
	
	<input type="radio" name="cash" value="1" id="self">
	<label for="self">직접입력 </label> -->
	<input type="text" id="cashwrite">
	<br>
	<button id="cashadd">북코인 충전</button>
	
	<input type="hidden" id="userId" name="userId" value="${vo.userId }">
	<input type="hidden" id="userName" name=userName value="${vo.userName }">
</body>
</html>