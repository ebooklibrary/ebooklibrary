<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@include file="../libraryTop.jsp" %>
<script type="text/javascript">
	$().ready(function(){
		
		
		$("#writeGo").click(function(){
			$(location).attr('href',"<c:url value='/library/qna/qnaWrite.do'/>");
		});
		$("#listGo").click(function(){
			$(location).attr('href',"<c:url value='/library/qna/qnaList.do'/>");
		});
	});
	
	function pageFunc(curPage){
		document.frmPage.currentPage.value=curPage;
		frmPage.submit();
	}	

</script>
<form name="frmPage" method="post" 
	action="<c:url value='/library/qna/qnaList.do'/>">
	<input type="hidden" name="eventName" 	value="">
	<input type="hidden" name="currentPage">	
</form>
	<h1>QnA게시판입니다</h1>
	<div class=""></div>
	<table class="list"
	 	summary="질문게시판에 관한 표로써, 글번호, 제목, 작성자, 작성일, 조회수, 답변완료에 대한 정보를 제공합니다.">
	<caption>QnA</caption>
	<colgroup>
		<col style="width:10%;" />
		<col style="width:50%;" />
		<col style="width:15%;" />
		<col style="width:15%;" />
		<col style="width:10%;" />		
	</colgroup>
	<thead>
	  <tr>
	    <th scope="col">번호</th>
	    <th scope="col">제목</th>
	    <th scope="col">작성자</th>
	    <th scope="col">작성일</th>
	    <th scope="col">조회수</th>
	  </tr>
	</thead> 
	<tbody >
		<c:if test="${empty qnaList}">
			<tr>
				<td colspan="5">
				게시글이 없습니다.
				</td>
			</tr>
		</c:if>
		<c:if test="${!empty qnaList}">
			<c:forEach var="vo" items="${qnaList}">
			
				<tr>
					<td>${vo.qnaNo }</td>
					<td><a href="<c:url value='/library/qna/readCountAdd.do?qnaNo=${vo.qnaNo }'/>">${vo.title }</a></td>
					<td>${vo.userName }</td>
					<td style="text-align:center;"><fmt:formatDate value="${vo.regDate }" pattern="MM/dd 
						 HH:mm:ss"/> </td>
					<td>${vo.readCount }</td>
					
				</tr>
				
			</c:forEach>
		</c:if>
	</tbody>
	</table>	   
<div class="divPage">
	<input type="button" id="listGo" value="전체목록"/>
	<input type="button" id="writeGo" value="글쓰실?"/>
	<form id="frmMyWriting" method="post" action="<c:url value='/library/qna/qnaList.do' />" >
		<input type="button" id="myWriting" value="내글 보기"/>
		<input type="hidden" name="memberNo" value="${sessionScope.memberNo}"/>
	</form>
</div>
<!-- 페이징 처리를 위한 div -->
<div class="divPage">
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
<div class="divSearch">
   	<form name="frmSearch" method="post" 
   	action="<c:url value='/library/qna/qnaList.do' />" >
        <select name="searchCondition">
            <option value="title"
           	   <c:if test="${param.searchCondition=='title'}">
            		selected
               </c:if>
            >제목</option>
            <option value="content" 
            	<c:if test="${param.searchCondition=='content'}">
            		selected
               </c:if>
            >내용</option>
            <option value="userName" 
            	<c:if test="${param.searchCondition=='userName'}">
            		selected
               </c:if>
            >작성자</option>
        </select>   
        <input type="text" name="searchKeyword" 
        	title="검색어 입력" value="${param.searchKeyword}" >   
		<input type="submit" value="검색">
    </form>
</div>

<%@include file="../libraryBottom.jsp" %>
