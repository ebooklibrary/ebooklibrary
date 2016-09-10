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


$("#bt2").click(function() {
	
	//[{"no":10,"name":"박길동","content":"안녕"},{"no":11,"name":"정길동","content":"요!"},{"no":12,"name":"최길동","content":"hello"}]
	
	//spring 컨트롤러에서 jsonView 이용하는 경우
	$.ajax({
		url:"<c:url value='/memo/memoList2.do'/>", type:"GET", dataType:"json",
		success:function(res){
			alert("응답결과, 개수:"+res.length);
			
			if (res.length>0) {
				var result="";
				$.each(res, function(idx,item) {
					result+="번호 : "+item.no+"<br>"
					+"이름:"+this["name"]+"<br>"
					+"내용:"+this.content+"<br><br>";
				});
				
				$("#divResult").html(result);
			}
			 
			 
			 
		},
		error:function(xhr, status, error){
			alert(status+":"+error);
		}
		
		
		
	});
});


$("#frm1").submit(function(event) {
	
	//{"message":"입력 성공","data":{"no":20,"name":"fff","content":"aaaa"}}
	/* 
	var p_name=$("#name").val();
	var p_content=$("#content").val();
	var str={name:$("#name").val() , content:$("#content").val() };
	 */
	alert($(this).serializeArray());
	$.ajax({
		url:"<c:url value='/memo/memoWrite.do'/>",
		//[1] 파라미터를 객체로 보내는 경우
		//data:{name:$("#name").val() , content:$("#content").val() },
		
		//[2] 파라미터를 쿼리문자열(쿼리스트링)로 보내는 경우
		//data:"name"=p_name+"&content="+p_content,
		
		//[3] 객체를 쿼리문자열로 변환
		//data: $.param(str),
		
		//[4] 입력상자의 값을 쿼리문자열로 변환해서 보냄
		//data: $(this).serialize(),
		
		//[5] 입력상자의 값을 객체로 변환해서 보냄
		data: $(this).serializeArray(),
			
		type:"POST",
		dataType:"json",
		cache:false,
		success:function(res){
			var result=res.message+"<br>";
			result+="입력 결과<br>";
			result+="<p>번호 : "+res.data.no+"</p>";
			result+="<p>이름 : "+res.data.name+"</p>";
			result+="<p>내용 : "+res.data.content+"</p>";
			
			$("#result").html(result);
			
		},
		error:function(xhr, status, error){
			alert(status+":"+error);
		}
		
	});
	
	event.preventDefault();
});


$("#userid").keyup(function() {
	//1 , 해당 아이디가 존재하는 경우
	//2 , 해당 아이디가 존재하지 않는 경우
	if (vaildate_userid($("#userid").val()) && $("#userid").val().length>=2) {
		$.ajax({
			url:"<c:url value='/member/ajaxCheckUserid.do'/>",
			type:"GET",
			data: "userid="+$("#userid").val(),
			success:function(res){
				var result="";
				if (res==1) {
					result="이미 등록된 아이디";
					$("#chkId").val("N");
				}else if(res==2){
					result="사용 가능한 아이디";
					$("#chkId").val("Y");
				}
				$("#message").html(result);
				
			},
			error:function(xhr, status, error){
				alert(status+":"+error);
			}
		});
	}else{
		//유효성 검사를 통과하지 못한 경우
		$("#message").html("아이디 규칙에 맞지 않습니다.");
		$("#chkId").val("N");
	}
});



$(function() {
	
	
	
    //single book
    $('#mybook').booklet();

    
    $("#mybook").booklet( "option", "width", 1400 );
	$("#mybook").booklet( "option", "height", 800 );

	
	$("#mybook").css({"color":"black", "font-weight":"bold"});
	/* 
	$("#mybook").css({"border":"1px solid black"});
	 */
	$(".test1").css({"padding":"20px","line-height":"40px", "font-size":"1.2em"});

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
	$('#mybook').booklet("gotopage", 3);
	
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
	<div id="wrapper">
	<div id="mybook">
	    <div class="test1">
			<p>
			        
			나 피르 고르마(스코틀랜드 게일어: na fir ghorma, 영어: blue men 블루멘[*]→시퍼런 남자들)는 아우터헤브리디스와 스코틀랜드 본토 사이의
			해협에 출몰한다는 요괴이다. 배를 침몰시켜 선원들을 익사시키는 물귀신의 일종이다. <br>
			이들은 민치 해협과 그 주위 일대에만 전승되는 특이한 요괴들로, 스코틀랜드의 다른 지방에서는 전승되지 않는다.<br>
			이들은 인간과 비슷하게 생겼고 덩치도 비슷한데 피부색이 파란 색이라는 점만 다르다. 그들은 폭풍우를 불러일으킬 수 있으나 날씨가 좋을 때는 수면 위에 떠서 또는 
			수면 바로 아래에서 잠을 취한다. 블루맨은 수면 밖으로 몸통만 내놓고 쇠돌고래들이 그러는 것처럼 자맥질을 해서 움직인다.<br>
			 한 무리의 블루맨들이 해협을 지나가는 배를 발견하면 배를 향해 우르르 몰려들고, 두목 블루맨이 배의 선장에게 2절의 시(詩)를 소리친다. 선장은 블루맨들의 도전에 
			 응답해 시를 완성해 소리쳐 되돌려 줘야 하며, 만약 선장이 실패하면 블루맨들이 달려들어 배를 전복시키려고 한다.<br>
			블루맨에 대한 해석으로는 바다의 의인화라는 가설과, 몸에 파란 물감을 칠했던 픽트족을 가리키는 것이라는 설, 또는 바이킹이 스코틀랜드에 데리고 온 북아프리카 출신의
			 노예들(투아레그족은 파란 옷을 입고 다녔다)에서 비롯되었다는 설 등이 있다.
			 </p>
		</div>
	
		<div class="test1">
			<p> 
			자세히 읽기...
			HSutvald2-Grey.svg오늘의 좋은 글
			딥 임팩트 (우주선)
			딥 임팩트(영어: Deep Impact)는 케이프커내버럴 공군 기지에서 2005년 1월 12일 18시 47분(UTC)에 발사된 미국 항공우주국의 우주 탐사선이다. 
			딥 임팩트는 혜성 템펠 1(9P/템펠)의 내부 조성을 알기 위하여 충돌기를 혜성으로 떨어트렸다. 
			2005년 7월 4일 05:52 (UTC)에 충돌기는 성공적으로 혜성의 핵에 충돌했다. 충돌기는 충돌하면서 혜성의 핵에 충돌구를 만들고, 핵의 구성 물질을 밖으로 날려 보냈다. 
			</p>
		</div>
	    
	    <div class="test1">
	    	
	    	<h3>123451234 51234 512345123451 234512345123451 23451234 512345123451234 512345123 45123451234512 3451234512345</h3>
	    
	    </div>
	    
	    <div class="test1">
	        <h3>Yay, Page 3!</h3>
	    </div>
	    <div class="test1">
	        <h3>Yay, Page 4!</h3>
	    </div>
	    <div>
	        <h3>Yay, Page 3!</h3>
	    </div>
	    <div>
	        <h3>Yay, Page 3!</h3>
	    </div>
	    <div>
	        <h3>Yay, Page 3!</h3>
	    </div>
	    
	</div>
</div>

</body>
</html>