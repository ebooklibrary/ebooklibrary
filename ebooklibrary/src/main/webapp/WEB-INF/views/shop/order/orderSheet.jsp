<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../library/libraryTop.jsp"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style type="text/css">
	.cartListTbl{
		width:650px;		
	}
	.cartListTbl td{
		padding:10px;
	}
	.cartListTbl caption{
		visibility:hidden;
	}
	.cartListDiv1{
		width:650px;
		text-align:center;		
		margin:10px;
	}
	
	
	.divForm fieldset	{
		width: 100%;
	}
	.divForm span{
		font-size:0.9em; 
	}	
	.divForm legend	{
		visibility:hidden;
		font-size:0.1em;
		}	
	.divForm label, .divForm .sp1	{
		text-align: left;
	}
	.divForm .title{
		font-size:1.1em;
		font-weight:bold;	
	}
	.divForm .titleP, .titleP{
		margin:10px 0;	
		border: none;
	}
	.divForm .lbl{
		float: none;
		text-align: left;
		padding: 3px 0;
		clear: both;		
		font-weight: bold;
		}
	.divForm p	{
		clear: both;
		border-bottom: 1px solid #eee;
		padding: 5px 0;
		margin: 0;
		overflow: auto;
		}
</style>
<script type="text/javascript">
	
	
</script>
<p class="titleP">  
	<img src="<c:url value='/images/dotLong3.JPG'/>" align="absmiddle" />
    <span style="font-size:13pt;font-weight:bold">주문서 작성</span>
</p>  

<div>
    <table class="cartListTbl box2" 
	summary="장바구니 목록에 관한 표로써, 상품명,가격, 수량, 금액 등의 정보를 제공합니다.">
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
</div>       
<br />

    
<%@ include file="../../library/libraryBottom.jsp"%>  