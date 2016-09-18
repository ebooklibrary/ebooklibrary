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
<c:if test="${sessionScope.auchCode=='ADMIN' }">
	<jsp:forward page="/admin/adminMain.do" ></jsp:forward>
</c:if>
 
	<video id="bg_video" autoplay muted loop>
		<img src="${pageContext.request.contextPath }/video/ocean.jpg" alt="동영상 커버">
		<source src="${pageContext.request.contextPath }/video/testvideo7.mp4" type="video/mp4">
	</video>
 
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

	<!-- 로그인폼 -->

	<div id="id01" class="modal">
	  <%-- <c:url value='/mybooks/mybookmain.do'/> --%>
	  <form class="modal-content animate" id="indexLoginForm" action="<c:url value='/member/myInfoChk.do'/>">
	    <div class="imgcontainer">
	      <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
	      <img src="img_avatar2.png" alt="Avatar" class="avatar">
	    </div>
	
	    <div class="container">
	      <label><b>Username</b></label>
	      <input type="text" placeholder="Enter Username" name="userId" required>
	
	      <label><b>Password</b></label>
	      <input type="password" placeholder="Enter Password" name="pwd" required>
	        
	      <button type="submit">Login</button>
	      <input type="checkbox" checked="checked"> Remember me
	    </div>
	
	    <div class="container" style="background-color:#f1f1f1">
	      <button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">Cancel</button>
	      <span class="psw">Forgot <a href="#">password?</a></span>
	    </div>
	  </form>
	</div>
	
	<script>
	// Get the modal
	var modal = document.getElementById('id01');
	
	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
	    if (event.target == modal) {
	        modal.style.display = "none";
	    }
	}
	</script>

</body>
</html>