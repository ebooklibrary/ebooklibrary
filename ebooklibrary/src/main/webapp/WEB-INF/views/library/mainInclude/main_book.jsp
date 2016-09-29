<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">
	$(document).ready(function() {
		
		//베스트셀러
		$.ajax({
				url:"<c:url value='/library/mainBook.do'/>",
				dataType:"json",
				success:function(res){
					/* alert("응답결과, 개수:"+res.length); */
					
					$.each(res, function(idx,item) {
						var title=item.title;
						if (item.title.length>7) {
							title=title.substring(0,7)+"..";
						}
						
						var result="";
						result="<div class='mainbooks'>";
						result+="<input class='mybook1' name='bookNo' type='hidden' value='"+item.bookNo+"'>";
						result+="<img title='"+item.title+"' alt='베스트셀러 책이미지' src='${pageContext.request.contextPath }/book_upload/"+item.coverFileName+"'>";
						result+="<p>"+title+"</p><p>"+item.writer+"</p>";
						result+="</div>";
						
						$("#mainBook").append(result);
						
						if (idx==4) {
							return false;
						}
						
					});
				},
				error:function(xhr, status, error){
					alertify.alert(status+":"+error);
				}
		});//ajax
		
		$(".mainbooks").click(function() {
			var bookNo=$(this).find("input[name=bookNo]").val();
			alert(bookNo);
			 $(location).attr('href', "<c:url value='/book/bookDetail.do?bookNo="+bookNo+"'/>");
		});
		
	});
</script>



<div id="mainBook"><p>베스트 셀러</p></div>
<!-- 
<div id="mainBook">
	<p>베스트 셀러</p>
		<div class="mainbooks">
			<input class='mybook1' type='hidden' value='1'>
			<img title="테스트북" alt="최근책 책장" src="1">
			<p>책제목</p>
			<p>작가명</p>
		</div>
</div>
 -->