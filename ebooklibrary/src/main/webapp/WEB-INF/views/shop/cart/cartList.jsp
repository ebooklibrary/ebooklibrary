<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../../library/libraryTop.jsp"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/library/cartList.css" />
<!-- 달력 from jquery ui -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>

<script type="text/javascript">
$(function() {
	
	$("#btnBuy").click(function() {
		var radioChk=$('input:radio[name="payment"]').is(":checked");
		if (radioChk==false) {
			alertify.alert("결제 방식을 선택하여 주십시오.");
			return false;
		}
		
		if ($("#agreement").is(":checked")==false) {
			alertify.alert("동의를 하셔야 합니다.");
			return false;
		}
		
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
		    amount : $("#totalPrice").val(),
		    buyer_email : ''+$("#userId").val(),
		    buyer_name : ''+$("#userName").val(),			   
		    buyer_tel : ''+$("#userHp").val(),
		}, function(rsp) {
		    if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
		        location.href="";
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		        alertify.alert(msg);
		    }
		});//IMP.request_pay
	})//click
	/* 
	$("#frm").submit(function() {
		if ($("#period").val()<1) {
			
		}
	});
	 */
	 
	/* 대여 구매 구분 */
		/* var test=$(this).parent().parent().parent().find(".price").val(); */
		/* 
		$(".rentDateP").hide();
		$(".rentPriceP").hide();
		$(".buySpan, .rentSpan").css("font-weight",'bold');
		$(".buySpan, .rentSpan").css("font-size",'1.2em');
		$(".buySpan, .rentSpan").css("border","1px solid pink");
		 */
	$(".buySpan").click(function() {
		$(this).css("font-weight",'bold');
		$(this).css("font-size",'1.2em');
		$(this).css("border","1px solid pink");
		$(this).parent().find(".rentSpan").css("font-size",'');
		$(this).parent().find(".rentSpan").css("font-weight",'');
		$(this).parent().find(".rentSpan").css("border",'');
		$(this).parent().parent().parent().find(".rentDateP").hide();
		/* 
		$(this).parent().parent().parent().find(".rentDate").val("");
		$(this).parent().parent().parent().find(".rentPrice").text("");
		 */
		$(this).parent().parent().parent().find(".rentDate").attr("name","");
		 
		$(this).parent().parent().parent().find(".rentPriceP").hide();
		$(this).parent().parent().parent().find(".buyPriceP").show();
	});
		
	$(".rentSpan").click(function() {
		$(this).css("font-weight",'bold');
		$(this).css("font-size",'1.2em');
		$(this).css("border","1px solid pink");
		$(this).parent().find(".buySpan").css("font-size",'');
		$(this).parent().find(".buySpan").css("font-weight",'');
		$(this).parent().find(".buySpan").css("border",'');
		$(this).parent().parent().parent().find(".rentDate").attr("name","rentDate");
		$(this).parent().parent().parent().find(".rentDateP").show();
		$(this).parent().parent().parent().find(".rentPriceP").show();
		$(this).parent().parent().parent().find(".buyPriceP").hide();
		
	});
	
	$(".btRent").click(function() {
		
		var rentdate=$(this).parent().find(".rentDate").val();
		var result=numberWithCommas(rentdate*100);
		$(this).parent().parent().parent().find(".rentPrice").text(result);
	});
	
	$(".btRent").click(function() {
		$.ajax({
			url:"<c:url value='/shop/cart/updateCart.do'/>",
			type:"POST",
			data: "cartNo="+$(this).parent().find(".cartNo").val()+"&rentDate="+$(this).parent().find(".rentDate").val(),
			/* data: $(this).serializeArray(), */
			success:function(res){
				/* location.reload(); */
				$(location).attr('href', '<c:url value='/shop/cart/cartList.do'/>');
			},
			error:function(xhr, status, error){
				alertify.alert(status+":"+error);
			}
		});
	});
	$(".buySpan").click(function() {
		$.ajax({
			url:"<c:url value='/shop/cart/updateCart.do'/>",
			type:"POST",
			data: "cartNo="+$(this).parent().parent().parent().find(".cartNo").val()+"&rentDate=0",
			success:function(res){
				$(location).attr('href', '<c:url value='/shop/cart/cartList.do'/>');
			},
			error:function(xhr, status, error){
				alertify.alert(status+":"+error);
			}
		});
	});
	
	
	$(".deleteP").click(function() {
		$.ajax({
			url:"<c:url value='/shop/cart/delCart.do'/>",
			type:"GET",
			data: "cartNo="+$(this).parent().parent().find(".cartNo").val(),
			/* data: $(this).serializeArray(), */
			success:function(res){
				location.reload();
			},
			error:function(xhr, status, error){
				alertify.alert(status+":"+error);
			}
		});
	});
	
	$(".buyNowP").click(function() {
		$(this).parent().parent().find(".frmPurchase").submit();
	});
	
	/* 결제 가격 */
	$("#btCash").click(function() {
		var cash="${memberVo.cash }";
		var totPrice=$("#totPriceInput").val();
		
		if (cash>0) {
			var res=totPrice-cash;
			var result=numberWithCommas(res);
			$("#totalPrice").val(res);
			$("#finalPriceSpan").text(result+" 원");
		}else{
			$("#totalPrice").val(totPrice);
		}
	});
	$("#btCashCancel").click(function() {
		var totPrice=$("#totPriceInput").val();
		$("#totalPrice").val(totPrice);
		var result=numberWithCommas(totPrice);
		$("#finalPriceSpan").text(result+" 원");
	});
	
	
	$('input:radio[name="payment"]').click(function() {
		var payment=$(this).val();
	});
	
	
});//ducument.ready

