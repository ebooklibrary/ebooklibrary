<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/library/qna.css" />
<%@include file="../libraryTop.jsp" %>

<script type="text/javascript">
$().ready(function(){
	$("#preWriting").click(function(){
		$(location).attr('href',"<c:url value='/library/qna/qnaPrePage.do?qnaNo=${param.qnaNo}'/>");
	});
	
	$("#nextWriting").click(function(){
		$(location).attr('href',"<c:url value='/library/qna/qnaNextPage.do?qnaNo=${param.qnaNo}'/>");
	});
	
	
	$("#Btn_qnaEdit").click(function(){
		$(location).attr('href', "<c:url value='/library/qna/qnaEdit.do?qnaNo=${param.qnaNo}'/>");
	});
	$("#Btn_qnaList").click(function(){
		$(location).attr('href', "<c:url value='/library/qna/qnaList.do'/>");
	});
	
	
	
	$("#btn_delqna").click(function(){
		deleteqna(event,"삭제하시겠습니까?")
	});
	
	function deleteqna(event,msg){
		 var evt = event;
	        event.preventDefault();
	        alertify.confirm(msg, function (e) {
	            if (e) {
	                $("#deleteQna").submit();
	                return true;
	            } else {
	                return false;
	            }	
	        });
	}
	
	
	
});
</script>
<!-- qna 상세보기 화면 -->
<div id="notice_head">
	<h2>
		<img alt="qna"
			src="${pageContext.request.contextPath }/images/library/qna/qnaboard.png" style="width: 150px;">
	</h2>
</div>
<div id="notice_banner">
	<a href="<c:url value='/library/qna/qnaList.do'/>">
	<img
		alt="qna 배너"
		src="${pageContext.request.contextPath}/images/library/qna/qnabanner.png"
		width="200px" height="50px" ></a>
</div>
<%-- <c:import url="/event/sideEvent.do"></c:import> --%>
	<div id="detail_body">
	<table class="qnadetail_table" id="qnaDetail">
		<tr>
			<td class="td_1">제목</td>
			<td class="td_5" colspan="5" >&nbsp;&nbsp;&nbsp;${qnaBoardVo.title }</td>
		</tr>
		<tr>
			<td class="td_1">작성자</td>

			<td class="td_2">&nbsp;&nbsp;&nbsp;${qnaBoardVo.userName }</td>
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
		<tr class="qnaDetail_tr">
			<td class="td_9" >이전글</td>
				<c:if test="${preQnaVO==null || preQnaVO.qnaNo==param.qnaNo}">
					<td class="td_7" colspan="5">이전글이 없습니다.</td>
				</c:if>
				<c:if test="${preQnaVO.qnaNo!=param.qnaNo}">
					<td class="td_7" colspan="5"><a
						href="<c:url value='/library/qna/qnaPrePage.do?qnaNo=${param.qnaNo}'/>">${preQnaVO.title}</a></td>
				</c:if>
		</tr>
		<tr>
			<td colspan="6" height="1px" bgcolor="#B3B4BD"></td>
		</tr>
		<tr class="qnaDetail_tr">
			<td class=" td_9" >다음글</td>
			<c:if test="${postQnaVo==null ||postQnaVo.qnaNo==param.qnaNo}">
				<td class="qnatd_8" colspan="5">마지막 글입니다.</td>
			</c:if>
			<c:if test="${postQnaVo.qnaNo!=param.qnaNo }">
				<td class="qnatd_8" colspan="5" ><a
					href="<c:url value='/library/qna/qnaNextPage.do?qnaNo=${param.qnaNo}'/>">${postQnaVo.title}</a></td>
			</c:if>
		</tr>

	</table>
		<div id="bt_Detailcenter" >
			<c:if test="${sessionScope.memberNo==qnaBoardVo.memberNo}">
				<form id="deleteQna" method="post" action="<c:url value='/library/qna/qnaDelete.do'/>">
					<input type="hidden" name="qnaNo" value="${param.qnaNo }"/>
					<input type="button" id="Btn_qnaEdit" value="수정" class="btqnaDt"/>
					<input type="submit" id="btn_delqna" value="삭제" class="btqnaDt"/>
					<input type="button" id="Btn_qnaList" value="목록" class="btqnaDt"/>
				</form>
        	</c:if>
		</div>
	<c:import url="/comments/commentList.do?qnaNo=${param.qnaNo }&complete=${qnaBoardVo.complete }&memberNo=${qnaBoardVo.memberNo }"></c:import>
	</div>
	

	<%-- <c:import url="../comments/commentWrite.jsp?qnaNo=${param.qnaNo }"></c:import> --%>
<%@include file="../libraryBottom.jsp" %>