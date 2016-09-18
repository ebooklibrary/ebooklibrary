<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="mybook">

	<span id="mbSpan">내 서재로 가볼까요?</span>
	<video id="main_video" autoplay muted loop>
		<img src="${pageContext.request.contextPath }/video/ocean.jpg" alt="동영상 커버">
		<source src="${pageContext.request.contextPath }/video/mainvideo.mp4" type="video/mp4">
	</video>
	
</div>
    