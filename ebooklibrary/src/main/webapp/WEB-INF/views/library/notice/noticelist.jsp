<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../libraryTop.jsp"%>
<script type="text/javascript">
function pageProc(curPage){		
	document.frmPage.currentPage.value=curPage;
	document.frmPage.submit();
}

$(document).ready(function(){
	$("#container_out").css("background","url(../../images/library/notice/noticeBackground.png) no-repeat center");
});
</script>
<form name="frmPage" method="post"	action="<c:url value='/library/notice/noticelist.do'/>">
<input type="hidden" name="currentPage">
<input type="hidden" name="searchCondition" value="${param.searchCondition }">
<input type="hidden" name="searchKeyword" value="${param.searchKeyword }">
</form>

<!-- 공지사항 리스트 화면 -->
<div id = "notice_head">
	<h2>
		<img alt="공지사항"
			src="${pageContext.request.contextPath }/images/library/notice/notice.jpg">
	</h2>
</div>
<div class = "notice_Ad">

</div>
<div id="notice_body">
		<div class="list">
			<div class="searchbox">
				<form name="search" id="search" 
				action="<c:url value='/library/notice/noticelist.do'/>">
					<select name="searchCondition">
						<option value="title">제목</option>
						<option value="writer">글쓴이</option>
						<option value="content">내용</option>
					</select> 
					<input type="text" name="searchKeyword"> 
					<input type="submit" value="검색">
				</form>
			</div>
			<div id="notice_table">
				<table>
					<colgroup>
						<col width="60">
						<col>
						<col width="93">
						<col width="122">
						<col width="81">
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>날짜</th>
							<th class="last">조회</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty alist }">
							<tr>
								<td colspan="5" class="align-center">해당 데이터가 없습니다</td>
							</tr>
						</c:if>
						<c:if test="${!empty alist }">
							<c:forEach var="vo" items="${alist }">
								<tr>
									<td>${vo.noticeNo }</td>
									<td><a href="<c:url value ='/library/notice/noticedetail.do'/>"> ${vo.title }</a></td>
									<td>${vo.writer }</td>
									<td><fmt:formatDate value="${vo.regdate }"
											pattern="yyyy-MM-dd" /></td>
									<td>${vo.read_Count }</td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
			</div>
				<div class="divPage">
								<!-- 이전 블럭으로 이동 -->
								<c:if test="${pagingInfo.firstPage>1 }">
									<a href="#" onclick="pageProc(${pagingInfo.firstPage-1}"> <img
										src="<c:url value = '/images/first.JPG'/>" alt="이전블럭으로">
									</a>
								</c:if>
								<!-- 페이지 번호 추가 -->
								<!-- [1][2][3][4][5][6][7][8][9][10] -->
								<c:forEach var="i" begin="${pagingInfo.firstPage }"
									end="${pagingInfo.lastPage }">
									<c:if test="${i==pagingInfo.currentPage }">
										<span style="color: blue; font-weight: bold"> ${i }</span>
									</c:if>
									<c:if test="${i!=pagingInfo.currentPage }">
										<a href="#" onclick="pageProc(${i})">[${i}]</a>
									</c:if>
								</c:forEach>
								<!--  페이지 번호 끝 -->

								<!-- 다음 블럭으로 이동 -->
								<c:if test="${pagingInfo.lastPage<pagingInfo.totalPage }">
									<a href="#" , onclick="pageProc(${pagingInfo.lastPage+1})">
										<img src="<c:url value= '/images/last.JPG'/>" alt="다음블럭으로">
									</a>
								</c:if>
							</div>
			<div id="noticeWrite">
				<a href="<c:url value ='/library/notice/noticewrite.do'/>">글쓰기</a>
			</div>
		</div>
	
</div>


<%@include file="../libraryBottom.jsp"%>