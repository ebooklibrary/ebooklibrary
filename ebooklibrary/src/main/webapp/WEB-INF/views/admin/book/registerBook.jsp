<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../libraryAdminTop.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 외부스크립트 정규식 등등 -->
<script type="text/javascript" src="<c:url value='/js/common.js'/>"></script>

<!-- 달력 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css">
<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
<!-- 폼태그 -->
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<!-- 스마트에디터 -->
<script type="text/javascript" src="<c:url value='/smarteditor/js/HuskyEZCreator.js'/>" charset="utf-8"></script>
<!-- 내부 css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/library/bookpart.css" />

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
		
		
		$("#btBookUp").click(function(event) {
			
			if($("#title").val().length < 1){
				/* alert("책제목을 입력하세요"); */
				alertify.alert("책제목을 입력하세요"); 
				$("#title").focus();
				return false;
			}
			if($("#writer").val().length < 1){
				alert("작가명을 입력하세요");
				$("#writer").focus();
				return false;
			}
			if($("#publisher").val().length < 1){
				alert("출판사를 입력하세요");
				$("#publisher").focus();
				return false;
			}
			if($("#publication").val().length < 1){
				alert("출판일을 입력하세요");
				$("#publication").focus();
				return false;
			}
			if($("#genre").val().length < 1){
				alert("장르를 입력하세요");
				$("#genre").focus();
				return false;
			}
			if($("#price").val().length < 1){
				alert("가격을 입력하세요");
				$("#price").focus();
				return false;
			}
			
			if($("#bookFileName").val().length < 1){
				alert("등록하실 책을 업로드하여 주세요.");
				$("#bookFileName").focus();
				return false;
			}
			if($("#coverFileName").val().length < 1){
			alert($("#bookFileName").val());
				alert("등록하실 책의 커버를 업로드하여 주세요.");
				$("#coverFileName").focus();
				return false;
			}
			
			/* 
			if(!validate_userid($("#userid").val())){
				alert("아이디는 영문이나 숫자 _만 가능함");
				$("#userid").focus();
				return false;
			}
			 */
		}); //click
		
		
		
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
			<textarea class="w3-input" name="summary" id="summary"></textarea>
			</p>
			
		</div>
	
	
			<input type="submit" id="btBookUp" name="btBookUp" value="책올리기">
	</form>
<%@ include file="../libraryAdminBottom.jsp" %>