function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

</script>
<p id="cartP">장바구니 목록
	<c:if test="${empty cartList }">
		<span>0</span>
	</c:if>
	<c:if test="${!empty cartList }">
		<span>${cartList.size() }</span>
	</c:if>
	<label for="purDiv" id="purTitle">주문 / 결제</label>
</p>
<table id="cartTable" summary="장바구니 목록에 관한 표로서 책제목,작가,대여일,가격등의 정보를 제공합니다">
	<caption>장바구니 목록</caption>
	<colgroup>
		<col width="30%">
		<col width="10%">
		<col width="10%">
		<col width="10%">		
		<col width="10%">		
	</colgroup>
	<thead>
		<tr>
			<th scope="col">책제목</th>
			<th scope="col">작가</th>
			<th scope="col">대여기간</th>
			<th scope="col">가격</th>			
			<th scope="col">선택</th>			
		</tr>
	</thead>
	<tbody id="cartTbody">
		<c:if test="${empty cartList }">
				<tr>
					<td colspan="4">
						장바구니가 비었습니다.
					<td>
				</tr>
			</c:if>
			<c:if test="${!empty cartList }">				
				<c:set var="totalPrice" value="0" />
				<c:set var="totalSum" value="0" />
				
				<c:forEach var="map" items="${cartList }">
					<c:if test="${!empty map['RENT_DATE'] }">
						<c:set var="rentSum" value="${map['RENT_DATE']*100 }" />
					</c:if>
					<%-- 
					<c:if test="${!empty map['RENT_DATE'] && map['RENT_DATE']!=0 }">
						<c:set var="sum" value="${map['SELLPRICE']*map['QUANTITY'] }" />
					</c:if>
					 --%>
					<tr>
						<td>
							<img alt="${map['TITLE']}" src="<c:url value='/book_upload/${map["COVER_FILE_NAME"] }'/>" width="50" align="absmiddle">
							${map['TITLE'] }
						</td>
						
						<td>
							${map['WRITER'] }
						</td>
						
						<td>
							<form action="<c:url value='/shop/cart/bookPurchase.do'/>" name="frmPurchase" class="frmPurchase" method="post">
							<p class="rentDateP" 
							<c:if test="${empty map['RENT_DATE'] || map['RENT_DATE']==0 }">
							style="display: none"
							</c:if>
							>
								<input type="hidden" value="${map['CART_NO'] }" name="cartNo" class="cartNo">
								<input type="text" class="rentDate" name="rentDate" value="${map['RENT_DATE'] }"> 일
								<input type="button" name="btRent" class="btRent" value="변경">
							</p>
							</form>
						</td>
						
						<td>
							<p class="buyPriceP"
							<c:if test="${!empty map['RENT_DATE'] && map['RENT_DATE']!=0 }">
								style="display: none"
							</c:if>
								>
							<fmt:formatNumber value="${map['PRICE']}" pattern="#,###"/>원</p>
							
								<p class="rentPriceP" 
							<c:if test="${empty map['RENT_DATE'] || map['RENT_DATE']==0 }">
								style="display: none"
							</c:if>
								>
								<span class="rentPrice">${rentSum }</span>원</p>
							<input type="hidden" name="price" class="price" value="${map['PRICE']}">
						</td>
						
						<td class="choiceSpan">
							<p class="deleteP">삭제</p>
							<p class="buyNowP">바로구매</p>
							<p>
							<!-- 구매 -->
							<c:if test="${empty map['RENT_DATE'] || map['RENT_DATE']==0 }">
								<span class="buySpan"
									style="font-weight: bold;font-size:1.2em;border:1px solid pink;"
								>구매</span> / <span class="rentSpan">대여</span> 
							</c:if>
							<!-- 대여 -->
							<c:if test="${!empty map['RENT_DATE'] && map['RENT_DATE']!=0 }">
								<span class="buySpan">구매</span> / <span class="rentSpan"
								style="font-weight: bold;font-size:1.2em;border:1px solid pink;"
								>대여</span>
							</c:if>
							</p>
						</td>						
					
					</tr>
					<!-- 장바구니 상품 가격들 -->
					<c:if test="${!empty map['RENT_DATE'] && map['RENT_DATE']!=0 }">
						<c:set var="totalPrice" value="${totalPrice+rentSum }" />
					</c:if>
					<c:if test="${empty map['RENT_DATE'] || map['RENT_DATE']==0 }">
						<c:set var="totalPrice" value="${totalPrice+map['PRICE'] }" />
					</c:if>
				</c:forEach>
				
				
				<tr>
					<td colspan="4" style="border-right: none; text-align: right;">
						<a href="<c:url value='/admin/book/bookList.do'/>" id="goToShop">[계속 쇼핑하기]</a>
						총 구매금액 : <br>
					</td>
					<td style="border-left: none;">
						<fmt:formatNumber value="${totalPrice }" pattern="#,###"/>원<br>
					</td>
				</tr>		
			</c:if>
	</tbody>  
