<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" type="text/css"	href="${pageContext.request.contextPath }/css/library/qna.css" />
<link rel="stylesheet" type="text/css"	href="${pageContext.request.contextPath }/css/library/request.css" />
<%@include file="../libraryAdminTop.jsp"%>
<script type="text/javascript">
	$().ready(function(){
		$("#requestDivColor").css("background-color","rgba(0, 250, 250, 0.5)");
		
		$("#container_out").css("background","url(../../images/library/notice/noticeBackground.png) no-repeat center");

		$("#listGo").click(function(){
			$(location).attr('href',"<c:url value='/admin/requestList.do'/>");
		});
		
		$("#notstock").click(function(){
			confirm("#req_stockCencel",event, "입고처리 하시겠습니까?");
		});
		$("#stock").click(function(){
			confirm("#request_stock",event, "입고처리 하시겠습니까?");
		});
		
		$("#deleteRequest").click(function(){
			confirm("#frmDelete",event, "삭제 하시겠습니까?");
		});
		
		function confirm(id,event, msg) {
	        var evt = event;
	        event.preventDefault();
	        alertify.confirm(msg, function (e) {
	            if (e) {
	                $(id).submit();
	                return true;
	            } else {
	                return false;
	            }	
	        });
	    } 
		
		
	});
	
	function pageFunc(curPage){
		document.frmPage.currentPage.value=curPage;
		frmPage.submit();
	}
	function requestEdit(requNo){
		href.location("<c:url value='/library/request/requestEdit.do'/>");
	}

</script>


<form name="frmPage" method="post" 
	action="<c:url value='/admin/requestList.do'/>">
	<input type="hidden" name="currentPage">
	<input type="hidden" id="memberNo" name="memberNo" value="${sessionScope.adminMemberNo }"/>
	<input type="hidden" id="myWrite" name="myWrite" value="${param.myWrite }">
	<input type="hidden" id="myWrite" name="searchCondition" value="${param.searchCondition }">
	<input type="hidden" id="myWrite" name="searchKeyword" value="${param.searchKeyword }">
	
</form>
<!-- request 리스트 화면 -->
<div id="notice_head">
	<h2>
		<img alt="qna"
			src="${pageContext.request.contextPath }/images/library/request/request.png" style="width: 150px;">
	</h2>
</div>

