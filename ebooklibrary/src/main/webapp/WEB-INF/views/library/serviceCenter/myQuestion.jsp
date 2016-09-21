<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 자신이 한 1:1 문의 확인 -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../libraryTop.jsp"%>
<script type="text/javascript"
	src="<c:url value ='/jquery/silde_Notice/jquery.js'/>"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$("#noticeDivColor").css("background-color",
								"rgba(0, 250, 250, 0.5)");
						$("#container_out")
								.css("background",
										"url(../../images/library/notice/noticeBackground.png) no-repeat center");
					});
</script>

<div class="myQuestion_head">
	<div class="myQuestion_main">
		<img alt="" src="${pageContext.request.contextPath }/images/library/ServiceCenter/myQuestion.png"
				style="width: 125px; margin-bottom: 15px ; padding-right: 10px;">
		
		<table class="myQuestion_table">
			<colgroup>
				<col width="90">
				<col width="80">
				<col width="250">
				<col width="150">
				<col width="100">
			</colgroup>
			<thead>
				<tr>
					<th>질문번호</th>
					<th>문의자</th>
					<th>문의내용</th>
					<th>문의일</th>
					<th>답변상태</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty alist }">
					<tr>
						<td colspan="5" style="text-align: center; margin-top: 30px;" >문의 내역이 존재하지 않습니다.</td>
					</tr>
				</c:if>
				<c:if test="${!empty alist }">
					<c:forEach var="vo" items="${alist }">
						<tr>
							<td>${vo.questNo }</td>
							<td>${vo.userName }</td>
							<td>${vo.title }</td>
							<td><fmt:formatDate value="${vo.redDate }"
									pattern="yyyy-MM-dd" /></td>
							<c:if test="${vo.selectCmt=='N' }">
								<td>답변 처리중</td>
							</c:if>
							<c:if test="${vo.selectCmt=='Y' }">
								<td>답변 완료</td>
							</c:if>
						</tr>
						<tr>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
	</div>
</div>

<%@include file="../libraryBottom.jsp"%>