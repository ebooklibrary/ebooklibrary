<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../libraryTop.jsp" %>
<link rel="stylesheet" type="text/css"	href="${pageContext.request.contextPath }/css/library/request.css" />
<script type="text/javascript">
$().ready(function(){
	$("#requestDivColor").css("background-color","rgba(0, 250, 250, 0.5)");
	$("#container_out").css("background","url(../../images/library/notice/noticeBackground.png) no-repeat center");
	
	$("#frmWrite").submit(function(){
		if($("#title").val().length<1){
			alert("책제목을 입력하세요");				
			$("#title").focus();
			return false;
		}else if($("#writer").val().length<1){
			alert("저자를 입력하세요");				
			$("#writer").focus();
			return false;
		}else if($("#publisher").val().length<1){
			alert("출판사를 입력하세요");				
			$("#publisher").focus();
			return false;
		}	
	});
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


<div id="ReqWrite_body" class="FormRequest">
	<form name="frmWrite" id="frmWrite" method="post" 			
		action="<c:url value='/library/request/requestWrite.do'/>" >
		<fieldset>
			<legend>책 요청하기</legend>
	        	<input type="hidden" name="memberNo" value="${sessionScope.memberNo }">
				<input type="hidden" name="userName" id="userName" value="${sessionScope.userName }" readonly="readonly">
				<br>
				<label for="title">책제목</label>
				<input type="text" class="inputText" id="title" name="title" />
				<br>
				<label for="writer">저  자</label>
				&nbsp;&nbsp;<input type="text" class="inputText" id="writer" name="writer" />
	       		<br>
	       		<label for="publisher">출판사</label>
				<input type="text" class="inputText" id="publisher" name="publisher">
	        	<br>
	        	<div id="request_align_center">
	        		<input type="submit" value="작성완료" class="reqbt"/>
	        		<input type="Button" value="취소" class="reqbt"
	        		onclick="location.href='<c:url value="/library/request/requestList.do"/>';" />
	        	</div>
		</fieldset>
	</form>
</div>
<%@include file="../libraryBottom.jsp" %>