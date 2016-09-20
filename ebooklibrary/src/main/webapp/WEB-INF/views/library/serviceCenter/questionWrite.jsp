<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../libraryTop.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 스마트에디터 -->
<script type="text/javascript"
	src="<c:url value='/smarteditor/js/HuskyEZCreator.js'/>"
	charset="utf-8"></script>

<!-- alert -->
<!-- ideally at the bottom of the page -->
<!-- also works in the <head> -->
<%-- <c:url value='/alertify.js-0.3.11/themes/alertify.core.css'/> --%>
<script src="<c:url value='/alertify.js-0.3.11/lib/alertify.min.js'/>"></script>
<!-- include the core styles -->
<link rel="stylesheet"
	href="<c:url value='/alertify.js-0.3.11/themes/alertify.core.css'/>" />
<%-- <link rel="stylesheet" href="<c:url value='/alertify.js-0.3.11/themes/alertify.bootstrap.css'/>" /> --%>
<!-- include a theme, can be included into the core instead of 2 separate files -->
<link rel="stylesheet"
	href="<c:url value='/alertify.js-0.3.11/themes/alertify.default.css'/>" />
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						///전역변수
						var obj = [];
						//스마트에디터 프레임생성
						nhn.husky.EZCreator
								.createInIFrame({
									oAppRef : obj,
									elPlaceHolder : "qContent",
									sSkinURI : "<c:url value='/smarteditor/SmartEditor2Skin.html'/>",
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

						$("#question")
								.submit(
										function() {
											obj.getById["qContent"]
													.exec(
															"UPDATE_CONTENTS_FIELD",
															[]);

											if ($("#title").val().length < 1
													|| $("#title").val() == "<p>&nbsp;</p>") {

												alert("제목을 입력하세요.");
												$("#title").focus();

												return false;
											}
											if ($("#qContent").val().length < 1
													|| $("#qContent").val() == "<p>&nbsp;</p>") {

												alert("내용을 입력하세요.");
												$("#qContent").focus();

												return false;
											}

										});
						$("#container_out")
								.css("background",
										"url(../../images/library/notice/noticeBackground.png) no-repeat center");

					});

	function submitContents(elClickedObj) {
		// 에디터의 내용이 textarea에 적용된다.
		oEditors.getById["qContent"].exec("UPDATE_CONTENTS_FIELD", []);

		// 에디터의 내용에 대한 값 검증은 이곳에서
		// document.getElementById("ir1").value를 이용해서 처리한다.

		try {
			elClickedObj.form.submit();
		} catch (e) {
		}
	}
</script>

<!-- 1:1 문의 글쓰기 화면 -->
<form name="question" id="question" method="post"
	action="<c:url value ='/library/serviceCenter/questionWrite.do'/>">
	<input type="hidden" name="memberNo" id="memberNo"
		value="${sessionScope.memberNo }">
	<div>
		<p class ="question_p">1:1 문의 하기</p>
	</div>
	<div class= "question">
		<div class="question_head">
			<div class="question_Title">
				제목 : <input type="text" name="title" id="title">
			</div>
			<div>
				작성자 : <input type="text" name="userName" id="userName"
					value="${sessionScope.userName }" readonly="readonly">
			</div>
		</div>
		<div class="question_body">
			<div class="question_Content">
				<p>
					<textarea class="w3-input" name="qContent" id="qContent"
						style="width: 630px; height: 530px;"></textarea>
				</p>
			</div>
		</div>
		<div class="question_submit">
			<input type="submit" id="buttonSubmit" value="문의하기"> <input
				type="button" id="button" value="취소"
				onclick="location.href='<c:url value="/library/serivceCenter/libraryServicecenter.do"/>'" />
		</div>
	</div>
</form>
<%@include file="../libraryBottom.jsp"%>