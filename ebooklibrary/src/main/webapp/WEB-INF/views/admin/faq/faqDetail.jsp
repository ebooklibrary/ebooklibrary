<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../libraryAdminTop.jsp" %>
<!-- 스마트에디터 -->
<script type="text/javascript" src="<c:url value='/jquery/jquery-3.1.0.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/smarteditor/js/HuskyEZCreator.js'/>" charset="utf-8"></script>

<link rel="stylesheet" type="text/css"	href="${pageContext.request.contextPath }/css/library/faq.css" />
<script type="text/javascript">
$().ready(function(){
	///전역변수

	
	
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
<!-- faq edit 화면 -->
<div id="notice_head">
	<h2>
		<img alt="faq"
			src="${pageContext.request.contextPath }/images/library/ServiceCenter/faq.png" style="width: 150px;">
	</h2>
	<div id="faqWrite_body" >
		<form name="frmWrite" id="frmWrite" method="post" 			
			action="<c:url value='/library/serviceCenter/faq/faqEdit.do'/>" >
			<fieldset>
					<input type="hidden" id="category" name="category" value="member">
				<legend>FAQ 작성하기</legend>
					<br>
					
					<div>
						<div id="faqheader">
						<input type="hidden" name="faqNo" value="${faqDetail.faqNo}">
							<label for="faqcategory" class="lbfaq">분 류</label> 
							&nbsp;&nbsp;<select id="faqcategory" >
								<option value="member"
									<c:if test="${faqDetail.category=='member'}">
					            		selected
					            	</c:if>
									>회원가입</option>
								<option value="order"
									<c:if test="${faqDetail.category=='order'}">
					            		selected
					            	</c:if>
								
									>주문/결제</option>
								<option value="cancel"
									<c:if test="${faqDetail.category=='cancel'}">
					            		selected
					            	</c:if>
									>취소</option>
								<option value="product"
									<c:if test="${faqDetail.category=='product'}">
					            		selected
					            	</c:if>
									>책</option>
							</select><br>
							<label for="title" class="lbfaq">제 목</label>
							<input type="text" class="inputfaqText" id="title" name="title" value="${faqDetail.title }" readonly="readonly" />
						</div>	
					</div>
					<textarea class="w3-input" name="content" id="content" rows="10" cols="100" style="width:705px; height:300px;" readonly="readonly">${faqDetail.content }</textarea>
		        	<br>
	        		<div id="request_align_center">
		        		<input type="submit" value="수정하기" class="btfaqList"/>
		        		<input type="Button" value="취소" class="btfaqList"
		        		onclick="location.href='<c:url value="/library/serviceCenter/faq/faqList.do"/>';" />
		        	</div>
			</fieldset>
		</form>
	</div>
</div>



<%@include file="../libraryAdminBottom.jsp" %>