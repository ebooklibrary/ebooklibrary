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
	
	
	$().ready(function(){
		
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
		
		$("#delCmtfrm").submit(function(){
			if(confirm("삭제하시겠습니까?")){
				
				return true;
			}
			return false;
		});
		
		
		
	});
	function reVisi(num){
		
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
	
	function cmtEdit(num){
		
		if(document.getElementById(num).style.display=="none"){
			document.getElementsByClassName("cmt_td5").style="display:none";
			document.getElementById(num).style="display:''";
			document.getElementById("divCmw").style="visibility:hidden";
			
			return false;
		}
		if(document.getElementById(num).style.display==""){
			document.getElementsByClassName("cmt_td5").style="display:none";
			document.getElementById(num).style="display:none";
			document.getElementById("divCmw").style="visibility:visible";
			
		} 
	}
	
	function complete(qnaNo,commentNo){
		if(confirm("채택하시겠습니까?")){
			 location.href="<c:url value='/library/qna/completeQna.do?qnaNo="+qnaNo+"&commentNo="+commentNo+"'/>"; 
		}else{
			return false;
		}
		
	}
</script>
<div style="width:800px">
<table id="qnaCmt">
	<colgroup>
		<col style="width:15%;" />
		<col style="width:45%;" />
		<col style="width:20%;" />
		<col style="width:8%;" />
		<col style="width:8%;" />
		
			
	</colgroup>
	<thead>
	  <tr>
	    <th scope="col"></th>
	    <th scope="col"></th>
	    <th scope="col"></th>
	    <th scope="col"></th>
	    <th scope="col"></th>
	    
	  </tr>
	</thead> 
	<tbody>
		<c:set var="i" value="1" />
		<c:set var="j" value="10000" />
		
			<c:forEach var="clist" items="${ commentList}">			
				<tr class="cmtTr_1">
					<td class="cmt_td1" rowspan="2">
							<c:if test="${param.complete!='Y' }">
								<c:if test="${sessionScope.memberNo==param.memberNo &&  param.memberNo!=clist.memberNo}">
									<form>
										
										<c:if test="${clist.deleteCmt=='N' }">
										<input type="button" id="selectAnswer"
										 onclick="complete(${param.qnaNo},${clist.commentNo })" value="답변채택" >
										</c:if>	
									</form>
								</c:if>
							</c:if>
						<c:if test="${clist.selectCmt=='Y' }">
							<img src="<c:url value='/images/library/qna/selected.png'/>" width="50" >
						</c:if>
					</td>
					
					<td class="cmt_td2" rowspan="2">
						
						<c:if test="${clist.stepNo>0 }">
							<c:forEach begin='1' end="${clist.stepNo }" varStatus="status" >
								&nbsp;&nbsp;<img src="<c:url value='/images/library/qna/reply.png'/>" width="15">
							</c:forEach>
						</c:if>
						<c:if test="${clist.deleteCmt=='N' }">
							<c:if test="${!empty clist.originUser }">
								To.${clist.originUser}<br>
							</c:if>
							${clist.userName } : ${clist.content }
						</c:if>
						<c:if test="${clist.deleteCmt=='Y' }">
							작성자가 삭제한 댓글입니다.
						</c:if>
					</td>
						
					<td class="cmt_td3">
						<fmt:formatDate value="${clist.regDate }" pattern="MM/dd hh:mm:ss"/> 
					</td>
					<td>
						<c:if test="${sessionScope.memberNo==clist.memberNo}">
							<input type="button" onclick="cmtEdit(${j})" value="수정">
						</c:if>
					</td>
				</tr>
				<tr >
					<td class="cmt_td4">
						<c:if test="${sessionScope.memberNo!=clist.memberNo}">
							<input type="button" onclick="reVisi(${i})" value="덧글쓰기">
						</c:if>
					</td>
					<td>
						<c:if test="${sessionScope.memberNo==clist.memberNo}">
							<form id="delCmtfrm" method="post" action="<c:url value='/comments/commentDelete.do'/>">
								<input type="hidden" name="qnaNo" value="${param.qnaNo }"/>
								<input type="hidden" name="commentNo" value="${clist.commentNo }"/>
								<input type="hidden" name="groupNo" value="${clist.groupNo }"/>
								<input type="hidden" name="cmtGroupNo" value="${clist.cmtGroupNo }"/>
								<input type="hidden" name="sortNo" value="${clist.sortNo}"/>
								<input type="submit" value="삭제">
							</form>
						</c:if>
					</td>
				</tr>
				<tr>	
					<td class="recmt" id="${i}" name="${i}" colspan="5" style="display:none;" >
						<form id="refrm" method="post" action="<c:url value='/comments/commentWrite.do'/>">
							<c:set var="groupNo" value="${clist.commentNo }" />
							
							<c:if test="${clist.commentNo>clist.groupNo }">
								<c:set var="groupNo" value="${clist.groupNo }" />
							</c:if>
							<input type="hidden" name="groupNo" value="${groupNo }"/>
							<input type="hidden" name="cmtGroupNo" value="${clist.commentNo }"/>
							<input type="hidden" name="qnaNo" value="${param.qnaNo }"/>
							<input type="hidden" name="stepNo" value="${clist.stepNo+1}"/>
							<input type="hidden" name="sortNo" value="${clist.sortNo +1}"/>
							<input type="hidden" name="originUser" value="${clist.userName}"/>
							
							<input type="hidden" name="userName" value="${sessionScope.userName}"/>
							<input type="hidden" name="memberNo" value="${sessionScope.memberNo}"/>
							<label class="replyLb">${sessionScope.userName} </label> 
							<textarea name="content" id="content" row="10" cols="35" ></textarea>
							
							<input type="submit" id="replyCmt" value="덧글등록" >
							<input type="button" onclick="reVisi(${i})" value="취소" >
						</form>
					</td>
				</tr>
				<tr>
					<td class="cmt_td5" id="${j}" name="${j}"  colspan="5" style="display:none;" >
						<form id="refrm" method="post" action="<c:url value='/comments/commentEdit.do'/>">
							<input type="hidden" name="groupNo" value="${clist.groupNo }"/>
							<input type="hidden" name="commentNo" value="${clist.commentNo }"/>
							
							<input type="hidden" name="qnaNo" value="${param.qnaNo }"/>
							<input type="hidden" name="stepNo" value="${clist.stepNo}"/>
							<input type="hidden" name="sortNo" value="${clist.sortNo}"/>
							
							<input type="hidden" name="userName" value="${sessionScope.userName}"/>
							<input type="hidden" name="memberNo" value="${sessionScope.memberNo}"/>
							<label class="replyLb">${sessionScope.userName} </label> 
							<textarea name="content" id="content" row="10" cols="35" ></textarea>
							
							<input type="submit" id="replyCmt" value="수정하기" >
							<input type="button" onclick="cmtEdit(${j})" value="취소" >
						</form>
					</td>
				</tr>
				<c:set var="i" value="${i+1 }"/>
				<c:set var="j" value="${j+1 }"/>
			</c:forEach>

	</tbody>
</table>
</div>
<div id="divCmw" style="visibility:visible; table-layout:fixed;" >
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