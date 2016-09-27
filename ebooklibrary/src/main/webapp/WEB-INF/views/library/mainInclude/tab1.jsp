<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!--공지사항-->
<div id="tab1">
	<div class="add_notice2"><a href="<c:url value='/library/notice/noticelist.do'/>">공지사항</a></div>
	<div class="list2">
		<table summary="최근 공지사항 6건을 보여주는 표입니다" class="table3">
			<tbody>
				<c:if test="${empty noticeVo }">
					<tr>
						<td style="text-align: center;">해당 데이터가 없습니다</td>
					</tr>
				</c:if>
				<c:if test="${!empty noticeVo }">
					<c:forEach begin="0" end="6" var="vo" items="${noticeVo }">
						<tr>
						<c:if test="${fn:length(vo.title)>20}">
                           <td>
                           <a href="<c:url value ='/library/notice/readCountAdd.do?notice_No=${vo.noticeNo}'/>">
                           ${fn:substring(vo.title,0,20)}...</a></td>
                        </c:if>
							<c:if test="${fn:length(vo.title)<=20}">
							<td><a
								href="<c:url value ='/library/notice/readCountAdd.do?notice_No=${vo.noticeNo}'/>">
								${vo.title }</a></td>
                        </c:if>
							<td><fmt:formatDate value="${vo.regdate }"
									pattern="yyyy-MM-dd" /></td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
	</div>
</div>
<!--알립니다-->