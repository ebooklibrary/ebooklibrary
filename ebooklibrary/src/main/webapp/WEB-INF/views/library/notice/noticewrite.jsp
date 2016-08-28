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
	<!-- 관리자용 공지사항 추가 화면 -->
	<form name ="frm1" id = "frm1" method ="post" action="<c:url value ='/library/notice/noticewrite.do'/>">
		<h1> 글쓰기 화면</h1>
		<input type ="text" name ="name" value ="name">
	</form>
</body>
</html>