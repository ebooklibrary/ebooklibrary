<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
</script>
<table width="600">
	<caption>댓글</caption>
	<colgroup>
		<col style="width:10%;" />
		<col style="width:20%;" />
		<col style="width:30%;" />
		<col style="width:15%;" />
	</colgroup>
	<tbody>
		<c:set var="i" value="1" />
			<c:forEach var="clist" items="${ commentList}">			
				<tr>
					<td><input type="button" id="selectAnswer" value="답변채택" ></td>
					<td>${clist.userName }</td>
					<td>${clist.content }</td>
					<td>${clist.regDate }</td>
					<td><input type="button" onclick="reVisi(${i})" value="덧글"></td>
				</tr>
				<tr >
					<form id="refrm" method="post" action="<c:url value='/comments/commentWrite.do'/>"	>
					<td class="recmt" id="${i}" name="${i}" colspan="4" style="display:none">
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
						<label>${sessionScope.userName} </label> 
						<textarea name="content" id="content" row="10" cols="30" ></textarea>
						
						<input type="submit" value="덧글등록" >
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
		<textarea name="content" row="10" cols="30"></textarea>
		
		<input type="submit" value="등록" >
	</form>	
</div>