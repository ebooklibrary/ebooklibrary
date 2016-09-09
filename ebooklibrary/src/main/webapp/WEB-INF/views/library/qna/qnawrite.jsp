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
		///전역변수
		var obj = [];               
		//스마트에디터 프레임생성
		nhn.husky.EZCreator.createInIFrame({
		    oAppRef: obj,
		    elPlaceHolder: "content",
		    sSkinURI: "<c:url value='/smarteditor/SmartEditor2Skin.html'/>", 
		    htParams : {
		        // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
		        bUseToolbar : true,             
		        // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
		        bUseVerticalResizer : true,     
		        // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
		        bUseModeChanger : true, 
		    }
		});

		/* 
		//전송버튼
		$("#btBookUp").click(function(){
		    //id가 smarteditor인 textarea에 에디터에서 대입
		    obj.getById["summary"].exec("UPDATE_CONTENTS_FIELD", []);
		    //폼 submit
		    $("#bookfrm1").submit();
		});
		*/
		
		
		$("#frmWrite").submit(function() {
			obj.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
			
			if($("#content").val().length < 1 || $("#content").val()=="<p>&nbsp;</p>"){
	            
	            alert("내용을 입력하세요.");
	            $("#content").focus();
	            
	            return false;
	         }
			
		});
		
		
	});


function submitContents(elClickedObj) {
	// 에디터의 내용이 textarea에 적용된다.
	oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
	
	// 에디터의 내용에 대한 값 검증은 이곳에서
	// document.getElementById("ir1").value를 이용해서 처리한다.
	
	try {
	    elClickedObj.form.submit();
	} catch(e) {}
}

/* 


 */

	
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
			
				
					<p>
					<textarea class="w3-input" name="content" id="content" rows="10" cols="100" style="width:570px; height:230px;"></textarea>
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