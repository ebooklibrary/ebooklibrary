<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="libraryTop.jsp" %>


<!--main_visual-->
<!-- <div id="main_visual_text">
<img src="/images/bandal/gmi/main/main_visual_text.jpg" alt="반달어린이도서관 - 반달어린이도서관에 오신 것을 환영합니다."  />
환영문구
</div> -->
<!--main_visual-->


<!--공지사항-->
  <div id="tab1" class="list">
  <h2 class="skip">알립니다</h2>
   <div class="tabmenu">
    <ul>    
     <!--알립니다-->
     <li>
     <a href="#">
     <!-- <img src="/images/gmi/main/tab1m01.gif" alt="공지사항" id="tab1m1" /> -->
     공지사항
     </a>
	<div id="tab1c1" class="tabcontent">
	<ul>
		<li>응 아니야</li>

	</ul>
	<div class="tabmore">
	<a href="/html/05_news/news01.asp">
	<!-- <img src="/images//gmi/main/more.gif" alt="공지사항 더보기" /> -->
	공지사항 더보기
	</a></div>        
	</div>
	</li>
  </div>
  <script type="text/javascript">tabOn(1,1);</script>
<!--알립니다-->


<!--도서검색-->
<form name="seek"  method="get" action="/A-LibM/search1.asp" target="_self" title="도서검색 폼입니다." onsubmit="return middle_search();">
<div id="m_search">
 <fieldset>
 <h2><img src="/images/gmi/main/search_title.gif" alt="도서검색"  /></h2>
 <legend>도서검색</legend>
 <label for="search_word" class="skip">검색어입력</label>
 <input type="text" class="inputText" name="a_q" id="search_word" title="검색어를 입력하세요."  />
 <input type="image" src="/images/gmi/main/search_btn.gif" alt="검색" class="search_btn" />
 </fieldset>
</div>
</form>
<!--도서검색-->

 
 
 
 
 
<!--main_con--> 
<div id="main_con">
 
 
 
 
 

  
<!--팝업존-->
  <!--Popupzone Start-->  




<div id="popupZone">
 <div id="picpr" >
  <div id="tit"><h2><img src="/images/gmi/main/popupzpne.gif" alt="팝업존" /></h2></div>
 
  <div id="prcon">
   <ul>
    <li><a href="/html/04_notice/notice01.asp?process_type=view&amp;b_idx=-10979" class="n1"   ><img src="/board_img/popupzone/20160816_popup4.jpg" alt="수원시 도서관 정기휴관일 고시"  width="248" height="153"/></a></li><li><a href="/html/04_notice/notice01.asp?process_type=view&amp;b_idx=-10965" class="n2"   ><img src="/board_img/popupzone/20160812_popup03.jpg" alt="2016 책읽는 가족 1차 선정명단 알림 및 2차 정성평가 안내"  width="248" height="153"/></a></li><li><a href="http://www.good-edu.net/event/form01/event_p150612_suwonlib_goodedu.asp" class="n3"  target="_blank" title="새창열림" ><img src="/board_img/popupzone/수원시청_민간(굿에듀)_우측배너_160511.jpg" alt="민간자격증"  width="248" height="153"/></a></li><li><a href="http://www.ekace.or.kr/event/form01/event_p150612_suwonlib_kace.asp" class="n4"  target="_blank" title="새창열림" ><img src="/board_img/popupzone/수원시청_국가(KACE)_우측배너_160511.jpg" alt="국가자격증"  width="248" height="153"/></a></li><li><a href="http://www.suwon.go.kr/web/board/BD_board.view.do?bbsCd=1042&amp;seq=20160412151136042" class="n5"  target="_blank" title="새창열림" ><img src="/board_img/popupzone/popup20160420.jpg" alt="&#53965;큰무료입장"  width="248" height="153"/></a></li><li><a href="http://2016.suwon.go.kr/" class="n6"  target="_blank" title="새창열림" ><img src="/board_img/popupzone/0202_popup.jpg" alt="2016 수원·화성 방문의해"  width="248" height="153"/></a></li>
   </ul>
  </div>     
     
  <div id="prnum">	  
   <img src="/images/gmi/main/01on.gif" alt="1번째 보기" class="n1" /><img src="/images/gmi/main/02on.gif" alt="2번째 보기" class="n2" /><img src="/images/gmi/main/03on.gif" alt="3번째 보기" class="n3" /><img src="/images/gmi/main/04on.gif" alt="4번째 보기" class="n4" /><img src="/images/gmi/main/05on.gif" alt="5번째 보기" class="n5" /><img src="/images/gmi/main/06on.gif" alt="6번째 보기" class="n6" />
  </div>         
     
  <div id="prcontrol">
   <a href="#play" onclick="playPicpr('PLAY','mfocus'); return false;" onfocus=""><img src="/images/gmi/main/p_play.gif" alt="이미지 순환재생" class="play" /></a><a href="#stop" onclick="stopPicpr('STOP','mfocus'); return false;" ><img src="/images/gmi/main/p_stop.gif" alt="이미지 순환멈춤" class="stop mar_l2" /></a>
  </div>
  
 </div>
    
    
    
 

     
    
 
 
 <script type="text/javascript"> 
