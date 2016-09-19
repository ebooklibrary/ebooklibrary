<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../libraryTop.jsp" %>
<link rel="stylesheet" type="text/css"	href="${pageContext.request.contextPath }/css/library/request.css" />
<script type="text/javascript">
$().ready(function(){
	$("#requestDivColor").css("background-color","rgba(0, 250, 250, 0.5)");
	$("#container_out").css("background","url(../../images/library/notice/noticeBackground.png) no-repeat center");
});
</script>
<!-- request 리스트 화면 -->
<div id="notice_head">
	<h2>
		<img alt="qna"
			src="${pageContext.request.contextPath }/images/library/request/request.png" style="width: 150px;">
	</h2>
</div>
<div id="notice_banner">
	<a href="<c:url value='/library/request/requestList.do'/>"><img
		alt="request 배너"
		src="${pageContext.request.contextPath}/images/library/request/banner2.png"
		width="200px" height="50px"></a>
</div>
<!-- 광고 -->
<%@include file="../libraryAd.jsp"%>


<div id="ReqWrite_body">
	<form name="frmWrite" id="frmWrite" method="post" 			
		action="<c:url value='/library/request/requestWrite.do'/>" >
		<fieldset>
			<legend>요청게시판 글쓰기</legend>
				<div class="">
					<label>작성자</label>
					<input type="text" name="userName" id="userName" value="${sesssionScope.userName }" >
				</div>
				<div class="">
					<label for="title">책제목</label>
					<input type="text" id="title" name="title" />
				</div>
				<div >
					<label for="writer">저자</label>
					<input type="text" id="writer" name="writer">
				</div>
		        <div>
		       		<label for="publisher">출판사</label>
					<input type="text" id="publisher" name="publisher">
		        </div>
		        <div>
		        	<input type="text" name="memberNo" value="${sessionScope.memberNo }">
		        </div>
		        <div>
		        	<input type="text" name="userName" value="${sessionScope.userName }">
		        </div>
		        
		        <div>
		        	<input type="submit" value="작성완료"/>
		        	<input type="Button" value="글 목록"
		        	onclick="location.href='<c:url value="/library/request/requestList.do"/>';" />
		        </div>
		</fieldset>
	</form>
</div>
<%@include file="../libraryBottom.jsp" %>