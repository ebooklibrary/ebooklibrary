<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../libraryTop.jsp"%>
<script type="text/javascript">
	function pageProc(curPage) {
		document.frmPage.currentPage.value = curPage;
		document.frmPage.submit();
	}

	$(document)
			.ready(
					function() {
						$("#container_out")
								.css("background",
										"url(../../images/library/notice/noticeBackground.png) no-repeat center");
					});
</script>
<!-- 관리자용 공지사항 추가 화면 -->
<form name="frm1" id="frm1" method="post"
	action="<c:url value ='/library/notice/noticewrite.do'/>">
	<h1>글쓰기 화면</h1>
	<input type="text" name="name" value="name">
</form>


<%@include file="../libraryBottom.jsp"%>