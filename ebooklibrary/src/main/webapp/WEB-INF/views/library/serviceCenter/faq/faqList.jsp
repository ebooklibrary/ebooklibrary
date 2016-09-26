<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../../libraryTop.jsp" %>
<link rel="stylesheet" type="text/css"	href="${pageContext.request.contextPath }/css/library/faq.css" />
<script type="text/javascript" src="<c:url value='/jquery/jquery-3.1.0.min.js'/>"></script>
<script type="text/javascript">
	$().ready(function(){
		$("#qnaDivColor").css("background-color","rgba(0, 250, 250, 0.5)");
		
		
		$("#listGo").click(function(){
			$(location).attr('href',"<c:url value='/library/serviceCenter/faq/faqList.do'/>");
		});
		
		
		
		
		
	});
	function viewContent(num){
		var id1="FAQ_List_"+num;
		
		var id2="DivFAQ_Content_"+num;
		
		if(document.getElementById(id1).className=='off'){
			document.getElementById(id1).setAttribute('class', 'on');
			/* document.getElementsByClassName("divContent").style="display:none"; */
			document.getElementById(id2).style="display:''";
			
			return false;
		}
		if(document.getElementById(id1).className=='on'){
			document.getElementById(id1).setAttribute('class', 'off');
			/* document.getElementsByClassName("divContent").style.display='none'; */
			document.getElementById(id2).style="display:none";
			
			
			return false;
		} 
	
	}
	
	function pageFunc(curPage){
		document.frmPage.currentPage.value=curPage;
		frmPage.submit();
	}	

</script>
<form name="frmPage" method="post" action="<c:url value='/library/serviceCenter/faq/faqList.do'/>">
	
	<input type="hidden" name="currentPage">
	<input type="hidden" name="searchCondition" value="${param.searchCondition }">
	<input type="hidden" name="searchKeyword" value="${param.searchKeyword }">
	
</form>
<!-- qna 리스트 화면 -->
<div id="notice_head">
	<h2>
		<img alt="faq"
			src="${pageContext.request.contextPath }/images/library/ServiceCenter/faq.png" style="width: 150px;">
	</h2>
</div>

<div id=faq_body>
	<div id="faqList_body">	
		   	<form name="frmSearch" id="searchbox2" method="post" 
		   		action="<c:url value='/library/serviceCenter/faq/faqList.do'/>" >
		   		
		        <div class="search_box">
  				<label > FAQ검색</label>
		        <input type="text" name="searchKeyword" 
		        	title="검색어 입력" value="${param.searchKeyword}" class="searchCondition">   
				<input type="submit" value="검색" id="searchInfo2">
				</div><!-- //searchbox3 -->
		    </form>
		<div >
			<ul class="ulList">
				<c:set var="i" value="1"/>
				<c:if test="${empty faqList}">
					<li>
						<dl>
							<dt class="faqdt">
							게시글이 없습니다.
							</dt>
						</dl>
					</li>
				</c:if>
				<c:if test="${!empty faqList}">
					<c:forEach var="vo" items="${faqList}">
						
						<li id="FAQ_List_${i }" name="TrFAQ_Content" class="off">
							<dl class="faqDl">
								<dt class="faqdt">${vo.faqNo}</dt><dd class="faqdd">${vo.category }</dd><dd class="callContent"><a href='javascript:void(0);' onclick='viewContent(${i });'><span>${vo.title }</span></a></dd></dl>
							
							<div id="DivFAQ_Content_${i }" class="divContent" style="display:none;">
								${vo.content }
							</div>
						</li>
						<c:set var="i" value="${i+1 }"/>
					</c:forEach>
				</c:if>
			</ul>
		</div><!-- //list -->
	</div>	
	
	<div class="bticons">
		<form id="myWrite" method="post" action="<c:url value='/library/qna/qnaList.do'/>">
			<input type="button" id="listGo" value="전체목록" class="qnabt"/>
			<!-- <input type="button" id="writeGo" value="글쓰기" class="qnabt"/> -->
		</form>			
	</div>
	   
	<!-- 페이징 처리를 위한 div -->
	<div class="qnadivPage">
		<!-- 이전 블럭으로 이동 -->
		<c:if test="${pagingInfo.firstPage>1}">				
			<a href="#" 
		onclick="pageFunc(${pagingInfo.firstPage-1})">
				<img src="<c:url value='/images/first.JPG'/>" 
						alt="이전블럭으로">
			</a>				
		</c:if>
		
		<!-- 페이지 번호 추가 -->						
		<!-- [1][2][3][4][5][6][7][8][9][10] -->
		<c:forEach var="i" 
			begin="${pagingInfo.firstPage }" 
			end="${pagingInfo.lastPage }">
			<c:if test="${i==pagingInfo.currentPage }">					
				<span style="color:blue;font-weight: bold">
					${i}</span>
			</c:if>		
			<c:if test="${i!=pagingInfo.currentPage }">
				<a href="#" onclick="pageFunc(${i})">
					[${i}]</a>
			</c:if>		
		</c:forEach>				
		<!--  페이지 번호 끝 -->
		
		<!-- 다음 블럭으로 이동 -->
		<c:if test
		="${pagingInfo.lastPage<pagingInfo.totalPage}">				
			<a href="#" 
		onclick="pageFunc(${pagingInfo.lastPage+1})">
				<img src="<c:url value='/images/last.JPG'/>" 
						alt="다음블럭으로">
			</a>
		</c:if>
	</div>
</div>
<%@include file="../../libraryBottom.jsp" %>