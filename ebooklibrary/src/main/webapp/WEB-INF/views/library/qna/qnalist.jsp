<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>QnA게시판</title>
<script type="text/javascript" 
	src="<c:url value='/jquery/jquery-3.1.0.min.js'/>"></script>
<script type="text/javascript">	
</script>

</head>
<body>
	<h1>질답게시판</h1>
	<div class=""></div>
	<table class=""
	 	summary="질문게시판에 관한 표로써, 글번호, 제목, 작성자, 작성일, 조회수, 답변완료에 대한 정보를 제공합니다.">
	<caption>자료실</caption>
	<colgroup>
		<col style="width:10%;" />
		<col style="width:50%;" />
		<col style="width:15%;" />
		<col style="width:15%;" />
		<col style="width:10%;" />		
	</colgroup>
	<thead>
	  <tr>
	    <th scope="col">번호</th>
	    <th scope="col">제목</th>
	    <th scope="col">작성자</th>
	    <th scope="col">작성일</th>
	    <th scope="col">조회수</th>
	  </tr>
	</thead> 
	<tbody>
		<c:if test="${empty qnaList}">
			<tr>
				<td colspan="5">
				게시글이 없습니다.
				</td>
			</tr>
		</c:if>
		<c:if test="${!empty qnaList}">
			<c:forEach var="vo" items="${qnaList}">
			
				<tr>
					<td>${qnaNo }</td>
					<td><a href="<c:url value='/library/qna/qnalist.do?qnaNo=${qnaNo }'/>">'${title }</a></td>
					<td>${writer }</td>
					<td>${regDate }</td>
					<td>${readCount }</td>
					<h1>dd,d</h1>
				</tr>
				
			</c:forEach>
		</c:if>
	</tbody>
	</table>	   
</div>
<div class="divPage">

</div>
<div class="divSearch">
	<a href="<c:url value='library/qna/qnaWrite.do'/>">글쓰실?</a>
</div>
