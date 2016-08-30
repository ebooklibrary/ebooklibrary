<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>QnA게시판 글쓰기</title>
<script type="text/javascript" 
	src="<c:url value='/jquery/jquery-3.1.0.min.js'/>"></script>
<script type="text/javascript">	
</script>
<style type="text/css">
	legend{
		border:1px solid eee;
	}
</style>
</head>
<body>
<div>
	<form name="frmWrite" id="frmWrite" method="post" 
		
		action="<c:url value='/library/qna/qnaWrite.do'/>" >
		<fieldset>
			<legend>QnA 글쓰기</legend>
				<div class="">
					<label>아이디</label><label>레벨체크</label>
				</div>
				<div class="">
					<label for="title">제목</label>
					<input type="text" id="title" name="title" />
				</div>
				<div >
					<label for="writer">작성자</label>
					<input type="text" id="writer" name="writer">
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
		        	onclick="location.href='<c:url value="/library/qna/qnalist.do"/>';" />
		        </div>
		</fieldset>
	</form>
</div>
</body>
</html>