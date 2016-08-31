<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>여기가 내 서재</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/clear.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/mybook/mybookmain.css" />
<script type="text/javascript" src="<c:url value='/jquery/jquery-3.1.0.min.js'/>"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$(".mybook").click(function() {
			alert($(this).find(".mybook1").val());
		});
		
		$(".mybook").hover(function() {
				$(this).css("cursor","pointer");
			}, function() {
				$(this).css("cursor","");
		});
		
		$("html").css({"background":"url(<%=request.getContextPath() %>/images/mybook/back22.jpg)  no-repeat center center fixed",
							"-webkit-background-size": "cover",
							"-moz-background-size": "cover",
							"-o-background-size": "cover",
							"background-size": "cover"
		});
		
		
		
	
	});
</script>
</head>
<body>

	<div id="wrapper">
	
		<!-- 배경화면 바꾸기 -->
		<div id="changeBack">
			<span>배경화면 바꾸러 가자</span>
		</div>
	
		<!-- 최근 책 책장 -->
		<div id="recentBook">
		
			<div class="imgtest">
				<img alt="최근책 책장" src="${pageContext.request.contextPath }/images/mybook/testimg.jpg">
			</div>
			<div class="imgtest">
				<img alt="최근책 책장" src="${pageContext.request.contextPath }/images/mybook/testimg.jpg">
			</div>
			<div class="imgtest">
				<img alt="최근책 책장" src="${pageContext.request.contextPath }/images/mybook/testimg.jpg">
			</div>
			<div class="imgtest">
				<img alt="최근책 책장" src="${pageContext.request.contextPath }/images/mybook/testimg.jpg">
			</div>
			<div class="imgtest">
				<img alt="최근책 책장" src="${pageContext.request.contextPath }/images/mybook/testimg.jpg">
			</div>
			
			<div class="imgtest">
				<img title="QQ규" alt="최근책 책장" src="${pageContext.request.contextPath }/images/mybook/testimg.jpg">
			</div>
			<div class="imgtest">
				<img title="QQ규" alt="최근책 책장" src="${pageContext.request.contextPath }/images/mybook/testimg.jpg">
			</div>
			<div class="imgtest">
				<img title="QQ규" alt="최근책 책장" src="${pageContext.request.contextPath }/images/mybook/testimg.jpg">
			</div>
			<div class="imgtest">
				<img title="QQ규" alt="최근책 책장" src="${pageContext.request.contextPath }/images/mybook/testimg.jpg">
			</div>
			<div class="imgtest">
				<img title="QQ규" alt="최근책 책장" src="${pageContext.request.contextPath }/images/mybook/testimg.jpg">
			</div>
			
			<div class="imgtest">
				<img title="QQ규" alt="최근책 책장" src="${pageContext.request.contextPath }/images/mybook/testimg.jpg">
			</div>
			<div class="imgtest">
				<img title="QQ규" alt="최근책 책장" src="${pageContext.request.contextPath }/images/mybook/testimg.jpg">
			</div>
			<div class="imgtest">
				<img title="QQ규" alt="최근책 책장" src="${pageContext.request.contextPath }/images/mybook/testimg.jpg">
			</div>
			<div class="imgtest">
				<img title="QQ규" alt="최근책 책장" src="${pageContext.request.contextPath }/images/mybook/testimg.jpg">
			</div>
			<div class="imgtest">
				<img title="QQ규" alt="최근책 책장" src="${pageContext.request.contextPath }/images/mybook/testimg.jpg">
			</div>
		
		</div>
		
		
		
		<!-- 보관 책장 -->
		<div id="BookList">
			<p>누구누구 님의 책장</p>
			
			<a id="rentBook" href="#">대여책 목록</a>
			<a id="boughtBook" href="#">구매책 목록</a>
			
					<!-- <a href="#"><FONT style="WRITING-MODE: tb-rl; HEIGHT: 50pt">12345</FONT></a> -->
			<div id="myBooks">
			
			
				<div class="mybook" id="b01">
					<span>Game<br><br>Of<br><br>Thrones</span>
					<input class="mybook1" type="hidden" value="fileUrl">
					<div id="mybookColor"></div>
				</div>
				
				<div class="mybook" id="b02">
					<a href="#">국화꽃<br><br>향기</a>
					<input class="mybook1" type="hidden" value="fileUrl1">
					<div id="mybookColor1"></div>
				</div>
				
				<div class="mybook" id="b01">
					<span>Game<br><br>Of<br><br>Thrones</span>
					<input class="mybook1" type="hidden" value="fileUrl">
					<div id="mybookColor"></div>
				</div>
				
				<div class="mybook" id="b02">
					<a href="#">국화꽃<br><br>향기</a>
					<input class="mybook1" type="hidden" value="fileUrl1">
					<div id="mybookColor1"></div>
				</div>
				
				
			 <!-- 
				<a class="testa" href="#" id="b01">
					Game<br><br>Of<br><br>Thrones
					<input type="hidden" value="fileUrl">
					<span id="mybookColor1"></span>
				</a>
				
				<a class="testa" href="#" id="b02">
					국화꽃<br><br>향기
					<input type="hidden" value="fileUrl1">
					<span id="mybookColor"></span>
				</a>
			 -->
			</div> <!-- mybooks -->
			
		</div> <!-- BookList -->
		
	</div> <!-- wrapper -->

</body>
</html>