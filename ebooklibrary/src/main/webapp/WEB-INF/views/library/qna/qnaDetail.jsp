<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../libraryTop.jsp" %>
<script type="text/javascript">
$().ready(function(){
	$("#preWriting").click(function(){
		$(location).attr('href',"<c:url value='/library/qna/prePage.do?qnaNo=${param.qnaNo}'/>");
	});
	
	$("#nextWriting").click(function(){
		$(location).attr('href',"<c:url value='/library/qna/nextPage.do?qnaNo=${param.qnaNo}'/>");
	});
});


</script>
	<h2>글 상세보기</h2>
	<div class="divForm">
		<div class="firstDiv">
			<span class="sp1">제목</span> <span>${qnaBoardVo.title}</span>
		</div>
		<div>
			<span class="sp1">작성자</span> <span>${qnaBoardVo.userName }</span>
		</div>
		<div>
			<span class="sp1">등록일</span> <span>${qnaBoardVo.regDate }</span>
		</div>
		<div>
			<span class="sp1">조회수</span> <span>${qnaBoardVo.readCount}</span>
		</div>
		<div class="lastDiv">			
			<p class="content">${qnaBoardVo.content }</p>
		</div>
		<div>
		<input type="button" id="preWriting" value="이전글"/>
		<input type="button" id="nextWriting" value="다음글"/>
		
		</div>
		<div class="center">
			<a href="<c:url value='/library/qna/qnaEdit.do?qnaNo=${param.qnaNo }'/>">수정</a> |
        	<a href="<c:url value='/library/qna/qnaDelete.do?qnaNo=${param.qnaNo }'/>">삭제</a> |
        	<a href="<c:url value='/library/qna/qnaList.do'/>">목록</a>			
		</div>
	</div>
<%@include file="../libraryBottom.jsp" %>