<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${sessionScope.auchCode=='ADMIN' }">
	<%@include file="../../admin/libraryAdminTop.jsp"%>
</c:if>
<c:if test="${sessionScope.auchCode!='ADMIN' }">
	<%@include file="../libraryTop.jsp"%>
</c:if>
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
						var a = $("#summary").val(); //변수 a에 값("텍스트에어리어 테스트")을 지정.

						$("#summary").val("${noticeVo.content}"); //텍스트 에어리어에 새로 값을 지정.

						$("#container_out")
								.css("background",
										"url(../../images/library/notice/noticeBackground.png) no-repeat center");

						var obj = [];
						//스마트에디터 프레임생성
						nhn.husky.EZCreator
								.createInIFrame({
									oAppRef : obj,
									elPlaceHolder : "summary",
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

						//전송버튼
						$("#btsubmit").click(
								function() {
									//id가 smarteditor인 textarea에 에디터에서 대입
									obj.getById["summary"].exec(
											"UPDATE_CONTENTS_FIELD", []);
									//폼 submit
									$("#frm1").submit();
								});

						$("#frm1")
								.submit(
										function() {
											if ($("#title").val() == "") {
												alertify.alert("제목을 입력하세요");
												$("#title").focus();
												event.preventDefault();
											} else if ($("#summary").val().length < 1
													|| $("#summary").val() == "<p>&nbsp;</p>") {
												alertify.alert("내용을 입력해주세요.");
												$("#summary").focus();

												return false;
											}
										});
					});
</script>
<div id="notice_banner">
	<a href="<c:url value='/library/notice/noticelist.do'/>"><img
		alt="공지사항 배너"
		src="${pageContext.request.contextPath}/images/library/notice/banner.png"
		width="200px" height="50px"></a>
</div>
<div id="Write_body">
	<form name="frm1" id="frm1" method="post" enctype="multipart/form-data"
		action="<c:url value ='/library/notice/noticeEdit.do'/>">
		<input type="hidden" name="noticeNo" id="noticeNo"
			value="${noticeVo.noticeNo }"> <input type="hidden"
			name="oldFileName" value="${noticeVo.fileName }"> <input
			type="hidden" name="oldFileSize" value="${noticeVo.fileSize }">
		<div class="notice_Write">
			<p id="edit_head">공지사항 수정 페이지</p>
		</div>
		<div id="edit_body">
			<table class="detail_table">
				<tr>
					<td class="qnaTitle"><label for="title">제목</label></td>
					<td colspan="5"><input type="text" id="title" name="title"
						value="${noticeVo.title }" size="35" style="padding-left: 10px;" />
					</td>
				<tr>
					<td class="qnaTitle"><label for="userName">작성자</label></td>
					<td style="padding-left: 10px;"><input type="text"
						name="userName" id="userName" value="${noticeVo.userName }"
						readonly="readonly"></td>
				</tr>
			</table>
			<div>
				<label>파일첨부</label> <input type="file" id="upfile" name="upfile">
				<c:if test="${!empty noticeVo.fileName }">
					<br>
					<p style="color: green; padding: 5px 0 5px 135px;">※첨부파일을 새로
						지정할 경우 기존파일 ${reBoardVo.fileName } 은 삭제됩니다.</p>
				</c:if>
			</div>
			<textarea class="w3-input" name="content" id="summary"
				style="width: 630px; height: 530px;"></textarea>

			<%-- <div class="notice_Title">
		제목 : <input type="text" name="title" id="title" value="${noticeVo.title }">
	</div>
	<div class="notice_UserName">
	</div>
	<div class="notice_Content">
		<p>
			<textarea class="w3-input" name="content" id="summary" style="width:630px; height:530px;"></textarea>
		</p>
	</div> --%>
			<div class="edit_submit">
				<input type="submit" id="btsubmit" value="글수정"> <input
					type="button" id="btn1" value="취소"
					onclick="location.href='<c:url value="/library/notice/noticelist.do"/>'" />
			</div>
		</div>
	</form>
</div>
<%@include file="../libraryBottom.jsp"%>