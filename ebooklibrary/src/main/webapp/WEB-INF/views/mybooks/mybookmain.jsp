<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>여기가 내 서재</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/clear.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/mybook/mybookmain.css" />
</head>
<body>

	<div id="wrapper">
	
		<div id="recentBook">
		
			<div id="imgtest">
				<img alt="최근책 책장" src="${pageContext.request.contextPath }/images/mybook/testimg.jpg">
			</div>
			<div id="imgtest">
				<img alt="최근책 책장" src="${pageContext.request.contextPath }/images/mybook/testimg.jpg">
			</div>
			<div id="imgtest">
				<img alt="최근책 책장" src="${pageContext.request.contextPath }/images/mybook/testimg.jpg">
			</div>
			<div id="imgtest">
				<img alt="최근책 책장" src="${pageContext.request.contextPath }/images/mybook/testimg.jpg">
			</div>
			<div id="imgtest">
				<img alt="최근책 책장" src="${pageContext.request.contextPath }/images/mybook/testimg.jpg">
			</div>
			
			<div id="imgtest">
				<img title="QQ규" alt="최근책 책장" src="${pageContext.request.contextPath }/images/mybook/testimg.jpg">
			</div>
		
		</div>
		
		
		
		
		<div id="BookList">
			<p>누구누구 님의 서재</p>
			
			<a id="rentBook" href="#">대여책 목록</a>
			<a id="boughtBook" href="#">구매책 목록</a>
			
			<div id="myBooks">
				<div id="mybook">
					<a href="#">일<br>이<br>삼<br>사<br>오</a>
					<div id="mybookColor"></div>
				</div>
				<div id="mybook">
					<a href="#">a<br>b<br>c<br>d<br>e</a>
					<div id="mybookColor1"></div>
				</div>
				<div id="mybook">
					<a href="#">일<br>이<br>삼<br>사<br>오</a>
					<div id="mybookColor"></div>
				</div>
				<div id="mybook">
					<a href="#">a<br>b<br>c<br>d<br>e</a>
					<div id="mybookColor1"></div>
				</div><div id="mybook">
					<a href="#">일<br>이<br>삼<br>사<br>오</a>
					<div id="mybookColor"></div>
				</div>
				<div id="mybook">
					<a href="#">a<br>b<br>c<br>d<br>e</a>
					<div id="mybookColor1"></div>
				</div>
				
			
			</div>
		
		</div>
		
	</div>

</body>
</html>