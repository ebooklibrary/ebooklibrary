<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="frmEdit" id="frmEdit" method="post" 
		
		action="<c:url value='/library/qna/qnaEdit.do'/>" >
		<input type="hidden" name="qnaNo" value="${qnaBoardVo.qnaNo }"/>
		<fieldset>
			<legend>QnA 수정하기</legend>
				<div class="">
					<label>${qnaBoardVo.writer}</label><label>레벨체크</label>
				</div>
				<div class="">
					<label for="title">제목</label>
					<input type="text" id="title" name="title" value="${qnaBoardVo.title }"/>
				</div>
				<div >
					<label for="writer">작성자</label>
					<input type="text" id="writer" name="writer" value="${qnaBoardVo.writer }">
				</div>
		        <div>
		        	<label for="content">내용</label>
		        </div>
		        <div>
		        	<textarea name="content" id="content" rows="12" cols="40">${qnaBoardVo.content }</textarea>
		        </div>
		        
		        <div>
		        	<input type="submit" value="수정하기"/>
		        	<input type="reset" value="취소"
		        	onclick="location.href='<c:url value="/library/qna/qnalist.do"/>';" />
		        </div>
		</fieldset>
	</form>
</body>
</html>