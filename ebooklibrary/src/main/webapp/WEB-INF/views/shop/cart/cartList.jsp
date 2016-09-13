<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../library/libraryTop.jsp"%>
<script type="text/javascript">
$(function() {
	$("#btnBuy").click(function() {
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
		        alert(msg);
		    }
		});//IMP.request_pay
	})//click
});//ducument.ready

</script>
<h2>장바구니</h2>

<table border="1px"
summary="장바구니 목록에 관한 표로서 책제목,작가,대여일,가격등의 정보를 제공합니다">
	<caption>장바구니 목록</caption>
	<colgroup>
		<col width="40%"><col>
		<col width="10%"><col>
		<col width="10%"><col>
		<col width="20%"><col>
		<col width="10%"><col>		
	</colgroup>
	<thead>
		<tr>
			<th scope="col">책제목</th>
			<th scope="col">작가</th>
			<th scope="col">대여기간</th>
			<th scope="col">대여만료일</th>
			<th scope="col">가격</th>			
		</tr>
	</thead>
	<tbody>
		<c:if test="${empty cartList }">
				<tr class="align_center">
					<td colspan="4">
						장바구니가 비었습니다.
					<td>
				</tr>
			</c:if>
			<c:if test="${!empty cartList }">				
				<c:set var="totalPrice" value="0" />
				<c:set var="totalSum" value="0" />
				<c:forEach var="map" items="${cartList }">
					<c:set var="sum" value="${map['SELLPRICE']*map['QUANTITY'] }" />
					<tr class="align_center">
						<td class="align_left">
							<img alt="${map['TITLE']}" 
							src="<c:url value='/pd_images/${map["COVER_FILE_NAME"] }'/>"
							width="50" align="absmiddle">
							${map['TITLE'] }
						</td>
						<td class="align_right">
							${map['WRITER'] }
						</td>
						<td>
							${map['RENT_DATE'] }일
						</td>
						<td>
						${map['RENT_END'] }
							
							일
						</td>												
						<td class="align_right">
						<fmt:formatNumber 
						value="${map['PRICE']}" pattern="#,###"/>원						
						</td>						
					</tr>
					<!-- 장바구니 상품 가격들 -->
					<c:set var="totalPrice" value="${totalPrice+map['PRICE'] }" />
				</c:forEach>
				<tr>
					<td colspan="4" class="align_right" style="border-right: none;">
						총 구매금액 : <br>
					</td>
					<td class="align_right" style="border-left: none;">
						<fmt:formatNumber value="${totalPrice }" 
						pattern="#,###"/>원<br>						
					</td>
				</tr>		
			</c:if>
	</tbody>  
</table>
<div class="align_center" style="margin: 10px 0">
    <p class="titleP">
    	<img src="${pageContext.request.contextPath}/images/dot7.JPG" align="absmiddle" />
    	<span class="title">결제 정보</span>
    </p>
    <p>
        <span class="sp1">결제금액</span>
        <span><fmt:formatNumber value="${totalPrice }" 
						pattern="#,###"/>원</span>
    </p>
    <c:if test="${!empty cartList }">
    <p class="center">
        <input type="button" id="btnBuy" value="결제하기"  />
    </p>
    </c:if>
    <a href="#">[계속 쇼핑하기]</a>
</div>

	<!-- 주문 총 금액 hidden field -->
	<input type="hidden" name="totalPrice" 
	id="totalPrice" value="${totalPrice }" >
	<input type="hidden" name="userId" 
	id="userId" value="${memberVo.userId }" >
	<input type="hidden" name="userName" 
	id="userName" value="${memberVo.userName }" >
	<input type="hidden" name="userHp" 
	id="userHp" value="${memberVo.hp1}-${memberVo.hp2}-${memberVo.hp3}" >



<%@include file="../../library/libraryBottom.jsp"%>