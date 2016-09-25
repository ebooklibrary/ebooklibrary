<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../libraryAdminTop.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 달력 from jquery ui -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css">
<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/jqueryui.css" /> --%>
<!-- W3 폼태그 -->
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<!-- 스마트에디터 -->
<!-- <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script> -->
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
<!-- common.js / 외부스크립트 정규식 등등 -->
<script type="text/javascript" src="<c:url value='/js/common.js'/>"></script>

<script type="text/javascript">
	$(document).ready(function() {
		
		$("#bookRegiDivColor").css("background-color","rgba(0, 250, 250, 0.5)");
		 
		 $("#publication").datepicker({
				dateFormat:"yy/mm/dd",
				changeMonth: true,
				changeYear:true,
				dayNamesMin:['일','월','화','수','목','금','토'],
				monthNames:['1월','2월','3월','4월','5월','6월',
				            '7월','8월','9월','10월','11월','12월'],
		 		yearRange: '1900:2100'
			});
		// Getter
		var monthNamesShort = $( "#publication" ).datepicker( "option", "monthNamesShort" );
		// Setter
		$( "#publication" ).datepicker( "option", "monthNamesShort", ['1월','2월','3월','4월','5월','6월',
		                                   			            '7월','8월','9월','10월','11월','12월'] );
		 
		//전역변수
	    var obj = [];               
	    //스마트에디터 프레임생성
	    nhn.husky.EZCreator.createInIFrame({
	    	oAppRef: obj,
	        elPlaceHolder: "summary",
	        sSkinURI: "<c:url value='/smarteditor/SmartEditor2Skin.html'/>", 
	        htParams : {
	            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseToolbar : true,
	            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseVerticalResizer : false,
	            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseModeChanger : true,
	        }
	    });
	    /* 
	    $("#btBookUp").click(function(){
	        //id가 smarteditor인 textarea에 에디터에서 대입
	        obj.getById["summary"].exec("UPDATE_CONTENTS_FIELD", []);
	        //폼 submit
	        $("#bookfrm1").submit();
	    });
	     */
	    
		/* 
		var oEditors = [];
		nhn.husky.EZCreator.createInIFrame({
		    oAppRef: oEditors,
		    elPlaceHolder: "summary",
		    sSkinURI: "<c:url value='/smarteditor/SmartEditor2Skin.html'/>",
		    fCreator: "createSEditor2"
		});
		 */
		
		$("#btBookUp").click(function(event) {
			obj.getById["summary"].exec("UPDATE_CONTENTS_FIELD", []);
			/* alertify.alert($("#summary").val()); */
			
			if($("#title").val().length < 1){
				/* alert("책제목을 입력하세요"); */
				alertify.alert("책제목을 입력하세요"); 
				$("#title").focus();
				return false;
			}
			if($("#writer").val().length < 1){
				alertify.alert("작가명을 입력하세요");
				$("#writer").focus();
				return false;
			}
			if($("#publisher").val().length < 1){
				alertify.alert("출판사를 입력하세요");
				$("#publisher").focus();
				return false;
			}
			if($("#publication").val().length < 1){
				alertify.alert("출판일을 입력하세요");
				$("#publication").focus();
				return false;
			}
			if($("#price").val().length < 1){
				alertify.alert("가격을 입력하세요");
				$("#price").focus();
				return false;
			}
			if($("#genre").val()==0){
				alertify.alert("장르를 입력하세요");
				$("#genre").focus();
				return false;
			}
			
			
			if($("#summary").val().length < 1 || $("#summary").val()=="<p>&nbsp;</p>"){
				
				alert("내용을 입력하세요.");
				$("#summary").focus();
			   
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
		
		$("#genre").html(l);
		
		var Fgenre=${bookVo.genre };
		$("#genre").val(Fgenre);
		
		
		/* 출판 날짜 설정 */
		$.getDate=function(date){
			var str=date.getFullYear()+"-"+$.findDate(date.getMonth()+1)+"-"+$.findDate(date.getDate());
			return str;
		}
		$.findDate=function(d){
			var res=d;
			if (d<10) {
				res="0"+d;
			}
			return res;
		}
		var Fpubdate="${bookVo.publication }";
		var Zpubdate = new Date(Fpubdate);
		var Apubdate=$.getDate(Zpubdate);
		var Bpubdate=Apubdate.replace("-","/");
		var Bpubdate=Bpubdate.replace("-","/");
		$("#publication").val(Bpubdate);
		
		
		/////////////////////////////
		/* 
	    $( "#genre" )
	      .selectmenu()
	      .selectmenu( "menuWidget" )
	        .addClass( "overflow" );
		 */
		/* 
	    $( "#genre" ).selectmenu();
		 */
		 
	    $("#btBookReset").click(function(){

	    	$("#genre").val("0");
	    	$("input").not("input[class=btRegiBook]").val("");
	    	$("#summary").val("");
	    	//아이프레임 안의 태그 접근
	    	$('iframe[src="/ebooklibrary/smarteditor/SmartEditor2Skin.html"]').contents().find('iframe[name=se2_iframe]').contents().find("body").text("");
	    	obj.getById["summary"].exec("UPDATE_CONTENTS_FIELD", []);
	    	/* 
	    	alert($('iframe[src="/ebooklibrary/smarteditor/SmartEditor2Skin.html"]').contents().find('iframe[name=se2_iframe]').contents().find("body").text());
	         */  
	    });
		
	});

	/* 
	function submitContents(elClickedObj) {
		// 에디터의 내용이 textarea에 적용된다.
		oEditors.getById["summary"].exec("UPDATE_CONTENTS_FIELD", []);
		
		// 에디터의 내용에 대한 값 검증은 이곳에서
		// document.getElementById("ir1").value를 이용해서 처리한다.
		
		try {
		    elClickedObj.form.submit();
		} catch(e) {}
	}
 */

</script>
	<p id="adminTitleP"><img alt="아이콘" src="<c:url value='/images/mybook/icon/process.png'/>"> 책 수정 페이지</p>
	<!-- <span id="regiBookTitle">책 등록</span> -->
	<form action="<c:url value='/admin/book/bookEdit.do'/>" class="w3-container" id="bookfrm1" name="bookfrm1" enctype="multipart/form-data" method="post">
				<input type="hidden" class="w3-input" id="bookNo" name="bookNo" value="${bookVo.bookNo }">
		<div id="formWrapper1">
		<!-- 
			<div class="w3-container w3">
				<h2>책 등록</h2>
			</div>
			 -->
			<p>
				<label>책제목 :</label>
				<input type="text" class="w3-input" id="title" name="title" value="${bookVo.title }">
			</p>
			<p>
				<label>작가명 :</label>
				<input type="text" class="w3-input" id="writer" name="writer" value="${bookVo.writer }">
			</p>
			<p>
				<label>출판사 :</label>
				<input type="text" class="w3-input" id="publisher" name="publisher" value="${bookVo.publisher }">
			</p>
			<p>
				<label>출판일 :</label>
				<input type="text" class="w3-input" id="publication" name="publication" readonly>
			</p>
			<p>
				<label>가격 :</label>
				<input type="text" class="w3-input" id="price" name="price" value="${bookVo.price }">
			</p>
			<p>
				<label>장르 :</label>
				<!-- <input type="text" class="w3-input" id="genre" name="genre"> -->
				<select name="genre" id="genre"></select>
			</p>
			<p>
				<label>책파일</label>
				<input type="file" class="w3-input" id="bookFileName" name="bName">
				<input type="hidden" class="w3-input" id="bookFileName" name="bookFileName" value="${bookVo.bookFileName }">
				<input type="hidden" class="w3-input" id="oriBookFileName" name="oriBookFileName" value="${bookVo.oriBookFileName }">
			</p>
			<p>
				<label>책커버</label>
				<input type="file" class="w3-input" id="coverFileName" name="cName">
				<input type="hidden" class="w3-input" id="coverFileName" name="coverFileName" value="${bookVo.coverFileName }">
				<input type="hidden" class="w3-input" id="oriCoverFileName" name="oriCoverFileName" value="${bookVo.oriCoverFileName }">
			</p>
				<label>기존 책</label>
				<p style="border-bottom: 1px solid #808080; text-align: right; margin-bottom: 20px;">${bookVo.oriBookFileName }</p>
				<label>기존 책커버</label>
				<p style="border-bottom: 1px solid #808080; text-align: right;">${bookVo.oriCoverFileName }</p>
		</div>
		
		<div id="formWrapper2">
			<!-- 
			<p>
				<label>요약</label>
				<input type="textfield" class="w3-input" id="summary" name="summary">
			</p>
			-->
				<p>책 요약</p>
				<!-- <textarea class="w3-input" name="summary" id="summary"></textarea> -->
				<textarea name="summary" id="summary" rows="10" cols="100" style="width:570px; height:230px;">${bookVo.summary }</textarea>
			
		</div>
	
	
			<input type="button" class="btRegiBook" id="btBookReset" value="입력 초기화">
			<input type="submit" class="btRegiBook" id="btBookUp" name="btBookUp" value="책 수정하기">
	</form>
<%@ include file="../libraryAdminBottom.jsp" %>