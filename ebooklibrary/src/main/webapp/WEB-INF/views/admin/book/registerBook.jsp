<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../libraryAdminTop.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css">
<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
<script type="text/javascript" src="<c:url value='/smarteditor/js/HuskyEZCreator.js'/>" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/library/bookpart.css" />
<script type="text/javascript">
	$(document).ready(function() {
		
		$( "#publication" ).datepicker({
			changeMonth: true, changeYear: true
		});
		$( "#publication" ).datepicker( "option", "dateFormat", "yy/mm/dd" );
		
		var oEditors = [];
		nhn.husky.EZCreator.createInIFrame({
		    oAppRef: oEditors,
		    elPlaceHolder: "summary",
		    sSkinURI: "<c:url value='/smarteditor/SmartEditor2Skin.html'/>",
		    fCreator: "createSEditor2"
		});
		
		$("#w3-input").css("background-color","");
		
		
	});

	
	function submitContents(elClickedObj) {
		// 에디터의 내용이 textarea에 적용된다.
		oEditors.getById["summary"].exec("UPDATE_CONTENTS_FIELD", []);
		
		// 에디터의 내용에 대한 값 검증은 이곳에서
		// document.getElementById("ir1").value를 이용해서 처리한다.
		
		try {
		    elClickedObj.form.submit();
		} catch(e) {}
	}


</script>

	<!-- 
		<span>책제목</span><input type="text" class="w3-input" id="title" name="title">
		<span>작가명</span><input type="text" class="w3-input" id="writer" name="writer">
		<span>출판사</span><input type="text" class="w3-input" id="publisher" name="publisher">
		<span>출판일</span><input type="text" class="w3-input" id="publication" name="publication" readonly>
		<span>장르</span><input type="text" class="w3-input" id="genre" name="genre">
		<span>가격</span><input type="text" class="w3-input" id="price" name="price">
		
		<span>책파일</span><input type="file" id="bookFileName" name="bName">
		<span>책커버</span><input type="file" id="coverFileName" name="cName">
		<span>요약</span><input type="text" id="summary" name="summary">
	 -->

	<form action="<c:url value='/admin/book/uploadBook.do'/>" class="w3-container" id="bookfrm1" name="bookfrm1" enctype="multipart/form-data" method="post">
		<div id="formWrapper1">
			<div class="w3-container w3">
				<h2>책을 올려 봅시다!</h2>
			</div>
			<p>
				<label>책제목</label>
				<input type="text" class="w3-input" id="title" name="title">
			</p>
			
			<p>
				<label>작가명</label>
				<input type="text" class="w3-input" id="writer" name="writer">
			</p>
			
			<p>
				<label>출판사</label>
				<input type="text" class="w3-input" id="publisher" name="publisher">
			</p>
			<p>
				<label>출판일</label>
				<input type="text" class="w3-input" id="publication" name="publication" readonly>
			</p>
			<p>
				<label>장르</label>
				<input type="text" class="w3-input" id="genre" name="genre">
			</p>
			<p>
				<label>가격</label>
				<input type="text" class="w3-input" id="price" name="price">
			</p>
		</div>
		
		<div id="formWrapper2">
			<div class="w3-container w3">
				<h2>책을 올려 봅시다!</h2>
			</div>
			<p>
				<label>책파일</label>
				<input type="file" class="w3-input" id="bookFileName" name="bName">
			</p>
			
			<p>
				<label>책커버</label>
				<input type="file" class="w3-input" id="coverFileName" name="cName">
			</p>
			
			<!-- 
			<p>
				<label>요약</label>
				<input type="textfield" class="w3-input" id="summary" name="summary">
			</p>
			-->
			
			<br><br>
			<p>
			<label>요약</label>
			<textarea class="w3-input" name="summary" id="summary">에디터에 기본으로 삽입할 글(수정 모드)이 없다면 이 value 값을 지정하지 않으시면 됩니다.</textarea>
			</p>
			
		</div>
	
	
			<input type="submit" id="btBookUp" name="btBookUp" value="확인">
	</form>
<%@ include file="../libraryAdminBottom.jsp" %>