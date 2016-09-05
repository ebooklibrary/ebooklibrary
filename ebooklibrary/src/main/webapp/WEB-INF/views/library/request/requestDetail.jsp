<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../libraryTop.jsp" %>
	<h2>글 상세보기</h2>
	<div class="divForm">
		<div class="firstDiv">
			<span class="sp1">글번호</span> <span>${requestVo.requestNo}</span>
		</div>
		<div>
			<span class="sp1">글제목</span> <span>${requestVo.title }</span>
		</div>	
		<div>
			<span class="sp1">작성자</span> <span>${requestVo.userName }</span>
		</div>		
		<div>
			<span class="sp1">등록일</span> <span>${requestVo.regdate }</span>
		</div>
		<div>
			<span class="sp1">출판사</span> <span>${requestVo.publisher}</span>
		</div>
		<div class="lastDiv">
			<span class="sp1">입고여부</span> <span>${requestVo.stocked}</span>			
		</div>		
		<div class="center">
			<a href="<c:url value='/library/request/requestEdit.do?requestNo=${requestVo.requestNo }'/>">수정</a> |
        	<a href="<c:url value='/library/request/requestDelete.do?requestNo=${requestVo.requestNo }'/>">삭제</a> |
        	<a href="<c:url value='/library/request/requestList.do'/>">목록</a>			
		</div>
	</div>
<%@include file="../libraryBottom.jsp" %>