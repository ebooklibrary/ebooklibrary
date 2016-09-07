<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../libraryTop.jsp" %>
<!-- 스마트에디터 -->
<script type="text/javascript" src="<c:url value='/smarteditor/js/HuskyEZCreator.js'/>" charset="utf-8"></script>

<!-- alert -->
<!-- ideally at the bottom of the page -->
<!-- also works in the <head> -->
<%-- <c:url value='/alertify.js-0.3.11/themes/alertify.core.css'/> --%>
<script src="<c:url value='/alertify.js-0.3.11/lib/alertify.min.js'/>"></script>
<!-- include the core styles -->
<link rel="stylesheet" href="<c:url value='/alertify.js-0.3.11/themes/alertify.core.css'/>" />
<%-- <link rel="stylesheet" href="<c:url value='/alertify.js-0.3.11/themes/alertify.bootstrap.css'/>" /> --%>
<!-- include a theme, can be included into the core instead of 2 separate files -->
<link rel="stylesheet" href="<c:url value='/alertify.js-0.3.11/themes/alertify.default.css'/>" />
<script type="text/javascript">
	$(document).ready(function() {
		//alertify.alert("책제목을 입력하세요");
		
		var oEditors = [];
		nhn.husky.EZCreator.createInIFrame({
		    oAppRef: oEditors,
		    elPlaceHolder: "content22",
		    sSkinURI: "<c:url value='/smarteditor/SmartEditor2Skin.html'/>",
		    fCreator: "createSEditor2"
		});
		
	});


function submitContents(elClickedObj) {
	// 에디터의 내용이 textarea에 적용된다.
	oEditors.getById["content22"].exec("UPDATE_CONTENTS_FIELD", []);
	
	// 에디터의 내용에 대한 값 검증은 이곳에서
	// document.getElementById("ir1").value를 이용해서 처리한다.
	
	try {
	    elClickedObj.form.submit();
	} catch(e) {}
}
	
	
</script>
<div>
	<form name="frmWrite" id="frmWrite" method="post" 
		
		action="<c:url value='/library/qna/qnaWrite.do'/>" >
		<fieldset>
			<legend>QnA 글쓰기</legend>
				<input type="text" id="memberNo" name="memberNo" value="${sessionScope.memberNo }">
				<div class="">
					<label>${sessionScope.userName }</label><label>레벨체크</label>
				</div>
				<div class="">
					<label for="title">제목</label>
					<input type="text" id="title" name="title" />
				</div>
				<div >
					<label for="userName">${sessionScope.userName }</label>
					
				</div>
				<!-- 
		        <div>
		        	<label for="content">내용</label>
		        </div>
		         -->
		        <!-- 
		        <div>
		        	<textarea name="content" id="content" rows="12" cols="40"></textarea>
		        </div>
		         -->
		         
		         <p>
					<textarea class="w3-input" name="content22" id="content22"></textarea>
				</p>
		         
		        <div>
		        	<input type="submit" value="작성완료"/>
		        	<input type="Button" value="글 목록"
		        	onclick="location.href='<c:url value="/library/qna/qnaList.do"/>';" />
		        </div>
		</fieldset>
	</form>
</div>
<%@include file="../libraryBottom.jsp" %>