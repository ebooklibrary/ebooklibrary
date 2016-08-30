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
	<h2>글 상세보기</h2>
	<div class="divForm">
		<div class="firstDiv">
			<span class="sp1">제목</span> <span>${qnaBoardVo.title}</span>
		</div>
		<div>
			<span class="sp1">작성자</span> <span>${qnaBoardVo.writer }</span>
		</div>
		<div>
			<span class="sp1">등록일</span> <span>${qnaBoardVo.regDate }</span>
		</div>
		<div>
			<span class="sp1">조회수</span> <span>${qnaBoardVo.readCount}</span>
		</div>
		<div class="lastDiv">			
			<p class="content">${qnaBoardVo.content }</p>
		</div>
		<div class="center">
			<a href="<c:url value='/library/qna/qnaEdit.do?qnaNo=${param.qnaNo }'/>">수정</a> |
        	<a href="<c:url value='/library/qna/qnaDelete.do?qnaNo=${param.qnaNo }'/>">삭제</a> |
        	<a href="<c:url value='/library/qna/qnalist.do'/>">목록</a>			
		</div>
	</div>
</body>
</html>