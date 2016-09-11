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
		
		
		$("#frmEdit").submit(function() {
			obj.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
			
			if($("#title").val().length < 1 || $("#title").val()=="<p>&nbsp;</p>"){
	            
	            alert("제목을 입력하세요.");
	            $("#title").focus();
	            
	            return false;
	         }
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
	<form name="frmEdit" id="frmEdit" method="post" 
		
		action="<c:url value='/library/qna/qnaEdit.do'/>" >
		<input type="hidden" name="qnaNo" value="${qnaBoardVo.qnaNo }"/>
		<fieldset>
			<legend>QnA 수정하기</legend>
				<div class="">
					<label>${qnaBoardVo.userName}</label><label>레벨체크</label>
				</div>
				<div class="">
					<label for="title">제목</label>
					<input type="text" id="title" name="title" value="${qnaBoardVo.title }"/>
				</div>
				<div >
					<label for="userName">작성자</label>
					<input type="text" id="userName" name="userName" value="${qnaBoardVo.userName }">
				</div>
		        <div>
		        	<label for="content">내용</label>
		        </div>
		        <div>
		        	<textarea name="content" id="content" rows="12" cols="40">${qnaBoardVo.content }</textarea>
		        </div>
		        
		        <div>
		        	<input type="submit" value="수정하기"/>
		        	<input type="reset" value="취소"
		        	onclick="location.href='<c:url value="/library/qna/qnaDetail.do?qnaNo=${param.qanNo }"/>';" />
		        </div>
		</fieldset>
	</form>
<%@include file="../libraryBottom.jsp" %>