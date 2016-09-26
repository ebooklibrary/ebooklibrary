<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../library/libraryTop.jsp" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/library/loginForm.css" />
<script type="text/javascript">
	$(document).ready(function(){
		$("#frmOrderList").submit(function(){
			if($("#startDay").val().length<1){
				alert("시작일을 입력하세요");
				$("#startDay").focus();
				return false;
			}else if($("#endDay").val().length<1){
				alert("종료일을 입력하세요");
				$("#endDay").focus();
				return false;
			}
		});
	});	
	
	function pageFunc(curPage){
		document.frmPage.currentPage.value=curPage;
		document.frmPage.submit();
	}
</script>

<!-- 페이징 처리를 위한 form 시작-->
<form name="frmPage" method="post">
	<input type="hidden" name="startDay" value="${param.startDay}">
	<input type="hidden" name="endDay" value="${param.endDay}">
	<input type="hidden" name="currentPage">	
</form>
<!-- 페이징 처리 form 끝 -->
<div id="OrderListWrapper" class="FormWrapperDiv">
	<p id="titlePtag">주문 내역/ 배송현황</p>
	<p>
		${sessionScope.userName }님의 주문내역입니다.
	</p>
	
	<form name="frm1" method="post" id="frmOrderList"
		action="<c:url value='/shop/order/orderList.do'/>" >
		<!-- 조회기간 include -->
		<%@include file="../common/dateTerm.jsp" %>
		
		<input type="submit" id="findOrder" value="조회" >
	</form>
	
	<c:if test="${pagingInfo.totalRecord>0 }">
		<p>
			${dateSearchVO.startDay } ~ ${dateSearchVO.endDay } 
			까지의 주문내역 총 ${pagingInfo.totalRecord }건입니다.
		</p>
	</c:if>
	
	<div class="divList">
	<table class="box2"
		summary="주문 내역에 관한 표로써, 주문번호, 주문일자, 상품명/가격/수량,주문총금액,배송현황,취소/교환/반품에 대한 정보를 제공합니다.">
		<caption>주문 내역</caption>
		<colgroup>
			<col style="width:15%" />
			<col style="width:40%" />
			<col style="width:15%" />
			<col style="width:30%" />
		</colgroup>
		<thead>
		  <tr>
		    <th scope="col">주문번호</th>
			<th scope="col">상품명</th>
			<th scope="col">가격</th>
			<th scope="col">주문일자</th>
		  </tr>
		</thead> 
		<tbody>
			<c:if test="${empty orderList }">
				<tr class="align_center">
					<td colspan="6">주문내역이 없습니다.</td></tr>
			</c:if>
			<c:if test="${!empty orderList }">
				<!-- 반복 시작 -->
				<c:forEach var="vo" items="${orderList }">					
				<tr class="align_right">
					<td>${vo.ordersNo }</td>
					<td class="align_left">
						<img src
		="<c:url value='/pd_images/${map["COVER_FILE_NAME"] }'/>" 
							alt="${vo.bookNo }" 
							width="50" align="absmiddle">
						${vo.bookNo}
					</td>
					<td>
						<fmt:formatNumber pattern="#,###" 
							value='${vo.price}'/>원</td>
					<td>
						${vo.ordersDate}
					</td>													
				</tr>			
			</c:forEach>
				<!-- 반복 끝 -->
			</c:if>
	</tbody>
	</table>
	</div>
	
	<div class="divPage">		
		<!-- 페이지 번호 추가 -->		
		<c:if test="${pagingInfo.firstPage>1 }">
			<a href="#" onclick="pageFunc(${pagingInfo.firstPage-1})">			
			    <img src='<c:url value="/images/first.JPG" />'  border="0">	</a>
		</c:if>
						
		<!-- [1][2][3][4][5][6][7][8][9][10] -->
		<c:forEach var="i" begin="${pagingInfo.firstPage }" 
		end="${pagingInfo.lastPage }">
			<c:if test="${i==pagingInfo.currentPage }">
				<span style="color:blue;font-weight:bold">${i }</span>
			</c:if>
			<c:if test="${i!=pagingInfo.currentPage }">						
				<a href="#" onclick="pageFunc(${i})">
					[${i }]
				</a>
			</c:if>
		</c:forEach>
			
		<c:if test="${pagingInfo.lastPage<pagingInfo.totalPage }">
			<a href="#" onclick="pageFunc(${pagingInfo.lastPage+1})">			
				<img src="<c:url value="/images/last.JPG" />" border="0">
			</a>
		</c:if>
		<!--  페이지 번호 끝 -->
	</div>
</div>

<%@ include file="../library/libraryBottom.jsp" %>