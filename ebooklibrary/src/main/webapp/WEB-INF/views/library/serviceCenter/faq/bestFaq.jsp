<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" type="text/css"	href="${pageContext.request.contextPath }/css/library/faq.css" />
<script type="text/javascript" src="<c:url value='/jquery/jquery-3.1.0.min.js'/>"></script>
<script type="text/javascript">
	$().ready(function(){
		
		$("#writeGo").click(function(){
			$(location).attr('href',"<c:url value='/library/serviceCenter/faq/faqWrite.do'/>");
		});
		
				
		$("#moreFaq").click(function(){
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
<div id="faq_head">
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
		    
		<div>
			<ul class="ulList">
				<c:set var="i" value="1"/>
				<c:if test="${empty bestFAQ}">
					<li>
						<dl>
							<dt class="faqdt">
							게시글이 없습니다.
							</dt>
						</dl>
					</li>
				</c:if>
				<c:if test="${!empty bestFAQ}">
					<c:forEach var="vo" items="${bestFAQ}">
						
						<li id="FAQ_List_${i }" name="TrFAQ_Content" class="off">
							<dl class="faqDl">
								<dt class="faqdt">${vo.faqNo}</dt><dd class="faqdd">${vo.category } <span><a  href='javascript:void(0);' onclick='viewContent(${i });'>${vo.title }</a></dd></span>
							</dl>
							<div id="DivFAQ_Content_${i }" class="divContent" style="display:none;">
								${vo.content }
							</div>
						</li>
						<c:set var="i" value="${i+1 }"/>
					</c:forEach>
				</c:if>
			</ul>
		</div><!-- //list -->
		<div class= "faq_button">
			<input type="button" id="moreFaq" value="더보기" style="clear: both; float: right; margin-top: 20px; margin-right: 75px;"/>
		</div>
	</div>	
</div>
