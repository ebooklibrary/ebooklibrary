<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>여기가 포도서관입니다.</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/clear.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/index.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/library/loginForm.css" />

<script type="text/javascript" src="<c:url value='/jquery/jquery-3.1.0.min.js'/>"></script>
<script type="text/javascript">

	$(document).ready(function() {
		/* 
		$('#mybook, #library').hover(
                function () {
                    $(this).css("background", "rgba(181,210,210,0.6)");
                },
                function () {
                    $(this).css("background", "");
                }
		);
		 */
		 
		$.ajax({
			url:"<c:url value='/visitor.do'/>",
			type:"GET",
			success:function(res){
				
			}
		});//ajax
	});


</script>
</head>
<body oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
 
	<video id="bg_video" autoplay muted loop>
		<img src="${pageContext.request.contextPath }/video/ocean.jpg" alt="동영상 커버">
		<source src="${pageContext.request.contextPath }/video/testvideo7.mp4" type="video/mp4">
	</video>
 	
 	<div id="IndexHeader">
 		<span id="indexTitle">ebooklibrary</span>
 		
 		<ul id="global">
			<c:if test="${empty sessionScope.userId }">
	            <li><a href="<c:url value='/member/register.do'/>" style="color:#A8E8FF;">회원가입</a></li>
				<li><a href="<c:url value='/member/login.do'/>" style="color:#BFFFCC;">로그인</a></li>
			</c:if>
			<c:if test="${!empty sessionScope.userId }">
				<li><a href="<c:url value='/member/logout.do'/>">로그아웃</a></li>
			</c:if>			 
		</ul>
 		
 		
 	</div>
 	
	<div id="wrapper">
	
		<p><span id="typing">Are you ready to read Book?</span></p>
		<%-- 
		<c:if test="${empty sessionScope.userId }">
			<a id="mybook" onclick="document.getElementById('id01').style.display='block'" style="width:auto;">내 서재</a>
		</c:if>
		
		<c:if test="${!empty sessionScope.userId }">
		</c:if>
		 --%>
			<a id="mybook" href="<c:url value='/mybooks/mybookmain.do'/>">내 서재</a>
		<!-- <button >Login</button> -->
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