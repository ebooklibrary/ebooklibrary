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
<script type="text/javascript">

	$(document).ready(function() {
		$('#mybook, #library').hover(
                function () {
                    /* $(this).css("background", "rgba(181,210,210,0.6)"); */
                    $(this).css("background", "rgba(181,210,210,0.6)");
                },
                function () {
                    /* $(this).css("background", "rgba(181,225,225,0.6)"); */
                    $(this).css("background", "");
                }
		);
	});


</script>
</head>
<body oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
<c:if test="${sessionScope.auchCode=='ADMIN' }">
	<jsp:forward page="/admin/adminMain.do" ></jsp:forward>
</c:if>
 
	<video id="bg_video" autoplay muted loop>
		<img src="${pageContext.request.contextPath }/video/ocean.jpg" alt="동영상 커버">
		<source src="${pageContext.request.contextPath }/video/testvideo7.mp4" type="video/mp4">
	</video>
 
	<div id="wrapper">
	
		<p><span id="typing">Are you ready to read Book?</span></p>
		<a id="mybook" href="<c:url value='/mybooks/mybookmain.do'/>">내 서재</a>
		<a id="library" href="<c:url value='/library/librarymain.do'/>">도서관</a>
		
	</div>

<script type="text/javascript">

	interval = 300;
		
	if(document.getElementById) {
	  t = document.getElementById("typing");
	  if(t.innerHTML) {
	    typingBuffer = ""; // buffer prevents some browsers stripping spaces
	    it = 0;
	    mytext = t.innerHTML;
	    t.innerHTML = "";
	    typeit();
	  }
	}

	function typeit() {
	  mytext = mytext.replace(/<([^<])*>/, "");     // Strip HTML from text
	  if(it < mytext.length) {
	    typingBuffer += mytext.charAt(it);
	    t.innerHTML = typingBuffer;
	    it++;
	    setTimeout("typeit()", interval);
	  }
	}

</script>

</body>
</html>