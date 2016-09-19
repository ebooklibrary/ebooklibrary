<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" type="text/css"	href="${pageContext.request.contextPath }/css/library/qna.css" />
<link rel="stylesheet" type="text/css"	href="${pageContext.request.contextPath }/css/library/request.css" />
<%@include file="../libraryTop.jsp" %>
<script type="text/javascript">
	$().ready(function(){
		$("#requestDivColor").css("background-color","rgba(0, 250, 250, 0.5)");
		
		$("#writeGo").click(function(){
			$(location).attr('href',"<c:url value='/library/request/requestWrite.do'/>");
		});
		$("#listGo").click(function(){
			$(location).attr('href',"<c:url value='/library/request/requestList.do'/>");
		});
		$("#container_out").css("background","url(../../images/library/notice/noticeBackground.png) no-repeat center");
		
		$("#stock").click(function(){
			if(confirm("입고처리하시겠습니까?")){
				return true;
			}else{
				return false;
			}
		});
		
	});
	
	function pageFunc(curPage){
		document.frmPage.currentPage.value=curPage;
		frmPage.submit();
	}	

</script>


<form name="frmPage" method="post" 
	action="<c:url value='/library/qna/qnaList.do'/>">
	<input type="hidden" name="currentPage">
	<input type="hidden" id="memberNo" name="memberNo" value="${sessionScope.memberNo }"/>
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
<div id="notice_banner">
	<a href="<c:url value='/library/request/requestList.do'/>"><img
		alt="request 배너"
		src="${pageContext.request.contextPath}/images/library/request/banner2.png"
		width="200px" height="50px"></a>
</div>
<!-- 광고 -->
<%@include file="../libraryAd.jsp"%>

<div id="notice_body">
	<div class="searchbox">
		<form name="frmSearch" method="post"
			action="<c:url value='/library/request/requestList.do' />">
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
	<table 
		summary="요청게시판에 관한 표로써, 글번호, 제목, 작성자, 작성일, , 처리여부에 대한 정보를 제공합니다.">
		<caption>request</caption>
		<colgroup>
			<col style="width: 10%;" />
			<col style="width: 15%;" />
			<col style="width: 15%;" />
			<col style="width: 10%;" />
			<col style="width: 15%;" />
			<col style="width: 10%;" />
			<col style="width: 15%;" />
		</colgroup>
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col">분류</th>
				<th scope="col">책제목</th>
				<th scope="col">저자</th>
				<th scope="col">출판사</th>
				<th scope="col">작성자</th>
				<th scope="col">작성일</th>
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
							</c:if>
							<c:if test="${vo.stocked=='N' }">
								<c:if test="${sessionScope.auchCode=='ADMIN' }">
									<form id="request_stock" method="post" action="<c:url value='/library/request/requestStock.do?requestNo=${vo.requestNo }'/>">
										<input type="submit" id="stock" value="입고">
										입고요청							
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
						<td style="text-align: center;"><fmt:formatDate	value="${vo.regdate }" pattern="MM/dd  HH:mm:ss" /></td>
								
					</tr>

				</c:forEach>

			</c:if>
		</tbody>
	</table>
	<div class="bticons">
		<form id="myWrite" method="post" action="<c:url value='/library/request/requestList.do'/>">
			<input type="button" id="listGo" value="전체목록" class="requestbt"/>
			<input type="button" id="writeGo" value="글쓰기" class="requestbt"/>
			<c:if test="${!empty sessionScope.memberNo }">
				<input type="submit" id="myWriting" value="내글 보기" class="requestbt"/>
			</c:if>
			<c:if test="${!empty sessionScope.memberNo }">
				<input type="hidden" id="memberNo" name="memberNo" value="${sessionScope.memberNo }"/>
			</c:if>
			<input type="hidden" id="myWrite" name="myWrite" value="Y">
		</form>			
	</div>	
</div>
	<!-- 페이징 처리를 위한 div -->
	<div class="divPage">
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


<%@include file="../libraryBottom.jsp" %>
