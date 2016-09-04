<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>여기가 내 서재</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/clear.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/mybook/mybookmain.css" />
<script type="text/javascript" src="<c:url value='/jquery/jquery-3.1.0.min.js'/>"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$(".mybook").click(function() {
			alert($(this).find(".mybook1").val());
		});
		/* 
		$(".mybook").hover(function() {
				$(this).css("cursor","pointer");
			}, function() {
				$(this).css("cursor","");
		});
		 */
		$("html").css({"background":"url(<%=request.getContextPath() %>/images/mybook/back22.jpg)  no-repeat center center fixed",
							"-webkit-background-size": "cover",
							"-moz-background-size": "cover",
							"-o-background-size": "cover",
							"background-size": "cover"
		});
		
		$("#menuDiv input[type=text]").focus(function() {
			$("#menuDiv span").hide();
		});
		$("#menuDiv input[type=text]").blur(function() {
			$("#menuDiv span")
			  .delay(800)
			  .queue(function (next) { 
			    $(this).show(); 
			    next(); 
			});
		});
		
		$("#changeBackground").click(function() {
			$("#upFileBox").toggle();
		});
		
		
		$("#myBtn").click(function() {
			$(".modal").css("display","block");
		});
		$("#rentBook").click(function() {
			$(".modal").css("display","block");
		});
		$("#boughtBook").click(function() {
			$(".modal").css("display","block");
		});
		
		$(".close").click(function() {
			$(".modal").css("display","none");
		});
		
		
/* 
		$('div:not("#div이름")').click(function(){                     
			var color = $(this).css('color');
			if (color !== 'rgb(255, 0, 0)'){
			     $(this).css({color:'blue'});
			}
		});
*/
		
		$("#booktestatag").click(function() {
			window.open("<c:url value='/mybooks/mybook.do'/>", "책보기", "top=50, left=50, width=1550, height=900, resizable=0, location=0")
		});
		
		
		
		
	}); //ready
	
	/* 
	// Get the modal
	var modal = document.getElementById('myModal');

	// Get the button that opens the modal
	var btn = document.getElementById("myBtn");

	// Get the <span> element that closes the modal
	var span = document.getElementsByClassName("close")[0];

	// When the user clicks the button, open the modal
	btn.onclick = function() {
	    modal.style.display = "block";
	}

	// When the user clicks on <span> (x), close the modal
	span.onclick = function() {
	    modal.style.display = "none";
	}

	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
	    if (event.target == modal) {
	        modal.style.display = "none";
	    }
	}
	 */
	function myFunction() {
		  var input, filter, table, tr, td, i;
		  input = document.getElementById("myInput");
		  filter = input.value.toUpperCase();
		  table = document.getElementById("myTable");
		  tr = table.getElementsByTagName("tr");
		  for (i = 0; i < tr.length; i++) {
		    td = tr[i].getElementsByTagName("td")[0];
		    if (td) {
		      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
		        tr[i].style.display = "";
		      } else {
		        tr[i].style.display = "none";
		      }
		    }
		  }
		}
	
	
