<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<!--공지사항-->
<div id="tab1" >
<div>공지사항</div>
<div><a href="<c:url value='/library/notice/noticelist.do'/>">
공지사항 더보기</a></div>
	<div class="list2">
		<table  summary="최근 공지사항 6건을 보여주는 표입니다">
			<c:if test="${empty noticeVo }">
				<tr>
					<td style="text-align: center;">해당 데이터가 없습니다</td>
				</tr>
			</c:if>
			<c:if test="${!empty noticeVo }">
				<c:forEach var="vo" items="${noticeVo }">
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

		</table>
	</div>

</div>
	<!--알립니다-->