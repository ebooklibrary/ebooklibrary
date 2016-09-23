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
				alertify.alert("내용을 입력하세요");
				$("#content").focus();
				return false;
			}
		});
		
		$("#btCmW").click(function(){
			if($("#content1").val()==""){
				alertify.alert("내용을 입력하세요");
				$("#content1").focus();
				return false;
			}
		});
		
		$("#content1").click(function(){
			var memberNo = "${sessionScope.memberNo}";
			if(memberNo=='' || memebrNo.isEmpty){
				alertify.alert("로그인이 필요합니다.");
				$(location).attr('href',"<c:url value='/member/login.do'/>");
			}
		});
		
		$("#delCmt").click(function(){
			confirm("#delCmtfrm",event, "삭제하시겠습니까?");
			
		});
		
		$("#btSelCmt").click(function(){
			confirm("#SelCmt",event, "채택하시겠습니까?");
			
		});
		
		
		function confirm(id,event, msg) {
	        var evt = event;
	        event.preventDefault();
	        alertify.confirm(msg, function (e) {
	            if (e) {
	                $(id).submit();
	                return true;
	            } else {
	                return false;
	            }	
	        });
	    } 
		

		
		
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
	

</script>
<div style="width:800px">
<table id="qnaCmt">
	<colgroup>
		<col style="width:15%;" />
		<col style="width:45%;" />
		<col style="width:20%;" />
		<col style="width:10%;" />
		<col style="width:6%;" />
		
			
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
									<form id="SelCmt" method="post" action="<c:url value='/library/qna/completeQna.do'/>">
										
										<c:if test="${clist.deleteCmt=='N' }">
											<input type="hidden" name="qnaNo" value="${param.qnaNo}">
											<input type="hidden" name="commentNo" value="${clist.commentNo }">
											<input type="submit" id="btSelCmt" value="채택" class="bt_cmtSel">
										</c:if>	
									</form>
								</c:if>
							</c:if>
						<c:if test="${clist.selectCmt=='Y' }">
							<img src="<c:url value='/images/library/qna/selected.png'/>" height="35px" style="margin-right:10px;">
						</c:if>
					</td>
					
					<td class="cmt_td2" rowspan="2" id="reply_margin-left" >
						<p>
						<c:if test="${clist.stepNo>0}">
							<c:forEach begin='1' end="${clist.stepNo*2 }" varStatus="status" >
								&nbsp;
							</c:forEach>
							<img src="<c:url value='/images/library/qna/reply.png'/>" width="15px"> 
						</c:if>
						<c:if test="${clist.deleteCmt=='N' }"  >
								${clist.userName}
								 : ${clist.content }
						</c:if>
						<c:if test="${clist.deleteCmt=='Y' }">
							작성자가 삭제한 댓글입니다.
						</c:if>
						</p>
					</td>
						
					<td class="cmt_td3">
						<fmt:formatDate value="${clist.regDate }" pattern="MM/dd hh:mm:ss"/> 
					</td>
					<td>
						<c:if test="${sessionScope.memberNo==clist.memberNo}">
						</c:if>
					</td>
				</tr>
				<tr >
					<td class="cmt_td4">
						<c:if test="${!empty sessionScope.memberNo }">
							<c:if test="${sessionScope.memberNo!=clist.memberNo}">
								<input type="button" onclick="reVisi(${i})" value="덧글쓰기" class="bt_cmtList"/>
							</c:if>			
						</c:if>
						<c:if test="${sessionScope.memberNo==clist.memberNo}">
							<form id="delCmtfrm" method="post" action="<c:url value='/comments/commentDelete.do'/>">
								<input type="button" onclick="cmtEdit(${j})" value="수정"  class="bt_cmtList">
								<input type="hidden" name="qnaNo" value="${param.qnaNo }"/>
								<input type="hidden" name="commentNo" value="${clist.commentNo }"/>
								<input type="hidden" name="groupNo" value="${clist.groupNo }"/>
								<input type="hidden" name="cmtGroupNo" value="${clist.cmtGroupNo }"/>
								<input type="hidden" name="sortNo" value="${clist.sortNo}"/>
								<input type="submit" id="delCmt" value="삭제"  class="bt_cmtList">
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
							
							<input type="submit" id="replyCmt" value="덧글등록"  class="bt_cmtList">
							<input type="button" onclick="reVisi(${i})" value="취소" class="bt_cmtList">
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
							
							<input type="submit" id="replyCmt" value="수정하기"  class="bt_cmtList">
							<input type="button" onclick="cmtEdit(${j})" value="취소"  class="bt_cmtList">
						</form>
					</td>
				</tr>
				<c:set var="i" value="${i+1 }"/>
				<c:set var="j" value="${j+1 }"/>
			</c:forEach>

	</tbody>
</table>
<div id="divCmw" style="visibility:visible;"/>	
		<label id="lbcmt">${sessionScope.userName} </label> 
	<form name="cmWrite" id="cmWrite" method="post"
		action="<c:url value='/comments/commentWrite.do'/>" >
		<input type="hidden" name="qnaNo" value="${param.qnaNo }"/>
		<input type="hidden" name="userName" value="${sessionScope.userName}"/>
		<input type="hidden" name="memberNo" value="${sessionScope.memberNo}"/>
		<textarea name="content" id="content1" row="10" cols="30"></textarea>
		
		<input type="submit" id="btCmW" value="등록"  class="bt_cmtList" >
	</form>	
</div>
</div>


