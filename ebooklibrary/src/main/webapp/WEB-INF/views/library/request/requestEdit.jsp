<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../libraryTop.jsp" %>
	<form name="frmEdit" id="frmEdit" method="post" 
		
		action="<c:url value='/library/request/requestEdit.do'/>" >
		<input type="hidden" name="requestNo" value="${requestVo.requestNo }"/>
		<fieldset>
			<legend>책 요청 수정하기</legend>
				<div class="">
					<label>${requestVo.userName}</label><label>레벨체크</label>
				</div>
				<div class="">
					<label for="title">제목</label>
					<input type="text" id="title" name="title" value="${requestVo.title }"/>
				</div>
				<div >
					<label for="writer">작성자</label>
					<input type="text" id="userName" name="userName" value="${requestVo.userName }">
				</div>       	        
		        
		        <div>
		        	<input type="submit" value="수정하기"/>
		        	<input type="reset" value="취소"
		        	onclick="location.href='<c:url value="/library/request/requestList.do"/>';" />
		        </div>
		</fieldset>
	</form>
<%@include file="../libraryBottom.jsp" %>