</script>
</head>
<body>

	<div id="wrapper">
	
		<div>
			<a href="<c:url value='/mybooks/mybook.do'/>" id="booktestatag">내 책 테스트</a>
		</div>
	
		<!-- 최근 책 책장 -->
		<div id="recentBook">
		
			<div class="imgtest">
				<img alt="최근책 책장" src="${pageContext.request.contextPath }/images/mybook/testimg.jpg">
			</div>
			
			
			<div class="imgtest">
				<img title="QQ규" alt="최근책 책장" src="${pageContext.request.contextPath }/images/mybook/testimg.jpg">
			</div>
			
			<div class="imgtest">
				<img title="QQ규" alt="최근책 책장" src="${pageContext.request.contextPath }/images/mybook/testimg.jpg">
			</div>
			
		
		</div>
		
		<div id="menuDiv">
		
			<div id="etc">
				<!-- 배경화면 바꾸기 -->
				<div id="changeBackground">
						<img id="changeback" alt="배경화면 바꾸기" src="<c:url value='/images/mybook/icon/background.png'/>">
						여기를 눌러 배경화면을 바꿔 보세요!!
				</div>
				<div id="upFileBox">
					<form action="<c:url value='/mybooks/changeBackImg.do'/>" id="bookfrm" name="bookfrm">
						원하시는 배경이미지를 올려보세요!<br>
						<input type="file" id="backImgUp" name="backImgUp">
					</form>
				</div>
			
			
			
				
				
			</div>
			
			
			
			<input type="text" name="search" placeholder="Search..">
			<span>찾고 싶은 책이 있으시다면 여기에서!</span>
		</div>
		
		<!-- 보관 책장 -->
		<div id="BookList">
			<p>누구누구 님의 책장</p>
			
			<a id="rentBook" href="#">대여책 목록</a>
			<a id="boughtBook" href="#">구매책 목록</a>
			
					<!-- <a href="#"><FONT style="WRITING-MODE: tb-rl; HEIGHT: 50pt">12345</FONT></a> -->
			<div id="myBooks">
			
			
				<div class="mybook" id="b01">
					<span>Game<br><br>Of<br><br>Thrones</span>
					<input class="mybook1" type="hidden" value="fileUrl">
					<div id="mybookColor"></div>
				</div>
				
				<div class="mybook" id="b02">
					<span>국화꽃<br><br>향기</span>
					<input class="mybook1" type="hidden" value="fileUrl1">
					<div id="mybookColor1"></div>
				</div>
				
				<div class="mybook" id="b01">
					<span>Game<br><br>Of<br><br>Thrones</span>
					<input class="mybook1" type="hidden" value="fileUrl">
					<div id="mybookColor"></div>
				</div>
				
				<div class="mybook" id="b02">
					<span>국화꽃<br><br>향기</span>
					<input class="mybook1" type="hidden" value="fileUrl1">
					<div id="mybookColor1"></div>
				</div>
				
				
			 <!-- 
				<a class="testa" href="#" id="b01">
					Game<br><br>Of<br><br>Thrones
					<input type="hidden" value="fileUrl">
					<span id="mybookColor1"></span>
				</a>
				
				<a class="testa" href="#" id="b02">
					국화꽃<br><br>향기
					<input type="hidden" value="fileUrl1">
					<span id="mybookColor"></span>
				</a>
			 -->
			</div> <!-- mybooks -->
			
		</div> <!-- BookList -->
		
	</div> <!-- wrapper -->
	
	
	<!-- 
	<button id="myBtn">Open Modal</button>
	 -->
	<!-- 책목록 미니창 띄우기 -->
	<div id="myModal" class="modal">
	  <div class="modal-content">
	    <p>나의 구매(대여)책 목록</p>
	    <br>
	    <span class="close">닫기</span>
	    
	    <!-- 미니창 안의 책목록및검색 -->
		<input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for names.." title="Type in a name">
		<table id="myTable">
		  <tr class="header">
		    <th style="width:40%;">책제목</th>
		    <th style="width:40%;">출판사</th>
		    <th style="width:20%;">유효날짜</th>
		  </tr>
		  
		  <tbody>
			  <tr>
			    <td>음악은 그런거니깐</td>
			    <td>Germany</td>
			    <td>오늘내일</td>
			  </tr>
			  <tr>
			    <td>Berglunds snabbkop</td>
			    <td>Sweden</td>
			    <td>오늘내일</td>
			  </tr>
			  <tr>
			    <td>Island Trading</td>
			    <td>UK</td>
			    <td>오늘내일</td>
			  </tr>
			  <tr>
			    <td>Koniglich Essen</td>
			    <td>Germany</td>
			    <td>오늘내일</td>
			  </tr>
			  <tr>
			    <td>Laughing Bacchus Winecellars</td>
			    <td>Canada</td>
			    <td>오늘내일</td>
			  </tr>
			  <tr>
			    <td>Magazzini Alimentari Riuniti</td>
			    <td>Italy</td>
			    <td>오늘내일</td>
			  </tr>
			  <tr>
			    <td>North/South</td>
			    <td>UK</td>
			    <td>오늘내일</td>
			  </tr>
			  <tr>
			    <td>Paris specialites</td>
			    <td>France</td>
			    <td>오늘내일</td>
			  </tr>
		  </tbody>
		  
		</table>

	  </div>
	</div>
			
	
	
	
	

</body>
</html>