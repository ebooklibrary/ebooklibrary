<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../libraryTop.jsp" %>

<div>
	<form name="frmWrite" id="frmWrite" method="post" 			
		action="<c:url value='/library/request/requestWrite.do'/>" >
		<fieldset>
			<legend>요청게시판 글쓰기</legend>
				<div class="">
					<label>아이디</label><label>레벨체크</label>
				</div>
				<div class="">
					<label for="title">제목</label>
					<input type="text" id="title" name="title" />
				</div>
				<div >
					<label for="writer">작성자</label>
					<input type="text" id="userName" name="userName">
				</div>
		        <div>
		       		<label for="writer">출판사</label>
					<input type="text" id="publisher" name="publisher">
		        </div>
		        <div>
		        	<input type="text" name="memberNo" value="${sessionScope.memberNo }">
		        </div>
		        
		        <div>
		        	<input type="submit" value="작성완료"/>
		        	<input type="Button" value="글 목록"
		        	onclick="location.href='<c:url value="/library/request/requestList.do"/>';" />
		        </div>
		</fieldset>
	</form>
</div>
<%@include file="../libraryBottom.jsp" %>