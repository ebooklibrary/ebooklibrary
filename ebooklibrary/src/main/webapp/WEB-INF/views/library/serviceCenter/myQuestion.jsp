<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 자신이 한 1:1 문의 확인 -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

<script type="text/javascript">
	$(function() {
		var article = (".myQuestion_table .show");
		$(".myQuestion_table .title td").click(function() {
			var myArticle = $(this).parents().next("tr");
			if ($(myArticle).hasClass('hide')) {
				$(article).removeClass('show').addClass('hide');
				$(myArticle).removeClass('hide').addClass('show');
			} else {
				$(myArticle).addClass('hide').removeClass('show');
			}
		});
	});
</script>
<div class="myQuestion_head">
	<div class="myQuestion_main">
		<img alt=""
			src="${pageContext.request.contextPath }/images/library/ServiceCenter/myQuestion.png"
			style="width: 125px; margin-bottom: 15px; padding-right: 10px; float: right; margin-right: 450px; margin-top: 100px;">
		<table class="myQuestion_table" id = "myQuestion_table">
			<colgroup>
				<col width="90">
				<col width="150">
				<col width="250">
				<col width="80">
				<col width="150">
				<col width="100">
			</colgroup>
			<thead>
				<tr>
					<th>질문번호</th>
					<th>질문종류</th>
					<th>문의내용</th>
					<th>문의자</th>
					<th>문의일</th>
					<th>답변상태</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty alist }">
					<tr>
						<td colspan="5" style="text-align: center; margin-top: 30px;">문의
							내역이 존재하지 않습니다.</td>
					</tr>
				</c:if>
				<c:if test="${!empty alist }">

					<c:forEach var="vo" items="${alist }">
						<tr class="title">
							<td>${vo.questNo}</td>
							<td><c:if test="${vo.category=='1' }">
							상품/재입고
						</c:if> <c:if test="${vo.category=='2' }">
							주문/결제
						</c:if> <c:if test="${vo.category=='3' }">
							회원관련
						</c:if> <c:if test="${vo.category=='4' }">
							기타문의
						</c:if></td>
							<td>${vo.title }</td>
							<td>${vo.userName }</td>
							<td><fmt:formatDate value="${vo.redDate }"
									pattern="yyyy-MM-dd" /></td>
							<c:if test="${vo.selectCmt=='N' }">
								<td>답변 처리중</td>
							</c:if>
							<c:if test="${vo.selectCmt=='Y' }">
								<td>답변 완료</td>
							</c:if>
						</tr>
						<tr class="hide">
							<td
								style="text-align: left; font-size: 1.3em; padding: 10px; background: #f5f5f5; border-top: 1px solid #e0e0e0; display: n"
								colspan="6">${vo.qContent }</td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
	</div>
</div>

<%@include file="../libraryBottom.jsp"%>