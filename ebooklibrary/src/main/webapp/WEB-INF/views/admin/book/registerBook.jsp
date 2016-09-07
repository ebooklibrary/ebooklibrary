<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../libraryAdminTop.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 외부스크립트 정규식 등등 -->
<script type="text/javascript" src="<c:url value='/js/common.js'/>"></script>

<!-- 달력 from jquery ui -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css">
<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/jqueryui.css" /> --%>
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
		/* 
		var ge=["n","FANTASY","SCIENCEFICTION","HORROR","DRAMA","ACTIONANDADVENTURE","ROMANCE","MYSTERY","SERIES","TRILOGY","COMICS","SATIRE","BIOGRAPHIES","AUTOBIOGRAPHIES","CHILDREN","DIARIES","SELFHELP","GUIDE","TRAVEL","RELIGION","PRAYERBOOKS","HISTORY","MATH","ANTHOLOGY","POETRY","JOURNALS","ENCYCLOPEDIAS","DICTIONARIES","SCIENCE","ART","COOKBOOKS","HEALTH"];
		 */
		var gn=["n","101","102","103","104","105","106","107","108","109","110","111","112","113","114","115","116","201","202","203","204","205","206","207","208","209","210","211","212","213","214","215"];
		var gh=["-Select-","판타지","공상과학소설","호러","드라마","액션및어드벤처","로맨스","미스터리","시리즈","트릴로지(3부작책)","만화","풍자","전기","자서전","아동도서","일기형식책","자기계발서","가이드","여행","종교책","기도하는책","역사책","수학책","시(선집),문집","시집","저널,학술지","백과사전","사전","과학책","예술책","요리책","헬스"];
		
		/* 책 장르 */
		var l="";
		for (var i = 0; i < gn.length; i++) {
			l+="<option value='"+gn[i]+"'>"+gh[i]+"</option>";
		}
		$("#genre").html(l);
		
		/////////////////////////////
	    $( "#genre" )
	      .selectmenu()
	      .selectmenu( "menuWidget" )
	        .addClass( "overflow" );
		
		/* 
	    $( "#genre" ).selectmenu();
		 */
		
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
				<label>가격</label>
				<input type="text" class="w3-input" id="price" name="price">
			</p>
			<p>
				<label>장르</label>
				<!-- <input type="text" class="w3-input" id="genre" name="genre"> -->
				<select name="genre" id="genre"></select>
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