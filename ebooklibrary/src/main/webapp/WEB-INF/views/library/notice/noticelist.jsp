<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../libraryTop.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/silde_Notice/style.css" />
<script type="text/javascript"
	src="<c:url value ='/jquery/silde_Notice/jquery.js'/>"></script>



<script type="text/javascript">
function pageProc(curPage){		
	document.frmPage.currentPage.value=curPage;
	document.frmPage.submit();
}

$(document).ready(function(){
	$("#container_out").css("background","url(../../images/library/notice/noticeBackground.png) no-repeat center");
});

</script>
<form name="frmPage" method="post"
	action="<c:url value='/library/notice/noticelist.do'/>">
	<input type="hidden" name="currentPage"> <input type="hidden"
		name="searchCondition" value="${param.searchCondition }"> <input
		type="hidden" name="searchKeyword" value="${param.searchKeyword }">
</form>

<!-- 공지사항 리스트 화면 -->
<div id="notice_head">
	<h2>
		<img alt="공지사항"
			src="${pageContext.request.contextPath }/images/library/notice/notice.jpg">
	</h2>
</div>
<!-- 광고 -->
<div class="notice_Ad">

	<!-- Start WOWSlider.com BODY section -->
	<!-- add to the <body> of your page -->
	<div id="wowslider-container1">
		<div class="ws_images">
			<ul>
				<li><img src="${pageContext.request.contextPath }/images/library/notice/exampleslide1.jpg"
					alt="example-slide-1" title="example-slide-1" id="wows1_0" /></li>
				<li><img src="${pageContext.request.contextPath }/images/library/notice/exampleslide2.jpg"
					alt="example-slide-2" title="example-slide-2" id="wows1_1" /></li>
				<li><a href="http://wowslider.net"><img
						src="${pageContext.request.contextPath }/images/library/notice/exampleslide3.jpg" alt="jquery carousel"
						title="example-slide-3" id="wows1_2" /></a></li>
				<li><img src="${pageContext.request.contextPath }/images/library/notice/exampleslide4.jpg"
					alt="example-slide-4" title="example-slide-4" id="wows1_3" /></li>
			</ul>
		</div>
		<div class="ws_bullets">
			<div>
				<a href="#" title="example-slide-1"><span><img
						src="${pageContext.request.contextPath }/images/library/notice/exampleslide1.jpg" alt="example-slide-1" />1</span></a> <a
					href="#" title="example-slide-2"><span><img
						src="${pageContext.request.contextPath }/images/library/notice/exampleslide2.jpg" alt="example-slide-2" />2</span></a> <a
					href="#" title="example-slide-3"><span><img
						src="${pageContext.request.contextPath }/images/library/notice/exampleslide3.jpg" alt="example-slide-3" />3</span></a> <a
					href="#" title="example-slide-4"><span><img
						src="${pageContext.request.contextPath }/images/library/notice/exampleslide4.jpg" alt="example-slide-4" />4</span></a>
			</div>
		</div>
		<div class="ws_script" style="position: absolute; left: -99%">
			<a href="http://wowslider.com">bootstrap carousel</a> by
			WOWSlider.com v8.7
		</div>
		<div class="ws_shadow"></div>
	</div>
	<script type="text/javascript" src="<c:url value ='/jquery/silde_Notice/wowslider.js'/>"></script>
	<script type="text/javascript" src="<c:url value ='/jquery/silde_Notice/script.js'/>"></script>
	<!-- End WOWSlider.com BODY section -->

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
				</select> <input type="text" name="searchKeyword"> <input
					type="submit" value="검색">
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
								<td><a
									href="<c:url value ='/library/notice/readCountAdd.do?notice_No=${vo.noticeNo}'/>">
										${vo.title }</a></td>
								<td>${vo.userName }</td>
								<td><fmt:formatDate value="${vo.regdate }"
										pattern="yyyy-MM-dd" /></td>
								<td>${vo.readCount }</td>
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
				<a href="#" , onclick="pageProc(${pagingInfo.lastPage+1})"> <img
					src="<c:url value= '/images/last.JPG'/>" alt="다음블럭으로">
				</a>
			</c:if>
		</div>
		<c:if test="${sessionScope.authCode=='ADMIN' }">
		<div id="noticeWrite">
			<a href="<c:url value ='/library/notice/noticewrite.do'/>">글쓰기</a>
		</div>
		</c:if>
	</div>

</div>


<%@include file="../libraryBottom.jsp"%>