<!--
/* 이미지홍보(팝업존) **/
//author : myshin
//date : 2007.09.04
//desc : IE6,7,FF, Op,Sa Test OK
function rotatePicpr(prcon_height,interval) {//이미지홍보 순환
	var prcon = document.getElementById("prcon");
	var prcon_a = prcon.getElementsByTagName("a");
	var prcon_inner = prcon.getElementsByTagName("ul")[0];
	if (prcon_inner.move) clearTimeout(prcon_inner.move);
	if (pr_onnum) prcon_inner.count = pr_onnum;
	if (!picprOver) {
		if (prcon_inner.count<prcon_a.length) { prcon_inner.count++; }
		else { prcon_inner.count = 1; }
		picprOnNum(prcon_inner.count);
	}
	pr_onnum = 0;
	var repeat = "rotatePicpr("+prcon_height+","+interval+")";
	prcon_inner.move = setTimeout(repeat,interval);
}
function picprOnNum(a) {//이미지홍보 n번째 보기 - 순환용으로 사용
	var onnum = a;
	var etype=null;
	movePicpr(onnum);
}
function picprOn(e) {//이미지홍보 n번째 보기 할당 - 홍보이미지 포커스, 버튼이미지 클릭시 사용
	stopPicpr();
	var e=e?e:window.event;
	var etype=e.type;
	var onnum = this.className.replace("n","");
	movePicpr(onnum,etype);
}
function movePicpr(onnum,etype) {//이미지홍보 위치이동
	var onnum = parseInt(onnum)-1;
	var prcon = document.getElementById("prcon");
	var prcon_inner =	prcon.getElementsByTagName("ul")[0];
	var prcon_img0 =	prcon_inner.getElementsByTagName("img")[0];
	var prcon_height = parseInt(prcon_img0.getAttribute("height"));
	var brName = navigator.appName.charAt(0);
	if (etype=="focus"&&brName=="M"&&onnum!=0) {//IE에서 focus일때
//		prcon_inner.style.top = 0;
	}else{
		prcon_inner.style.top = onnum*(-prcon_height) + "px";
	}
	var prnum = document.getElementById("prnum");
	var prnum_img = prnum.getElementsByTagName("img");
	for (var i=0;i<prnum_img.length;i++)	{ 
		var where = prnum_img[i].src.indexOf("on.gif",0)
		if (where!=-1) { prnum_img[i].src = prnum_img[i].src.replace("on.gif", ".gif"); }
	}
	prnum_img[onnum].src = prnum_img[onnum].src.replace(".gif", "on.gif");
	pr_onnum = parseInt(onnum)+1;
//	var test = document.getElementById("test");
//	test.innerHTML = prcon_inner.style.top +"  pr_onnum="+pr_onnum;
}
function playPicpr() {//이미지홍보 순환 시작
	picprOver = false;
	var prcontrol = document.getElementById("prcontrol");
	var prcontrol_img = prcontrol.getElementsByTagName("img");
	for (var i=0;i<prcontrol_img.length;i++) {
		var prcontrolCN = prcontrol_img[i].className;
		prcontrol_img[i].src = prcontrol_img[i].src.replace("on.gif",".gif");
		if (prcontrolCN=="play") prcontrol_img[i].src = prcontrol_img[i].src.replace(".gif","on.gif");
	}
}
function stopPicpr() {//이미지홍보 순환 멈춤
	picprOver = true;
	var prcontrol = document.getElementById("prcontrol");
	var prcontrol_img = prcontrol.getElementsByTagName("img");
	for (var i=0;i<prcontrol_img.length;i++) {
		var prcontrolCN = prcontrol_img[i].className;
		prcontrol_img[i].src = prcontrol_img[i].src.replace("on.gif",".gif");
		if (prcontrolCN=="stop") prcontrol_img[i].src = prcontrol_img[i].src.replace(".gif","on.gif");
	}
}




// 시작, 정지 세팅
    function gSetSlide(val,func_name) {
        // 세팅되어 있는 값과 동일한 값이라면 다시 세팅하지 않는다.
        if(val != document.getElementById("prcontrol").value) {
            document.getElementById("prcontrol").value = val;
            eval("_SlideShow_"+func_name+"();");
        } else {
            return ;
        }
    }

    // 시작, 정지 세팅
    function gSetSlide2(val,func_name) {
        // 세팅되어 있는 값과 동일한 값이라면 다시 세팅하지 않는다.
        if(val != document.getElementById("isSlideShow2").value) {
            document.getElementById("isSlideShow2").value = val;
            eval("_SlideShow_"+func_name+"();");
        } else {
            return ;
        }
    }
	
	
	
