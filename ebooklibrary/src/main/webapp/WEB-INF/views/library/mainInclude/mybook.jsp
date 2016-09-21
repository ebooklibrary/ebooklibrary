<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="mybook">

	<p id="mbP">나만의 서재를 가져보세요. </p>
	<video id="main_video" autoplay muted loop>
		<img src="${pageContext.request.contextPath }/video/ocean.jpg" alt="동영상 커버">
		<source src="${pageContext.request.contextPath }/video/mainvideo.mp4" type="video/mp4">
	</video>
	
</div>
    