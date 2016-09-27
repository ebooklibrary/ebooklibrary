<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../../admin/libraryAdminTop.jsp"%>

<script type="text/javascript">


	$(document)
			.ready(
					function() {
						$("#container_out")
								.css("background",
										"url(../../images/library/notice/noticeBackground.png) no-repeat center");
						
						$("#btnDelete").click(function(){
							if(confirm("삭제하시겠습니까?")){
								location.href = "<c:url value ='/library/notice/noticeDelete.do?noticeNo=${noticeVo.noticeNo }'/>";
							}
						});
					});
</script>

<!-- 공지사항 상세보기 화면 -->
<div id="detail_head">
	<h2>
		<img alt="공지사항"
			src="${pageContext.request.contextPath }/images/library/notice/notice.png"
			style="width: 150px;">
	</h2>
</div>
<div id="notice_banner">
	<a href="<c:url value='/admin/noticelist.do'/>"><img alt="공지사항 배너"
		src="${pageContext.request.contextPath}/images/library/notice/banner.png"
		width="200px" height="50px"></a>
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
			<c:if test="${noticeVo.fileName!=null }">
				<td class="td_6" colspan="6" valign="top"><img
					src="${pageContext.request.contextPath }/noticeUpload/${noticeVo.fileName}"
					alt="" style="max-width: 100%; height: auto;" />${noticeVo.content }</td>
			</c:if>
			<c:if test="${noticeVo.fileName==null }">
				<td class="td_6" colspan="6" valign="top">${noticeVo.content }</td>
			</c:if>
		</tr>
		<tr>
			<td colspan="6" height="1px" bgcolor="#B3B4BD"></td>
		</tr>
		<tr>
			<td class="td_9">이전글</td>
			<c:if test="${preVo==null || preVo==''}">
				<td class="td_7">이전글이 없습니다.</td>
			</c:if>
			<c:if test="${preVo.noticeNo!=0}">
				<td class="td_7"><a
					href="<c:url value ='/admin/prePage.do?notice_No=${param.notice_No }'/>">${preVo.title}</a></td>
			</c:if>
		</tr>
		<tr>
			<td colspan="6" height="1px" bgcolor="#B3B4BD"></td>
		</tr>
		<tr>
			<td class=" td_9">다음글</td>
			<c:if test="${nextVo==null || nextVo==''}">
				<td class="td_8">마지막 글입니다.</td>
			</c:if>
			<c:if test="${nextVo.noticeNo!=0 }">
				<td class="td_8"><a
					href="<c:url value ='/admin/nextPage.do?notice_No=${param.notice_No }'/>">${nextVo.title}</a></td>
			</c:if>
		</tr>

		<tr>
			<td colspan="6" height="1px" bgcolor="#B3B4BD"></td>
		</tr>
	</table>
	<div class="notice_delete">
		<input type="button" value="글수정"
			onclick="location.href = '<c:url value ='/library/notice/noticeEdit.do?notice_No=${noticeVo.noticeNo }'/>'" id="editBotton">
		<input type="button" id="btnDelete" value="글삭제">
		<input type= "button" value="목록" id="listBotton" onclick="location.href= '<c:url value = '/admin/noticelist.do'/>'">
	</div>
</div>
<div></div>

<%@include file="../libraryAdminBottom.jsp"%>