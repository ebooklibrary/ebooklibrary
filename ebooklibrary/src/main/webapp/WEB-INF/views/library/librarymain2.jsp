<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/clear.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/library/libraryMain.css" />
<script type="text/javascript" src="<c:url value='/jquery/jquery-3.1.0.min.js'/>"></script>

<script type="text/javascript">
	
</script>
</head>
<body>
	<div id="container_out">
		<a href="<c:url value='/index.do'/>">메인화면</a>
		<a href="<c:url value='/library/librarymain.do'/>">홈</a>
		<a href="<c:url value='/member/register.do'/>">회원가입</a>
		<a href="<c:url value='/member/login.do'/>">로그인</a>
		<a href="<c:url value='/mybooks/mybookmain.do'/>">내서재</a>
		<a >공지사항</a>
		<a>책 검색</a>
		<a>요청게시판</a>
		<a>질답게시판</a>
	</div>
	<div></div>
	
</body>
</html>