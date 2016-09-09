<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../library/libraryTop.jsp"%>
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
		<c:if test="${!empty cartList }">
			<a href="<c:url value='/shop/order/orderSheet.do'/>">[주문하기]</a>
		</c:if>
		<a href="#">[계속 쇼핑하기]</a>
</div>



<%@include file="../../library/libraryBottom.jsp"%>