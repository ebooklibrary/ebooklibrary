<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script type="text/javascript">
	$(function() {
		var article = (".table3 .show");
		$(".table3 .title td").click(function() {
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
<div class="add_notice3">
	<div id="serviceNotice_head">
		<h2>
			<img alt="공지사항"
				src="${pageContext.request.contextPath }/images/library/notice/notice.png"
				style="width: 125px; margin-bottom: 15px ; padding-right: 10px;">
		</h2>
	</div>
	<div class="service_Notice">
		<table summary="최근 공지사항 5건을 보여주는 표입니다" class="table3" id="table3">
			<colgroup>
				<col width="10%">
				<col width="55%">
				<col width="35%">
			</colgroup>
			<thead>
				<tr class="service_Tr">
					<th scope="col">No</th>
					<th scope="col">공지내용</th>
					<th scope="col">작성날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty noticeVo }">
					<tr>
						<td style="text-align: center;" colspan="3">해당 데이터가 없습니다</td>
					</tr>
				</c:if>
				<c:if test="${!empty noticeVo }">
					<c:forEach var="vo" items="${noticeVo }">
						<%-- <tr class="no">
							<td style="text-align: center">${vo.noticeNo }</td>
						</tr> --%>
						<tr class="title">
							<td style="text-align: center">${vo.noticeNo }</td>
							<c:if test="${fn:length(vo.title)>20}">
	                        		   ${fn:substring(vo.title,0,20)}...
	                       	    </c:if>
							<c:if test="${fn:length(vo.title)<=20}">
								<td>${vo.title }</td>
							</c:if>
							<td><fmt:formatDate value="${vo.regdate }"
									pattern="yyyy-MM-dd" /></td>
						</tr>
						<tr class="hide">
							<td style="text-align: left; font-size: 1.3em; padding: 10px;
							background:  #f5f5f5; border-top: 1px solid #e0e0e0; display: n" 
								colspan="3">${vo.content }</td>
						</tr>
						<%-- <tr class ="hide">
							<td>${vo.content }</td>
						</tr>
						<tr class="regdate">
							<td><fmt:formatDate value="${vo.regdate }"
									pattern="yyyy-MM-dd" /></td>
						</tr> --%>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
	</div>
</div>