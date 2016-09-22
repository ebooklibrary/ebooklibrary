<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${sessionScope.adminAuchCode=='ADMIN' }">
	<%@include file="../../admin/libraryAdminTop.jsp"%>
</c:if>
<c:if test="${sessionScope.adminAuchCode!='ADMIN' }">
	<%@include file="../libraryTop.jsp"%>
</c:if>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/clear.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/library/bookDetail.css" />

<script type="text/javascript" src="<c:url value='/jquery/jquery-3.1.0.min.js'/>"></script>

<link rel="stylesheet" href="<c:url value='/css/jqueryui.css'/>">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>

<!-- 폼태그 -->
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<!-- common js -->
<script type="text/javascript" src="<c:url value='/js/common.js'/>"></script>
<script type="text/javascript">

	$(document).ready(function() {
		/* 장바구니 클릭시 메시지 */
		$(".cart").click(function() {
			if (${!empty sessionScope.userId }) {
				$(this).find(".popuptext").show().delay(2000)
				.queue(function (next) {
					$(this).hide();
					next();
				});
			}
		});
	});
	
</script>

	<div id="DetailBookDiv">
		<div id="DetailbookCover">
			<img alt="책 커버 이미지" src="<c:url value='/book_upload/${bookVo.coverFileName }'/>">
		</div>
		
		<div id="DetailBookInfo">
			<div id="DetailBooktitle" class="DetailBookInfo">${bookVo.title }</div>
			
			<div class="DetailBookInfo">
				<span id="DetailBookgenre">${bookVo.genre }</span>
				<span id="DetailBookwriter">${bookVo.writer } 지음</span>
				<span id="DetailBookpublication"><fmt:formatDate value="${pubDate }" pattern="yyyy년 MM월 dd일"/> 출간</span>
			</div>
			<div id="DetailBooksales" class="DetailBookInfo"><span>누적판매량 - <fmt:formatNumber value="${bookVo.sales }" pattern="#,###"/>부</span></div>
			<div id="DetailBookprice" class="DetailBookInfo">
				<span>판매 가격 - ${bookVo.price }원</span><span>대여 가격 - 일당 100원</span>
			</div>
			
			<c:if test="${sessionScope.adminAuchCode!='ADMIN' }">				
				<div class="choice">				
					<c:if test="${!empty vo.userId}">
						이미 가지고 있지롱
					</c:if>
					<c:if test="${empty vo.userId}">
						<div class="cart">
						<input type="submit" id="cart" name="cart" value="장바구니 추가" class="cart">
						<span class="popuptext">${vo.title } 장바구니 추가</span>
						</div>
						<input type="button" id="buy" name="buy" value="바로구매">
						
					</c:if>						
				</div>
			</c:if>
			
		</div>
		
		<div id="DetailBooksummary">
			<p>책 소개</p>
			${bookVo.summary }
		</div>
		
	
	
	</div>












<%@include file="../libraryBottom.jsp"%>