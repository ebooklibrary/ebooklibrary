<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>여기가 내 서재</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/clear.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/mybook/mybookmain.css" />

<script type="text/javascript" src="<c:url value='/jquery/jquery-3.1.0.min.js'/>"></script>
<!-- alert -->
<!-- ideally at the bottom of the page -->
<!-- also works in the <head> -->
<%-- <c:url value='/alertify.js-0.3.11/themes/alertify.core.css'/> --%>
<script src="<c:url value='/alertify.js-0.3.11/lib/alertify.min.js'/>"></script>
<!-- include the core styles -->
<link rel="stylesheet" href="<c:url value='/alertify.js-0.3.11/themes/alertify.core.css'/>" />
<%-- <link rel="stylesheet" href="<c:url value='/alertify.js-0.3.11/themes/alertify.bootstrap.css'/>" /> --%>
<!-- include a theme, can be included into the core instead of 2 separate files -->
<link rel="stylesheet" href="<c:url value='/alertify.js-0.3.11/themes/alertify.default.css'/>" />

<script type="text/javascript">
	$(document).ready(function() {
		
		/* alert 커스텀 */
		alertify.set({ labels: {
			    ok     : "예",
			    cancel : "아니오"
			} }); 

		/* 버튼 리버스 (좌우 위치이동) */
		alertify.set({ buttonReverse: true });
		
		$(".purchasedBookDiv").click(function() {
			var bookNo=$(this).find(".mybook1").val();
			window.open("<c:url value='/mybooks/mybook.do?bookNo="+bookNo+"'/>", "책보기", "top=50, left=50, width=1550, height=900, resizable=0, location=0");
		});
		
		$(".exBookDiv").click(function() {
			var bookNo=$(this).find(".mybook1").val();
			var bookEnd=$(this).find(".mybookRentEnd").val();
			
			alertify.confirm("대여기간이 만료되었습니다. 연장하시겠습니까?", function (e) {
				if (e) {
					$(location).attr('href', "<c:url value='/shop/cart/extendBook.do?bookNo="+bookNo+"&userId=${sessionScope.userId}'/>");
			    } else {
			    	return false;
			    }
			});
		});
		
		$(".recentMyBook, .rentBookDiv, .mybook").click(function() {
			var bookNo=$(this).find(".mybook1").val();
			var bookEnd=$(this).find(".mybookRentEnd").val();

			var today = new Date();
			var bookEnd = new Date(bookEnd);
			
			var bookEnd=$.getDate(bookEnd);
			var str=bookEnd.split("-"); //2016-09-13
			var endDate=new Date(str[0],str[1]-1,str[2]);
			
			var today=$.getDate(today);
			var str1=today.split("-"); //2016-09-13
			var thisDay=new Date(str1[0],str1[1]-1,str1[2]);
			var period=(endDate-thisDay)/(60*60*24*1000);
			
			if (period<1) {
				alertify.confirm("대여기간이 만료되었습니다. 연장하시겠습니까?", function (e) {
					if (e) {
						$(location).attr('href', "<c:url value='/shop/cart/extendBook.do?bookNo="+bookNo+"&userId=${sessionScope.userId}'/>");
				    } else {
				    	var theDay=3+period;
				    	alertify.alert("이 책은 "+theDay+" 일 후 이 목록에서 제외 됩니다. (만료일 기준 3일 경과 후 목록에서 제외)");
				    	return false;
				    }
				});
				
				return false;
			}else{
				if (period==1) {
					alertify.alert("대여기간이 하루 남았습니다.", function (e) {
					    if (e) {
							window.open("<c:url value='/mybooks/mybook.do?bookNo="+bookNo+"'/>", "책보기", "top=50, left=50, width=1550, height=900, resizable=0, location=0");
					    }
					});
					
				}else{
					window.open("<c:url value='/mybooks/mybook.do?bookNo="+bookNo+"'/>", "책보기", "top=50, left=50, width=1550, height=900, resizable=0, location=0");
				}
				
			}
			
		});
		$.getDate=function(date){
			var str=date.getFullYear()+"-"+$.findDate(date.getMonth()+1)+"-"+$.findDate(date.getDate());
			return str;
		}
		$.findDate=function(d){
			var res=d;
			if (d<10) {
				res="0"+d;
			}
			return res;
		}
		
		/* 
		$(".mybook").hover(function() {
				$(this).css("cursor","pointer");
			}, function() {
				$(this).css("cursor","");
		});
		 */
		 
		 /* 
		 var Ca = /\+/g;
			decodeURIComponent( bimg.replace(Ca, " ") );
			//var bimg=encodeURIComponent(bimg);
		*/
		  
		/* 한글 깨짐 현상 해결을 위한 디코딩, 공백 존재시 생기는 '+' 제거 */
		var bgImage="${bgImage}";
		var Ca = /\+/g;
		var bgImage=decodeURIComponent(bgImage);
		var bgImage=bgImage.replace(Ca, "");
		//alert(bgImage);
		
		/* 배경화면 설정 */
		$("html").css({"background":"url(${pageContext.request.contextPath }/backimg/"+bgImage+")  no-repeat center center fixed",
							"-webkit-background-size": "cover",
							"-moz-background-size": "cover",
							"-o-background-size": "cover",
							"background-size": "cover"
		});
		
		/* 책 검색 */
		$("#menuDiv input[type=text]").focus(function() {
			$("#menuDiv #searchInfo").hide();
			$("#moreBook").show();
		});
		$("#menuDiv input[type=text]").blur(function() {
			$("#menuDiv #searchInfo")
			  .delay(800)
			  .queue(function (next) { 
			    $(this).show();
			    $("#moreBook").hide();
			    next(); 
			});
		});
		$("#moreBook").click(function() {
			var title=$("#search").val();
			window.open("<c:url value='/admin/book/bookList.do?title="+title+"'/>", "책보기", "top=50, left=50, width=1550, height=900, resizable=0, location=0");
			$("#search").val("");
		});
		$("#searchAllBook").submit(function() {
			var title=$("#search").val();
			window.open("<c:url value='/admin/book/bookList.do?title="+title+"'/>", "책보기", "top=50, left=50, width=1550, height=900, resizable=0, location=0");
			$("#search").val("");
			event.preventDefault();
		});
		
		
		/* 배경화면 메뉴 */
		$("#changeBackground").click(function() {
			$("#upFileBox").toggle();
		});
		
		/* 책목록 */
		$("#purchasedBook").click(function() {
			//$(".modal").css("display","block");
			$("#purchasedBookList").css("display","block");
			$("#rentBookList").css("display","none");
			$("#rentBook").find("input").attr("id",""); //myInput
			$("#rentBook").find("table").attr("id",""); //myTable
		});
		$("#rentBook").click(function() {
			//$(".modal").css("display","block");
			$("#rentBookList").css("display","block");
			$("#purchasedBookList").css("display","none");
			$("#purchasedBookList").find("input").attr("id",""); //myInput
			$("#purchasedBookList").find("table").attr("id",""); //myTable
		});
		
		$(".close").click(function() {
			$(".modal").css("display","none");
			$(".modal-content").find("input").attr("id","myInput"); //myInput
			$(".modal-content").find("table").attr("id","myTable"); //myTable
			$(".modal input[type=text]").val("");
		});
		
		/* 만료된 책 */
		$("#ExpiredBook").click(function() {
			$("#exBookDiv").show();
		});
		$(".exClose").click(function() {
			$("#exBookDiv").css("display","none");
		});
		
		/* 배경 바꾸는 ajax */
		$("#bookfrm").submit(function() {
			var formData = new FormData($('#bookfrm')[0]);
			$.ajax({
				url:"<c:url value='/mybooks/changeBackImg.do'/>",
					type:"POST",
					processData: false,
					contentType: false,
					/* contentType: "application/x-www-form-urlencoded; charset=UTF-8", */
					data: formData,
					success:function(bimg){
						
						var Ca = /\+/g;
						/* var bimg=encodeURIComponent(bimg); */
						var bimg=decodeURIComponent(bimg);
						var bimg=bimg.replace(Ca, "");
						
						/* alert("${pageContext.request.contextPath }/backimg/"+bimg); */
						
						$("html").css({"background":"url(${pageContext.request.contextPath }/backimg/"+bimg+")  no-repeat center center fixed",
							"-webkit-background-size": "cover",
							"-moz-background-size": "cover",
							"-o-background-size": "cover",
							"background-size": "cover"
						});
						/* location.reload(); */
					},
					error: function(xhr,status, error){
						alert("에러발생"+status+":"+error);
					}
			});
			
			event.preventDefault();
		});
		
		var memoCount=0;
		if(${!empty sessionScope.userId}){
			$.ajax({
				url:"<c:url value='/library/memo/NewMemoCount.do'/>",
				data:"userId=${sessionScope.userId}",			
				type:"GET",
				success:function(res){
					$("#memoCount").text(res);
					memoCount=res;
				}
			});//ajax
		}//if
		setInterval(function() {
			if(${!empty sessionScope.userId}){
				$.ajax({
					url:"<c:url value='/library/memo/NewMemoCount.do'/>",
					data:"userId=${sessionScope.userId}",
					type:"GET",
					success:function(res){
						$("#memoCount").text(res);
						memoCount=res;
					}
				});//ajax
			}//if
		},3000);
		
		$("#memoList").click(function() {
			window.open("<c:url value='/library/memo/memo.do'/>",
					"memoList",
			"width=725,height=800,left=50,top=50,resizable=yes,location=yes");		
		});
		
		
		    
		
	}); //ready
	
	/* 책목록 */
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
	 
	/* 대여 만료된 책 목록 */
	function myFunctionSec() {
		  var input, filter, table, tr, td, i;
		  input = document.getElementById("exInput");
		  filter = input.value.toUpperCase();
		  table = document.getElementById("exTable");
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

		<%-- 
			<c:forEach var="map" items="${cartList }">
				<c:set var="sum" value='${map["SELLPRICE"]*map["QUANTITY"] }'/>
			</c:forEach>
	 	--%>


	<div id="wrapper">
	
		<div id="tempMenu" class="ui-widget-content">
			<ul class="topnav" id="myTopnav">
				<c:if test="${!empty sessionScope.userId }">
				<li><a href="<c:url value='/member/myPage.do'/>">${sessionScope.userId }님</a></li>
				<li><a href="<c:url value='/member/logout.do'/>">LogOut</a></li>
				<li><a href="#" id="memoList">쪽지(<span id="memoCount"></span>)</a></li>
				</c:if>
				<%-- <li><a href="<c:url value='/index.do'/>">첫페이지</a></li> --%>
				<li><a href="<c:url value='/library/librarymain.do'/>">도서관</a></li>
			</ul>
		</div>
	
		<!-- 최근 책 책장 -->
		<div id="recentBook">
			<c:forEach var="map" items="${alist }">
				<c:if test="${map['RENTDATE'] >-3 || empty map['RENTDATE'] }">
				<div class="recentMyBook">
					<input class="mybook1" type="hidden" value="${map['BOOK_NO'] }">
					<input class="mybookRentEnd" type="hidden" value="${map['RENT_END'] }">
					<input class="RENTDATE" type="hidden" value="${map['RENTDATE'] }">
					<img title="${map['TITLE'] }" alt="최근책 책장" src="${pageContext.request.contextPath }/book_upload/${map['COVER_FILE_NAME'] }">
				</div>
				</c:if>
			</c:forEach>
		</div>
		
		<div id="menuDiv">
		
			<div id="etc">
				<!-- 배경화면 바꾸기 -->
				<div id="changeBackground">
						<img id="changeback" alt="배경화면 바꾸기" src="<c:url value='/images/mybook/icon/background.png'/>">
						여기를 눌러 배경화면을 바꿔 보세요!!
				</div>
				<div id="upFileBox">
					<form id="bookfrm" name="bookfrm" enctype="multipart/form-data" method="post">
						원하시는 배경이미지를 올려보세요!<br><br>
						<input type="file" id="bgImage" name="bgImage">
<!-- 						<input type="hidden" id="defalutImage" name="defalutImage" value="defalutImage.jpg"> -->
						<input type="submit" id="btImg" name="btImg" value="확인">
					</form>
						<!-- <span id="defalutImage">기본 배경화면</span> -->
				</div>
			</div>
			
			<!-- 책 전체 검색 -->
			<div id="moreBookDiv">
				<form name="searchAllBook" id="searchAllBook" method="post">
				<input type="text" id="search" name="searchKeyword" placeholder="Search..">
				<span id="searchInfo">더 보고 싶은 책이 있으시다면 여기에서!</span>
				<span id="moreBook">상점으로 고고</span>
				</form>
			</div>
		</div>
		
		<!-- 보관 책장 -->
		<div id="BookList">
			<p>${sessionScope.userId } 님의 책장</p>
			<a id="rentBook" href="#">대여책 목록</a>
			<a id="purchasedBook" href="#">구매책 목록</a>
			<a id="ExpiredBook" href="#">만료된 책 목록</a>
					<!-- <a href="#"><FONT style="WRITING-MODE: tb-rl; HEIGHT: 50pt">12345</FONT></a> -->
			<div id="myBooks">
			<!-- SELECT M.BOOK_NO, M.RENT_START, M.RENT_END, B.BOOK_FILE_NAME, B.COVER_FILE_NAME, B.TITLE, B.PUBLISHER, B.WRITER, B.PUBLICATION, B.GENRE, B.SUMMARY -->
			<c:forEach var="map" items="${alist }">
				<c:if test="${map['RENTDATE'] >-3 || empty map['RENTDATE'] }">
				<div class="mybook">
					<span>${map["TITLE"] }</span>
					<input class="mybook1" type="hidden" value="${map['BOOK_NO'] }">
					<input class="mybookRentEnd" type="hidden" value="${map['RENT_END'] }">
					<c:if test="${empty map['RENT_END'] }">
						<div class="mybookColor"></div>
					</c:if>
					<c:if test="${!empty map['RENT_END'] }">
						<div class="mybookColor1"></div>
					</c:if>
				</div>
				</c:if>
			</c:forEach>
			</div> <!-- mybooks -->
		</div> <!-- BookList -->
	</div> <!-- wrapper -->
	
	<!-- 구매책목록 미니창 띄우기 -->
	<!-- myModal -->
	<div id="purchasedBookList" class="modal">
	  <div class="modal-content">
	    <p>나의 구매책 목록</p>
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
			<c:forEach var="map" items="${alist }">
				<c:if test="${empty map['RENT_END'] }">
					<tr>
						<td><div class="purchasedBookDiv">${map["TITLE"] }<input class="mybook1" type="hidden" value="${map['BOOK_NO'] }"></div></td>
						<td><div class="purchasedBookDiv">${map["PUBLISHER"] }<input class="mybook1" type="hidden" value="${map['BOOK_NO'] }"></div></td>
						<td><div class="purchasedBookDiv"><fmt:formatDate value="${map['RENT_END'] }" pattern="yyyy-MM-dd"/><input class="mybook1" type="hidden" value="${map['BOOK_NO'] }"></div></td></td>
						
					</tr>
				</c:if>
			</c:forEach>
		  </tbody>
		</table>
	  </div>
	</div>
			
	<!-- 대여책목록 미니창 띄우기 -->
	<!-- myModal -->
	<div id="rentBookList" class="modal">
	  <div class="modal-content">
	    <p>나의 대여책 목록</p>
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
			<c:forEach var="map" items="${alist }">
				<c:if test="${!empty map['RENT_END'] && map['RENTDATE'] > -3 }">
					<tr>
						<td><div class="rentBookDiv">${map["TITLE"] }<input class="mybook1" type="hidden" value="${map['BOOK_NO'] }"><input class="mybookRentEnd" type="hidden" value="${map['RENT_END'] }"></div></td>
						<td><div class="rentBookDiv">${map["PUBLISHER"] }<input class="mybook1" type="hidden" value="${map['BOOK_NO'] }"><input class="mybookRentEnd" type="hidden" value="${map['RENT_END'] }"></div></td>
						<td><div class="rentBookDiv"><fmt:formatDate value="${map['RENT_END'] }" pattern="yyyy-MM-dd"/><input class="mybook1" type="hidden" value="${map['BOOK_NO'] }"></div></td>
					</tr>
				</c:if>
			</c:forEach>
		  </tbody>
		</table>
	  </div>
	</div>
	
	
	<!-- 만료된 목록 미니창 띄우기 -->
	<div id="exBookDiv" class="modal1">
	<div class="modal-content1">
	    <p>만료된 책 목록</p>
	    <br>
	    <span class="exClose">닫기</span>
	    <!-- 미니창 안의 책목록및검색 -->
		<input type="text" id="exInput" onkeyup="myFunctionSec()" placeholder="Search for names.." title="Type in a name">
		<table id="exTable">
		  <tr class="header">
		    <th style="width:40%;">책제목</th>
		    <th style="width:40%;">출판사</th>
		    <th style="width:20%;">유효날짜</th>
		  </tr>
		<tbody>
			<c:forEach var="map" items="${alist }">
				<c:if test="${empty map['RENT_END'] && map['RENTDATE'] <= -3 }">
					<tr>
						<td><div class="exBookDiv">${map["TITLE"] }<input class="mybook1" type="hidden" value="${map['BOOK_NO'] }"><input class="mybookRentEnd" type="hidden" value="${map['RENT_END'] }"></div></td>
						<td><div class="exBookDiv">${map["PUBLISHER"] }<input class="mybook1" type="hidden" value="${map['BOOK_NO'] }"><input class="mybookRentEnd" type="hidden" value="${map['RENT_END'] }"></div></td>
						<td><div class="exBookDiv"><fmt:formatDate value="${map['RENT_END'] }" pattern="yyyy-MM-dd"/><input class="mybook1" type="hidden" value="${map['BOOK_NO'] }"></div></td>
					</tr>
				</c:if>
			</c:forEach>
		  </tbody>
		</table>
  </div>
  </div>
	
	

</body>
</html>