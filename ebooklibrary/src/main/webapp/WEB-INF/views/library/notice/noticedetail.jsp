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

<!-- 공지사항 상세보기 화면 -->
<div id="notice_head">
	<h2>
		<img alt="공지사항"
			src="${pageContext.request.contextPath }/images/library/notice/notice.jpg">
	</h2>
</div>
<div id="detail_body">
	<table class="detail_table">
		<tr>
			<td class="td_1">작성자</td>
			<td class="td_2">${noticeVo.userName }</td>
			<td class="td_1">작성일</td>
			<td class="td_3"><fmt:formatDate value="${noticeVo.regdate }"
					pattern="yyyy-MM-dd a hh:mm:ss" /></td>
			<td class="td_1">조회수</td>
			<td class="td_4">${noticeVo.readCount }</td>
		<tr>
			<td colspan="6" height="1" bgcolor="#E6E6E6"></td>
		</tr>
		<tr>
			<td class="td_1">제목</td>
			<td class="td_5" colspan="5">${noticeVo.title }
		</tr>
		<tr style="margin-top: 10px">
			<td class="td_6" colspan="6" valign="top">${noticeVo.content }</td>
		</tr>
		<tr>
			<td colspan="6" height="1px" bgcolor="#B3B4BD"></td>
		</tr>
		<tr class="tr_1">
			<td class="td_9">이전글</td>
			<c:if test="${preVo==null || preVo==''}">
				<td class="td_7" colspan="5">이전글이 없습니다.</td>
			</c:if>
			<c:if test="${preVo.noticeNo!=0}">
				<td class="td_7" colspan="5"><a
					href="<c:url value ='/library/notice/prePage.do?notice_No=${param.notice_No }'/>">${preVo.title}</a></td>
			</c:if>
		</tr>
		<tr>
			<td colspan="6" height="1px" bgcolor="#B3B4BD"></td>
		</tr>
		<tr>
			<td class=" td_9">다음글</td>
			<c:if test="${nextVo==null || nextVo==''}">
				<td class="td_8" colspan="5">마지막 글입니다.</td>
			</c:if>
			<c:if test="${nextVo.noticeNo!=0 }">
				<td class="td_8" colspan="5"><a
					href="<c:url value ='/library/notice/nextPage.do?notice_No=${param.notice_No }'/>">${nextVo.title}</a></td>
			</c:if>
		</tr>
		<tr>
			<td colspan="6" height="1px" bgcolor="#B3B4BD"></td>
		</tr>
	</table>
	<a href="<c:url value ='/library/notice/noticelist.do'/>"><img
		class="img1" alt="리스트"
		src="${pageContext.request.contextPath }/images/library/notice/List.jpg"></a>
</div>

<%@include file="../libraryBottom.jsp"%>