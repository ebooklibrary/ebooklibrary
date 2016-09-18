<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../libraryTop.jsp" %>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/silde_Notice/style.css" />
<script type="text/javascript">
$().ready(function(){
	$("#preWriting").click(function(){
		$(location).attr('href',"<c:url value='/library/qna/qnaPrePage.do?qnaNo=${param.qnaNo}'/>");
	});
	
	$("#nextWriting").click(function(){
		$(location).attr('href',"<c:url value='/library/qna/qnaNextPage.do?qnaNo=${param.qnaNo}'/>");
	});
	
	$("#container_out").css("background","url(../../images/library/notice/noticeBackground.png) no-repeat center");
});


</script>
<!-- 공지사항 상세보기 화면 -->
<div id="notice_head">
	<h2>
		<img alt="공지사항"
			src="${pageContext.request.contextPath }/images/library/notice/notice.jpg">
	</h2>
</div>
<div id="notice_banner">
	<a href="<c:url value='/library/notice/noticelist.do'/>"><img
		alt="공지사항 배너"
		src="${pageContext.request.contextPath}/images/library/notice/banner.png"
		width="200px" height="50px"></a>
</div>
<%@include file="../libraryAd.jsp"%>
	<div id="detail_body">
	<table class="detail_table">
		<tr>
			<td class="td_1">제목</td>
			<td class="td_5" colspan="5">${qnaBoardVo.title }
		</tr>
		<tr>
			<td class="td_1">작성자</td>

			<td class="td_2">${qnaBoardVo.userName }</td>
			<td class="td_1">작성일</td>
			<td class="td_3"><fmt:formatDate value="${qnaBoardVo.regDate }"
					pattern="yyyy-MM-dd a hh:mm:ss" /></td>
			<td class="td_1">조회수</td>
			<td class="td_4">${qnaBoardVo.readCount }</td>
		<tr>
			<td colspan="6" height="1" bgcolor="#E6E6E6"></td>
		</tr>
		<tr style="margin-top: 10px">
			<td class="td_6" colspan="6" valign="top">${qnaBoardVo.content }</td>
		</tr>
		<tr>
			<td colspan="6" height="1px" bgcolor="#B3B4BD"></td>
		</tr>
		<tr>
			<td class="td_9">이전글</td>
				<c:if test="${preQnaVO==null || preQnaVO.qnaNo==param.qnaNo}">
					<td class="td_7">이전글이 없습니다.</td>
				</c:if>
				<c:if test="${preQnaVO.qnaNo!=param.qnaNo}">
					<td class="td_7"><a
						href="<c:url value='/library/qna/qnaPrePage.do?qnaNo=${param.qnaNo}'/>">${preQnaVO.title}</a></td>
				</c:if>
		</tr>
		<tr>
			<td colspan="6" height="1px" bgcolor="#B3B4BD"></td>
		</tr>
		<tr>
			<td class=" td_9">다음글</td>
			<c:if test="${postQnaVo==null ||postQnaVo.qnaNo==param.qnaNo}">
				<td class="td_8">마지막 글입니다.</td>
			</c:if>
			<c:if test="${postQnaVo.qnaNo!=param.qnaNo }">
				<td class="td_8"><a
					href="<c:url value='/library/qna/qnaNextPage.do?qnaNo=${param.qnaNo}'/>">${postQnaVo.title}</a></td>
			</c:if>
		</tr>

	</table>
		<div style="text-align:right">
			<input type="button" id="preWriting" value="이전글"/>
			<input type="button" id="nextWriting" value="다음글"/>
		</div>
		<div class="center">
		
			
			<c:if test="${sessionScope.memberNo==qnaBoardVo.memberNo}">
			<a href="<c:url value='/library/qna/qnaEdit.do?qnaNo=${param.qnaNo }'/>">수정</a> |
        	<a href="<c:url value='/library/qna/qnaDelete.do?qnaNo=${param.qnaNo }'/>">삭제</a> |
        	</c:if>
        	<a href="<c:url value='/library/qna/qnaList.do'/>">목록</a>			
		</div>
	<c:import url="/comments/commentList.do?qnaNo=${param.qnaNo }&complete=${qnaBoardVo.complete }&memberNo=${qnaBoardVo.memberNo }"></c:import>
	</div>
	

	<%-- <c:import url="../comments/commentWrite.jsp?qnaNo=${param.qnaNo }"></c:import> --%>
<%@include file="../libraryBottom.jsp" %>