<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/booklet/jquery.booklet.latest.css" type="text/css" rel="stylesheet" media="screen, projection, tv" />

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/clear.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/mybook/readbook.css" />

<%-- 
${pageContext.request.contextPath}
 --%>
<script type="text/javascript" src="<c:url value='/js/common.js'/>"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>

<%--  
<script type="text/javascript" src="<%=request.getContextPath() %>/jquery/jquery-3.1.0.min.js"></script>
 --%>
<!-- 
<script>
		(function(i, s, o, g, r, a, m) {
			i['GoogleAnalyticsObject'] = r;
			i[r] = i[r] || function() {
				(i[r].q = i[r].q || []).push(arguments)
			}, i[r].l = 1 * new Date();
			a = s.createElement(o),
			m = s.getElementsByTagName(o)[0];
			a.async = 1;
			a.src = g;
			m.parentNode.insertBefore(a, m)
		})(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');

		var hostname = window.location.hostname;
		if (hostname.indexOf('localhost') === -1) {
			ga('create', 'UA-5500036-2', 'builtbywill.com');
		}
		</script>
 -->
<script type="text/javascript">
	$(function() {
		
		
	    //single book
	    $('#mybook').booklet();
	
	    
	    $("#mybook").booklet( "option", "width", 1400 );
		$("#mybook").booklet( "option", "height", 800 );
	
		
		$("#mybook").css({"color":"black", "font-weight":"bold"});
		/* 
		$("#mybook").css({"border":"1px solid black"});
		 */
		$(".test1").css({"padding":"20px","line-height":"35px", "font-size":"1.2em"});
	
		/* 
		$(".test1").css({ "border":"1px solid black" });
		 */ 
		
	/* 
		$('#mybook').booklet({menu: '#custom-menu',	pageSelector: true});
		 */
		
		
		//$("#mybook").booklet({ menu: "#customMenu" });
		//getter
		//var menu = $("#mybook").booklet( "option", "menu" );
		//setter
		//$("#mybook").booklet( "option", "menu", "#customMenu" );
		
		
		//$("#mybook").booklet({ pageSelector: true });
		
		//getter
		//var pageSelector = $("#mybook").booklet( "option", "pageSelector" );
		
		
		//지정 페이지로 이동
		$('#mybook').booklet("gotopage", 1);
		
		$("#pageSelBt").click(function() {
			var page=$("#pageSel").val();
			$('#mybook').booklet("gotopage", page-1);
			
		});
		
		$("#pageSel").keyup(function() {
			if (!validate_num($("#pageSel").val())) {
				alert("숫자만 입력해주세요");
				$("#pageSel").val("");
				$("#pageSel").focus();
			}
			var page=$("#pageSel").val();
			$('#mybook').booklet("gotopage", page-1);
			
		});
		
		
		
		/* 
		var pageSelector = $("#mybook").booklet("option", "currentIndex");
		 */
		 
		$("#mybook").click(function() {
			//현재 페이지 구하기
			var pageSelector = $("#mybook").booklet("option", "currentIndex");
			console.log(pageSelector);
		});
		
		
		
		//setter
		//$("#mybook").booklet( "option", "pageSelector", 3 );
		
		//var chapterSelector = $("#mybook").booklet( "option", "chapterSelector" );
		
		//$("#mybook").booklet( "option", "chapterSelector", 3 );
		
		//console.log(menu);
		//console.log(pageSelector);
		
		//console.log(chapterSelector);
	    
	/*     
	    //multiple books with ID's
	    $('#mybook1, #mybook2').booklet();
	
	    
	    
	    //multiple books with a class
	    $('.mycustombooks').booklet();
	     */
	   /*   
		var mybook = $('#mybook').booklet();
	
	    var newPageHtml = "<div>I'm a new page!</div>";
	    var display = $("#display");
	 */
	        
	/* 
	    $('#custom-goto').click(function(e){
	        e.preventDefault();
	    });
	     */
	});

</script>


<script> window.jQuery || document.write('<script src="${pageContext.request.contextPath}/booklet/jquery-2.1.0.min.js"><\/script>') </script>

<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>

<script src="${pageContext.request.contextPath}/booklet/jquery.easing.1.3.js"></script>
<script src="${pageContext.request.contextPath}/booklet/jquery.booklet.latest.min.js"></script>





<title>Insert title here</title>
</head>
<body>
	<div id="custom-goto"></div>
	<div id="display"></div>
	
	<!-- 
	<div id="custom-menu"></div>
	 -->
	 
	 
	 <p id="titleP"><span>${title }</span><span>페이지 이동 안될 시 책 모양 아이콘을 클릭하여 주십시오.</span></p>
	<div id="wrapper">
		<div id="pageSelDiv">
			 <span>페이지 입력 : </span><input type="text" name="pageSel" id="pageSel">
			 <!-- <input type="button" name="pageSelBt" id="pageSelBt" value="페이지 가기"> -->
			 <img alt="페이지선택" name="pageSelBt" id="pageSelBt" src="<c:url value='/images/mybook/icon/openbook32.png'/>">
		 </div>
		 
	<div id="mybook">
    	<c:forEach var="al" items="${alist }">
		    <div class="test1">
				<p>${al }</p>
		    </div>
    	</c:forEach>
	</div>
</div>

</body>
</html>