function initPicpr() {//이미지홍보 초기화
  var prnum = document.getElementById("prnum");
  var prnum_img = prnum.getElementsByTagName("img");
	for (var i=0;i<prnum_img.length;i++)	{
		prnum_img[i].onclick = picprOn;
	}
  var prcon = document.getElementById("prcon");
	var prcon_inner =	prcon.getElementsByTagName("ul")[0];
  var prcon_a = prcon.getElementsByTagName("a");
	for (var i=0;i<prcon_a.length;i++)	{ 
		prcon_a[i].onfocus = picprOn;
		prcon_a[i].onblur =  playPicpr;//포커스아웃시다시재생
	}
	var prcon_img =	prcon_inner.getElementsByTagName("img");
	var prcon_img0 =	prcon_img[0];
	var prcon_height = parseInt(prcon_img0.getAttribute("height"));
	prcon_inner.count = 0;
	pr_onnum = 0;
	playPicpr();
 
	rotatePicpr(135,4000);//간격1/1000초
  var picpr = document.getElementById("picpr");
  prcon.onmouseover = prnum.onmouseover = stopPicpr;
  prcon.onmouseout = prnum.onmouseout = playPicpr;//마우스아웃시다시재생
}
//addLoadEvent(initPicpr);//페이지전체로딩이느리면문제발생
initPicpr();
/* //이미지홍보  */
 
 
//-->
</script>
</div>
   <!--//#Popupzone End-->

<!--팝업존-->
  
  




 

 




  
<!--도서관 소통공간-->
<div id="sns">
<h2><img src="/images/gmi/main/twitter_title.gif" alt="도서관 소통공간" /></h2>
<!--iframe src="/cni/twitter.asp" width="254" height="128" scrolling="yes" frameborder="0" title="도서관 소통공간"></iframe-->

   <!--트위터 Start-->
	<div id="twitter"> <img src="/images/gmi/main/twitter_img.gif" alt="" border="0" usemap="#Map" />
  <map name="Map" id="Map">
    <area shape="rect" coords="14,8,101,26" href="https://twitter.com/suwonlibrary" target="_blank" alt="도서관정책과" title="새창열림" />
    <area shape="rect" coords="128,7,224,37" href="https://twitter.com/sklib2015" target="_blank" alt="선경/중앙/창룡/버드내" title="새창열림" />
    <area shape="rect" coords="14,29,116,48" href="https://twitter.com/seosuwonlib" target="_blank" alt="호매실/서수원/한림" title="새창열림" />
    <area shape="rect" coords="14,52,114,70" href="https://twitter.com/buk_lib" target="_blank" alt="북수원/대추골/일월" title="새창열림" />
    <area shape="rect" coords="128,41,224,71" href="https://twitter.com/suwonytlib" target="_blank" alt="광교홍재/영통/태장마루" title="새창열림" />
  </map>
</div>
   <!--트위터 End-->

</div>  
<!--도서관 소통공간-->

  
  

<!--모바일서비스-->
    <div id="reserve">
        <ul>
        	<li><a href="/html/01_search/?a_v=f"><img src="/images/gmi/main/c_banner01.gif" alt="책나루" /></a></li>
        	<li><a href="/member/lendings.asp"><img src="/images/gmi/main/c_banner02.gif" alt="대출내역조회" /></a></li>
        	<li class="last"><a href="http://sk.suwonlib.go.kr/webzine/index.htm" onclick="window.open(this.href, 'webzine', 'width=780, height=650'); return false" title="새창열림" target="_blank"><img src="/images/gmi/main/c_banner03.gif" alt="정보그루터기" /></a></li>
        </ul>
    
    </div>
<!--모바일서비스-->

  
  
  


</div>
<!--main_con--> 











  
  <!--#floating-->
  <!--#quick_menu-->
  
<div id="quick_menu">
 
 <div id="quick">
 <h2 class="skip">퀵메뉴</h2>
 <ul>
    <li><a href="http://www.ytsw.or.kr" title="새창열림" target="_blank"><img src="/images/bandal/gmi/main/m_banner01.gif" alt="영통종합사회복지관"  /></a></li>
    <li><a href="http://cafe.naver.com/bandalbook" title="새창열림" target="_blank"><img src="/images/bandal/gmi/main/m_banner02.gif" alt="반달과 책"  /></a></li>
   
	<li class="first"><a href="javascript:alert('회원로그인 후 이용하실 수 있습니다.');"><img src="/images/gmi/main/r_banner03.gif" alt="전자도서관"  /></a></li>
		
    <li><a href="/html/08_guide/guide02.asp"><img src="/images/gmi/main/r_banner01.gif" alt="모바일이용안내"  /></a></li>
	<!--li><a href="http://59.18.255.134:8000/" target="_blank" onclick="window.open(this.href, 'pop', 'width=1005, height=802, scrollbars=no'); return false" onkeypress="" title="새창으로 이동"><img src="/images/gmi/main/r_banner02.gif" alt="회원증발급"  /></a></li-->
 </ul>
 </div> 
 
 
 
 
 
 

 
 
</div>

 
 
 
  <!--//#quick_menu-->

   
   
 
  <!--//#floating-->
  

  
<%@ include file="libraryBottom.jsp" %>