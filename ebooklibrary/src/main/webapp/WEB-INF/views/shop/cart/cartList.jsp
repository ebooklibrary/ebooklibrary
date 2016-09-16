<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../../library/libraryTop.jsp"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/library/cartList.css" />
<!-- 달력 from jquery ui -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>

<script type="text/javascript">
$(function() {
	
	$("#rentEnd").datepicker({
			dateFormat:"yy/mm/dd",
			changeMonth: true,
			changeYear:true,
			dayNamesMin:['일','월','화','수','목','금','토'],
			monthNames:['1월','2월','3월','4월','5월','6월',
			            '7월','8월','9월','10월','11월','12월']
		});
	// Getter
	var monthNamesShort = $( "#rentEnd" ).datepicker( "option", "monthNamesShort" );
	// Setter
	$( "#rentEnd" ).datepicker( "option", "monthNamesShort", ['1월','2월','3월','4월','5월','6월',
	                                   			            '7월','8월','9월','10월','11월','12월'] );
 
	
	
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
	/* 
	$("#frm").submit(function() {
		if ($("#period").val()<1) {
			
		}
	});
	 */
	$(".buySpan").click(function() {
		var test=$(this).parent().next().find(".rentPrice").val();
		alert(test);
	});
	var money=0;
	$(".btRent").click(function() {
		
		var price=$(this).parent().find(".rentDate").val();
		var result=numberWithCommas(price*100);
		$(this).parent().next().find("span").text(result);
	});
	
	$(".buySpan").click(function() {
		$(this).css("font-weight",'bold');
	});
	$(".rentSpan").click(function() {
		$(this).css("font-weight",'bold');
	});
	
	
	
});//ducument.ready

function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

</script>
<h2>장바구니</h2>

<table id="cartTable" summary="장바구니 목록에 관한 표로서 책제목,작가,대여일,가격등의 정보를 제공합니다">
	<caption>장바구니 목록</caption>
	<colgroup>
		<col width="20%">
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
					<c:set var="sum" value="${map['SELLPRICE']*map['QUANTITY'] }" />
					<tr>
						<td>
							<img alt="${map['TITLE']}" src="<c:url value='/book_upload/${map["COVER_FILE_NAME"] }'/>"
							width="50" align="absmiddle">
							${map['TITLE'] }
						</td>
						<td>
							${map['WRITER'] }
						</td>
						<%-- 
						<td id="period">
							${map['RENT_DATE'] }일
						</td>
						<c:if test="${!empty map['RENT_END'] }">
							${map['RENT_END'] }일
						</c:if>
						 --%>
						<td>
							<input type="text" id="rentDate" class="rentDate" name="rentDate"> 일
							<input type="button" name="btRent" class="btRent" value="변경">
						</td>
						
						<!-- <input type="text" id="rentEnd" name="rentEnd" readonly> -->
						
						<td>
							<fmt:formatNumber value="${map['PRICE']}" pattern="#,###"/>원
							<span class="rentPrice"></span>원
							<input type="text" name="price" class="price">
													
						</td>
						<td>
						<p class="deleteP">삭제</p>
						<p class="buyNowP">바로구매</p>
						<p><span class="buySpan">구매</span> / <span class="rentSpan">대여</span></p>
						
						</td>						
					</tr>
					<!-- 장바구니 상품 가격들 -->
					<c:set var="totalPrice" value="${totalPrice+map['PRICE'] }" />
				</c:forEach>
				<tr>
					<td colspan="4" style="border-right: none; text-align: right;">
						총 구매금액 : <br>
					</td>
					<td style="border-left: none;">
						<fmt:formatNumber value="${totalPrice }" 
						pattern="#,###"/>원<br>						
					</td>
				</tr>		
			</c:if>
	</tbody>  
</table>
<div style="margin: 10px 0">
    <p class="titleP">
    	<%-- <img src="${pageContext.request.contextPath}/images/dot7.JPG" align="absmiddle" /> --%>
    	<span class="title">결제 정보</span>
    </p>
    <p>
        <span class="sp1">결제금액</span>
        <span><fmt:formatNumber value="${totalPrice }" 
						pattern="#,###"/>원</span>
    </p>
    <c:if test="${!empty cartList }">
    <p>
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