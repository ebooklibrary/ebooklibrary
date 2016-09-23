<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../../libraryTop.jsp" %>
<!-- 스마트에디터 -->
<script type="text/javascript" src="<c:url value='/jquery/jquery-3.1.0.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/smarteditor/js/HuskyEZCreator.js'/>" charset="utf-8"></script>

<link rel="stylesheet" type="text/css"	href="${pageContext.request.contextPath }/css/library/faq.css" />
<script type="text/javascript">
$().ready(function(){
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
	
	
	$("#requestDivColor").css("background-color","rgba(0, 250, 250, 0.5)");
	
	$("#container_out").css("background","url(../../images/library/notice/noticeBackground.png) no-repeat center");
	
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
	
	$("#faqcategory").change(category);
	
	function category(){
		$("#category").val($("#faqcategory").val());
	}
	
	
	
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
<!-- request 리스트 화면 -->
<div id="notice_head">
	<h2>
		<img alt="faq"
			src="${pageContext.request.contextPath }/images/library/ServiceCenter/faq.png" style="width: 150px;">
	</h2>
	<div id="faqWrite_body" >
		<form name="frmWrite" id="frmWrite" method="post" 			
			action="<c:url value='/library/serviceCenter/faq/faqWrite.do'/>" >
			<fieldset>
				<legend>FAQ 작성하기</legend>
					<input type="hidden" id="category" name="category" value="member">
					<br>
					
					<div>
						<div id="faqheader">
							<label for="faqcategory" class="lbfaq">분 류</label> 
							&nbsp;&nbsp;<select id="faqcategory">
								<option value="member">회원가입</option>
								<option value="order">주문/결제</option>
								<option value="cancel">취소</option>
								<option value="product">상품</option>
							</select><br>
							<label for="title" class="lbfaq">제 목</label>
							<input type="text" class="inputfaqText" id="title" name="title" />
						</div>	
					</div>
					<textarea class="w3-input" name="content" id="content" rows="10" cols="100" style="width:705px; height:300px;"></textarea>
		        	<br>
	        		<div id="request_align_center">
		        		<input type="submit" value="작성완료" class="btfaqList"/>
		        		<input type="Button" value="취소" class="btfaqList"
		        		onclick="location.href='<c:url value="/library/serviceCenter/faq/faqList.do"/>';" />
		        	</div>
			</fieldset>
		</form>
	</div>
</div>



<%@include file="../../libraryBottom.jsp" %>