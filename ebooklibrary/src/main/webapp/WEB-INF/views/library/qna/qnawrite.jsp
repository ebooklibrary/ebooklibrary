<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../libraryTop.jsp" %>
<script type="text/javascript">
	
</script>
<div>
	<form name="frmWrite" id="frmWrite" method="post" 
		
		action="<c:url value='/library/qna/qnaWrite.do'/>" >
		<fieldset>
			<legend>QnA 글쓰기</legend>
				<input type="text" id="memberNo" name="memberNo" value="${sessionScope.memberNo }">
				<div class="">
					<label>${sessionScope.userName }</label><label>레벨체크</label>
				</div>
				<div class="">
					<label for="title">제목</label>
					<input type="text" id="title" name="title" />
				</div>
				<div >
					<label for="userName">${sessionScope.userName }</label>
					
				</div>
		        <div>
		        	<label for="content">내용</label>
		        </div>
		        <div>
		        	<textarea name="content" id="content" rows="12" cols="40"></textarea>
		        </div>
		        
		        <div>
		        	<input type="submit" value="작성완료"/>
		        	<input type="Button" value="글 목록"
		        	onclick="location.href='<c:url value="/library/qna/qnaList.do"/>';" />
		        </div>
		</fieldset>
	</form>
</div>
<%@include file="../libraryBottom.jsp" %>