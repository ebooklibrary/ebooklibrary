<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인화면임ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/clear.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/index.css" />
<script type="text/javascript" src="<c:url value='/jquery/jquery-3.1.0.min.js'/>"></script>
</head>
<body>
<%-- 
	<video autoplay loop poster="${pageContext.request.contextPath }/video/ocean.jpg">
		<source src="${pageContext.request.contextPath }/video/ocean.mp4" type="video / mp4">
	</video>
 --%>
 
	<video id="bg_video" autoplay muted loop>
		<img src="${pageContext.request.contextPath }/video/ocean.jpg" alt="동영상 커버">
		<source src="${pageContext.request.contextPath }/video/ocean.mp4" type="video/mp4">
	</video>
	
 
	<div id="wrapper">
	
		<a id="mybook" href="<c:url value='/mybooks/mybookmain.do'/>">내 서재</a>
		<a id="library" href="<c:url value='/library/librarymain.do'/>">도서관</a>
		
	</div>

</body>
</html>