</table>


<!-- 결제 정보 디브 -->
<!-- <label for="purDiv" id="purTitle">주문 / 결제</label> -->
<div id="purDiv">
    <p class="titleP">
    	<span class="title">구매자 정보</span>
    </p>
    <div id="userInfoDiv">
    	<p>
    		<span class="sp1">이름</span>
    		<span>${memberVo.userName }</span>
    	</p>
    	<p>
    		<span class="sp1">이메일</span>
    		<span>${memberVo.userId }</span>
    	</p>
    	<p>
    		<span class="sp1">휴대폰 번호</span>
    		<c:if test="${!empty memberVo.hp1 }">
    			<span>${memberVo.hp1 } - ${memberVo.hp2 } - ${memberVo.hp3 }</span>
    		</c:if>
    	</p>
    </div>
	        <c:set var="finalPrice" value="0" />
    <p class="titleP">
    	<%-- <img src="${pageContext.request.contextPath}/images/dot7.JPG" align="absmiddle" /> --%>
    	<span class="title">결제 정보</span>
    </p>
    <div id="purInfoDiv">
	    <p>
	        <span class="sp1">총상품금액</span>
	        <span><fmt:formatNumber value="${totalPrice }" pattern="#,###"/> 원</span>
	        <input type="hidden" id="totPriceInput" value="${totalPrice }">
	    </p>
	    <p>
	        <span class="sp1">북캐시</span>
	        <span><fmt:formatNumber value="${memberVo.cash }" pattern="#,###"/> 원</span>
	        <input type="button" class="btCash" id="btCash" value="캐시 적용">
	    </p>
	    <p>
	        <span class="sp1">총결제금액</span>
	        <span id="finalPriceSpan"><fmt:formatNumber value="${totalPrice }" pattern="#,###"/> 원</span>
	        <input type="button" class="btCash" id="btCashCancel" value="캐시 적용 취소">
	        <%-- <span><fmt:formatNumber value="${totalPrice }" pattern="#,###"/>원</span> --%>
	    </p>
	    <p>
	        <span class="sp1">결제방법</span>
	        <span>
	        	<input type="radio" name="payment" id="cash" value="cash">
	        	<label for="cash">북캐시</label>
	        	<input type="radio" name="payment" id="card" value="card">
	        	<label for="card">신용/체크카드</label>
	        </span>
	    </p>

	    
    </div>
    
    <textarea readonly="readonly">
    	개인정보 제 3자 제공 동의

회원의 개인정보는 당사의 개인정보취급방침에 따라 안전하게 보호됩니다.
“회사”는 이용자들의 개인정보를 "개인정보 취급방침의 개인정보의 수집 및 이용목적"에서 
고지한 범위 내에서 사용하며, 이용자의 사전 동의 없이는 동 범위를 초과하여 이용하거나 
원칙적으로 이용자의 개인정보를 외부에 공개하지 않습니다.
회사가 제공하는 서비스를 통하여 주문 및 결제가 이루어진 경우 구매자 확인 및 해피콜 등 
거래이행을 위하여 관련된 정보를 필요한 범위 내에서 거래 업체에게 제공합니다.

※ 동의 거부권 등에 대한 고지
개인정보 제공은 서비스 이용을 위해 꼭 필요합니다. 개인정보 제공을 거부하실 수 있으나, 
이 경우 서비스 이용이 제한될 수 있습니다.
    </textarea>
    
    <p>
	    <input type="checkbox" name="agreement" id="agreement">
	    <label for="agreement">본인은 개인정보 제3자 제공 동의에 관한 내용을 모두 이해하였으며 이에 동의합니다.</label>
    </p>
    
	<c:if test="${!empty cartList }">
		<p id="btBuyP">
			<input type="button" id="btnBuy" value="결제하기"  />
		</p>
	</c:if>
    
</div>

	<!-- 주문 총 금액 hidden field -->
	<input type="hidden" name="totalPrice" 
	id="totalPrice">
	<input type="hidden" name="userId" 
	id="userId" value="${memberVo.userId }" >
	<input type="hidden" name="userName" 
	id="userName" value="${memberVo.userName }" >
	<input type="hidden" name="userHp" 
	id="userHp" value="${memberVo.hp1}-${memberVo.hp2}-${memberVo.hp3}" >



<%@include file="../../library/libraryBottom.jsp"%>