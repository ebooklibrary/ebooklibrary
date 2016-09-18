<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/library/qna.css" />
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
		$("#container_out").css("background","url(../../images/library/notice/noticeBackground.png) no-repeat center");
		
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
	
</script>
<!-- qna 쓰기 화면 -->
<div id="notice_head">
	<h2>
		<img alt="qna"
			src="${pageContext.request.contextPath }/images/library/qna/qnaboard.png"width="200px" height="50px">
	</h2>
</div>
<div id="notice_banner">
	<a href="<c:url value='/library/qna/qnaList.do'/>"><img
		alt="qna 배너"
		src="${pageContext.request.contextPath}/images/library/qna/qnabanner.png"
		width="200px" height="50px"></a>
</div>

<%@include file="../libraryAd.jsp"%>
<div id="Write_body">
	<form name="frmWrite" id="frmWrite" method="post" 
		action="<c:url value='/library/qna/qnaWrite.do'/>" >
		<fieldset>
			<legend>QnA 글쓰기</legend>
				<input type="hidden" id="memberNo" name="memberNo" value="${sessionScope.memberNo }">
				<div id="detail_body">
				<table class="detail_table">
					<tr >
						<td class="qnaTitle">제목</td>
						<td  colspan="5">
							<input type="text" id="title" name="title" size="35" />
						</td>
					</tr>
					<tr>
						<td  class="qnaTitle">작성자</td>
						<td  >&nbsp;&nbsp;${sessionScope.userName }</td>
					</tr>
				</table>
				<textarea class="w3-input" name="content" id="content" rows="10" cols="100" style="width:570px; height:230px;"></textarea>
		        <div id="Bticon">
		        	<input type="Button" value="글 목록"
		        	onclick="location.href='<c:url value="/library/qna/qnaList.do"/>';" style="width:80px; height:30px;"/>
		        	<input type="submit" value="작성완료" style="width:80px; height:30px;"/>
		        </div>
		       </div> 
		</fieldset>
	</form>
</div>
<%@include file="../libraryBottom.jsp" %>