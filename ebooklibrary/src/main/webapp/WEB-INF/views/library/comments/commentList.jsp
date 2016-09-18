<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/silde_Notice/style.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/library/qnaCmt.css" />
<script type="text/javascript" src="<c:url value='/jquery/jquery-3.1.0.min.js'/>"></script>
<script type="text/javascript">
	
/* 	$(document).ready(function() {
		$(".reComment").click(function(){
			if($().css("display")=="none"){
				$().show();
			}else{
				$().hide();
			}
		});
	}); */
	
	function reVisi(num){
		/* 	document.getElementById(num).style="display:''"; */
		
		if(document.getElementById(num).style.display=="none"){
			document.getElementsByClassName("recmt").style="display:none";
			document.getElementById(num).style="display:''";
			document.getElementById("divCmw").style="visibility:hidden";
			
			return false;
		}
		if(document.getElementById(num).style.display==""){
			document.getElementsByClassName("recmt").style="display:none";
			document.getElementById(num).style="display:none";
			document.getElementById("divCmw").style="visibility:visible";
			
		} 
	}
	
	$().ready(function(){
	/* 	$("#selectAnswer").click(function(event){
			if(confirm("채택하시겠습니까?")){
				 location.href="<c:url value='/library/qna/completeQna.do?qnaNo="+${param.qnaNo }+"'/>"; 
			}
			if(!confirm("채택하시겠습니까?"){
				event.preventDefault();
			}
			
		}); */
		
		$("#replyCmt").click(function(){
			if($("#content").val()==""){
				alert("내용을 입력하세요");
				$("#content").focus();
				return false;
			}
		});
		
		$("#btCmW").click(function(){
			if($("#content1").val()==""){
				alert("내용을 입력하세요");
				$("#content1").focus();
				return false;
			}
		});
		
	});
	
	function complete(qnaNo,commentNo){
		if(confirm("채택하시겠습니까?")){
			 location.href="<c:url value='/library/qna/completeQna.do?qnaNo="+qnaNo+"&commentNo="+commentNo+"'/>"; 
		}else{
			return false;
		}
		
	}
</script>
<table id="qnaCmt" width="650px">
	<caption>댓글</caption>
	<tbody>
		<c:set var="i" value="1" />
			<c:forEach var="clist" items="${ commentList}">			
				<tr>
					<td style="text-align:right">
						<c:if test="${param.complete!='Y' }">
							<c:if test="${sessionScope.memberNo==param.memberNo }">
							<form>
								
								<input type="button" id="selectAnswer" onclick="complete(${param.qnaNo},${clist.commentNo })" value="답변채택" >
							</form>
							</c:if>
						</c:if>	
						<c:if test="${clist.selectCmt=='Y' }">
							<img src="<c:url value='/images/library/qna/selected.png'/>" width="50" >
						</c:if>
					</td>
					
					<td>
						<c:if test="${clist.stepNo>0 }">
							<c:forEach begin='1' end="${clist.stepNo }" varStatus="status" >
								<img src="<c:url value='/images/library/qna/reply.png'/>" width="15">
							</c:forEach>
						</c:if>
						${clist.userName } : ${clist.content }
					</td>
						
					<td>
						<fmt:formatDate value="${clist.regDate }" pattern="MM/dd hh:mm:ss"/> 
						<input type="button" onclick="reVisi(${i})" value="덧글쓰기">
					</td>
				</tr>
				<tr >
					<form id="refrm" method="post" action="<c:url value='/comments/commentWrite.do'/>">
						<td class="recmt" id="${i}" name="${i}" colspan="4" style="display:none;" >
							<c:set var="groupN" value="${clist.commentNo }" />
							<c:if test="${clist.commentNo>clist.groupNo }">
								<c:set var="groupN" value="${clist.groupNo }" />
							</c:if>
							<input type="hidden" name="groupNo" value="${groupN }"/>
							<input type="hidden" name="qnaNo" value="${param.qnaNo }"/>
							<input type="hidden" name="stepNo" value="${clist.stepNo+1}"/>
							<input type="hidden" name="sortNo" value="${clist.sortNo +1}"/>
							
							<input type="hidden" name="userName" value="${sessionScope.userName}"/>
							<input type="hidden" name="memberNo" value="${sessionScope.memberNo}"/>
							<label id="replyLb">${sessionScope.userName} </label> 
							<textarea name="content" id="content" row="20" cols="30" ></textarea>
							
							<input type="submit" id="replyCmt" value="덧글등록" >
							<input type="button" onclick="reVisi(${i})" value="취소" >
						</td>
					</form>
				</tr>
				<c:set var="i" value="${i+1 }"/>
			</c:forEach>

	</tbody>
</table>
<div id="divCmw" style="visibility:visible">
	<form name="cmWrite" id="cmWrite" method="post"
		action="<c:url value='/comments/commentWrite.do'/>" >
		<input type="hidden" name="qnaNo" value="${param.qnaNo }"/>
		<input type="hidden" name="userName" value="${sessionScope.userName}"/>
		<input type="hidden" name="memberNo" value="${sessionScope.memberNo}"/>
		<label>${sessionScope.userName} </label> 
		<textarea name="content" id="content1" row="10" cols="30"></textarea>
		
		<input type="submit" id="btCmW" value="등록" >
	</form>	
</div>