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
<div id="notice_head">
	<h2>
		<img alt="qna"
			src="${pageContext.request.contextPath }/images/library/qna/qnaboard.png" style="width: 150px;">
	</h2>
</div>
<div id="notice_banner">
	<a href="<c:url value='/library/qna/qnaList.do'/>">
	<img
		alt="qna 배너"
		src="${pageContext.request.contextPath}/images/library/qna/qnabanner.png"
		width="200px" height="50px" ></a>
</div>
<c:import url="/event/sideEvent.do"></c:import>
<div id="Write_body">
	<form name="frmEdit" id="frmEdit" method="post" 
		action="<c:url value='/library/qna/qnaEdit.do'/>" >
		<fieldset>
			<legend>QnA 수정하기</legend>
				<input type="hidden" name="qnaNo" value="${qnaBoardVo.qnaNo }"/>
				<div id="detail_body">
				<table class="detail_table">
						<tr>
							<td class="qnaTitle">
								<label for="title">제목</label>
							</td>
							<td  colspan="5" >
								<input type="text" id="title" name="title" value="${qnaBoardVo.title }" size="35" style="padding-left:10px;"/>
							</td>
						<tr>
							<td class="qnaTitle">
								<label for="userName">작성자</label>
							</td>
							<td style="padding-left:10px;">	
								<input type="hidden" name="userName" id="userName" value ="${qnaBoardVo.userName }" readonly="readonly">
							</td>
						</tr>
					</table>
		        <div>
		        	<textarea name="content" id="content" rows="12" cols="40">${qnaBoardVo.content }</textarea>
		        </div>
		        
		        <div id="BtEditicon">
		        	<c:if test="${qnaBoardVo.memberNo==sessionScope.memberNo }">
			        	<input type="submit" value="수정하기" class="qnabt"/>
			        	<input type="reset" value="취소" class="qnabt"
			        	onclick="location.href='<c:url value="/library/qna/qnaDetail.do?qnaNo=${param.qnaNo }"/>';" />
		        	</c:if>
		        </div>
		       </div>
		</fieldset>
	</form>
</div>
<%@include file="../libraryBottom.jsp" %>