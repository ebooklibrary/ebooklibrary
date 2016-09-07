<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="cmWrite" id="cmWrite" method="post"
	action="<c:url value='/comments/commentwrite.do'/>">
	<div></div>
	<label>${sessionScope.userName} </label> <textarea name="content" row="10" cols="30"></textarea>
</form>	 
</body>
</html>