<!-- 광고 -->
<div id="adminreq_body">
<div id="adminreqList_body">
	<div class="searchbox">
		<form name="frmSearch" method="post"
			action="<c:url value='/admin/requestList.do' />">
			<div class="search_box" >
				<select name="searchCondition" class="searchCondition">
					<option value="title"
						<c:if test="${param.searchCondition=='title'}">
		            		selected
		               </c:if>>책제목</option>			
					<option value="username"
						<c:if test="${param.searchCondition=='username'}">
		            		selected
		               </c:if>>작성자</option>
				</select> <input type="text" name="searchKeyword" title="검색어 입력"
					value="${param.searchKeyword}" class="searchCondition"> <input type="submit"
					value="검색" id="searchInfo2">
			</div>
		</form>
	</div>
	<div class="list">
	<table id="requestList"
		summary="요청게시판에 관한 표로써, 글번호, 제목, 작성자, 작성일, , 처리여부에 대한 정보를 제공합니다.">
		<caption>request</caption>
		<colgroup>
			<col style="width: 6%;" />
			<col style="width: 15%;" />
			<col style="width: 23%;" />
			<col style="width: 14%;" />
			<col style="width: 12%;" />
			<col style="width: 10%;" />
			<col style="width: 10%;" />
			<col style="width: 8%;" />
			
			
			
			
		</colgroup>
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col">분류</th>
				<th scope="col">책제목</th>
				<th scope="col">저자</th>
				<th scope="col">출판사</th>
				<th scope="col">작성자</th>
				<th scope="col">요청일</th>
				<th scope="col" colspan="2">비고</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty requestList}">
				<tr>
					<td colspan="7">게시글이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${!empty requestList}">
				<c:forEach var="vo" items="${requestList}">
					
					<tr>
						<td>${vo.requestNo }</td>
						<td>
							<c:if test="${vo.stocked=='Y' }">
								[입고완료]	
								<c:if test="${sessionScope.adminAuchCode=='ADMIN' }">
									<%-- <form id="req_stockCencel" method="post" action="<c:url value='/library/request/requestNotStock.do?requestNo=${vo.requestNo }'/>" >
										<input type="submit" id="notstock" value="취소" class="btreqList">
									</form> --%>
								</c:if>
							</c:if>
							<c:if test="${vo.stocked=='N' }">
								<c:if test="${sessionScope.adminAuchCode=='ADMIN' }">
									<form id="request_stock" method="post" action="<c:url value='/library/request/requestStock.do?requestNo=${vo.requestNo }'/>" >
										<input type="submit" id="stock" value="입고하기" class="btreqList">
									</form>
								</c:if>
								<c:if test="${sessionScope.auchCode=='USER' }">
									입고요청중
									
								</c:if>
							</c:if>
						</td>
						<td>
							<p>${vo.title }</p>
						</td>
						<td>${vo.writer }</td>
						<td>${vo.publisher }</td>
						<td>${vo.userName }</td>
						<td style="text-align: center;"><fmt:formatDate	value="${vo.regdate }" pattern="MM/dd" /></td>
						<c:if test="${vo.stocked=='Y' }">
							<c:if test="${sessionScope.adminAuchCode=='ADMIN' }">
								<td colspan="2">
									<form id="req_stockCencel" method="post" action="<c:url value='/library/request/requestNotStock.do?requestNo=${vo.requestNo }'/>" >
										<input type="submit" id="notstock" value="입고취소" class="btreqList">
									</form>
								</td>
							</c:if>
							<c:if test="${sessionScope.adminAuchCode!='ADMIN' }">
								<td colspan="2">
								</td>
							</c:if>
							
						</c:if>
						<c:if test="${vo.stocked=='N' }">
							<c:if test="${sessionScope.memberNo!=vo.memberNo }">
								<td colspan="2">
								</td>
							</c:if>							
						</c:if>	
					</tr>

				</c:forEach>

			</c:if>
		</tbody>
	</table>
</div>
</div>
	<div class="requebticons">
		<form id="myWrite" method="post" action="<c:url value='/admin/requestList.do'/>">
			<input type="button" id="listGo" value="전체목록" class="reqbt"/>			
		</form>			
	</div>	

	<!-- 페이징 처리를 위한 div -->
	<div class="reqdivPage">
		<!-- 이전 블럭으로 이동 -->
		<c:if test="${pagingInfo.firstPage>1}">
			<a href="#" onclick="pageFunc(${pagingInfo.firstPage-1})"> <img
				src="<c:url value='/images/first.JPG'/>" alt="이전블럭으로">
			</a>
		</c:if>

		<!-- 페이지 번호 추가 -->
		<!-- [1][2][3][4][5][6][7][8][9][10] -->
		<c:forEach var="i" begin="${pagingInfo.firstPage }"
			end="${pagingInfo.lastPage }">
			<c:if test="${i==pagingInfo.currentPage }">
				<span style="color: blue; font-weight: bold"> ${i}</span>
			</c:if>
			<c:if test="${i!=pagingInfo.currentPage }">
				<a href="#" onclick="pageFunc(${i})"> [${i}]</a>
			</c:if>
		</c:forEach>
		<!--  페이지 번호 끝 -->

		<!-- 다음 블럭으로 이동 -->
		<c:if test="${pagingInfo.lastPage<pagingInfo.totalPage}">
			<a href="#" onclick="pageFunc(${pagingInfo.lastPage+1})"> <img
				src="<c:url value='/images/last.JPG'/>" alt="다음블럭으로">
			</a>
		</c:if>
	</div>


</div>


<%@include file="../libraryAdminBottom.jsp" %>
