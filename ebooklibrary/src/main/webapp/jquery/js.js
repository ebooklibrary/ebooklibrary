

/*전체메뉴보기*/
function MM_showHideLayers() { //v9.0
  var i,p,v,obj,args=MM_showHideLayers.arguments;
  for (i=0; i<(args.length-2); i+=3) 
  with (document) if (getElementById && ((obj=getElementById(args[i]))!=null)) { v=args[i+2];
    if (obj.style) { obj=obj.style; v=(v=='show')?'visible':(v=='hide')?'hidden':v; }
    obj.visibility=v; }
}





//글자크기 
//ex) onclick="setFontSize(+1);"	 onclick="setFontSize(-1);"
function setFontSize(a) {
	var defaultFontSize = 1;//em
	var minFontSize = 1;//em
	var maxFontSize = 1.6;//em
	obj = document.getElementById("body_contents");//확대축소영역
	var objFontSize = obj.style.fontSize;
	if (!objFontSize) { objFontSize = parseFloat(defaultFontSize)+"em"; }
	var checkFontSize = (Math.round(12*parseFloat(objFontSize))+(a*2))/12;
	if (checkFontSize >= maxFontSize) { checkFontSize = maxFontSize; obj.style.fontSize = checkFontSize+"em"; alert("더이상 늘릴 수 없습니다."); }
	else if (checkFontSize <= minFontSize) { checkFontSize = minFontSize; obj.style.fontSize = checkFontSize+"em"; alert("더이상 줄일 수 없습니다."); }
	else { obj.style.fontSize = checkFontSize+"em"; }
//	alert(checkFontSize);
}



/** 탭메뉴 공통적으로 사용
* author : myshin
* update : 2007.11.28
* desc : 이미지일때 소스 경로/이름 무관하게 수정. 앵커일때 스타일로 제어하게 수정.
* guide : tab1m01, tab1c01 등 탭메뉴, 컨텐츠 id값 맞춤.
ex) tabOn(1,1);
*/
function tabOn(tabid,a) {
	for (i=1;i<=10;i++) {
		if(i<10){inn="0"+i;} else {inn=""+i;}
		tabMenu = document.getElementById("tab"+tabid+"m"+i);
		tabContent = document.getElementById("tab"+tabid+"c"+i);
		if (tabMenu) { //객체가존재하면
			if (tabMenu.tagName=="IMG") { tabMenu.src = tabMenu.src.replace("on.gif", ".gif"); } //이미지일때
			if (tabMenu.tagName=="A") { tabMenu.className=""; } //앵커일때
		}
		if (tabContent) { tabContent.style.display="none"; }
	}
	if(a<10){ann="0"+a;} else {ann=""+a;}
	tabMenu = document.getElementById("tab"+tabid+"m"+a);
	tabContent = document.getElementById("tab"+tabid+"c"+a);
//	alert(tabMenu.tagName);
	if (tabMenu) { //객체가존재하면
		if (tabMenu.tagName=="IMG") { tabMenu.src = tabMenu.src.replace(".gif", "on.gif"); } //이미지일때
		if (tabMenu.tagName=="A") { tabMenu.className="on"; } //앵커일때
	}
	if (tabContent) { tabContent.style.display="block"; }
	tabMore = document.getElementById("tab"+tabid+"more");
}





// 보이기감추기
//ex) displayOff('idName','idName'); displayOn('idName','idName'); //인수 개수에 상관없다.
function displayOn() {
	var i,j,a=displayOn.arguments;
	for(i=0;i<a.length;i++) {
		obj = document.getElementById(a[i]);
		if (obj) { obj.style.display = "block"; }
	}
}
function displayOff() {
	var i,j,a=displayOff.arguments;
	for(i=0;i<a.length;i++) {
		obj = document.getElementById(a[i]);
		if (obj) { obj.style.display = "none"; }
	}
}



// 나만보이기
//ex) displayOnly('id이름중공통되는부분',전체수,현재순번); //현재순번의 객체만 보여준다
function displayOnly(coId,num,curr) {
	for (i=1;i<= num;i++) {
		var obj = document.getElementById(coId+i);
		if (obj) { obj.style.display = "none"; }
	}
	var obj = document.getElementById(coId+curr);
	if (obj) { obj.style.display = "block"; }
}
// class="Value" 정확히 일치시 보이기감추기
//ex) classDisplay('item restaurant','block');classDisplay('item lodging','none');
function classDisplay(tagClassVal,val) {
	var objs = getElementsByClassName(tagClassVal);
	for(var i=0; i<objs.length; i++) {
		objs[i].style.display = val;
	}
}
//모든 태그를 배열에 넣고 인수로 받아온 클래스이름과 일치하는 태그의 배열값을 배열로 리턴
function getElementsByClassName(clsName) { 
var arr = new Array(); 
	var elems = document.getElementsByTagName("*");
	for ( var i = 0; ( elem = elems[i] ); i++ ) {
		if ( elem.className == clsName ) {
			arr[arr.length] = elem;
		}
	}
	return arr;
}
// selector 일치시 보이기감추기
//ex) selectorDisplay('#business_register div.restaurant','block');selectorDisplay('#business_register div.lodging','none');
function selectorDisplay(selector,val) {
	var objs = document.getElementsBySelector(selector);
	for(var i=0; i<objs.length; i++) {
		objs[i].style.display = val;
	}
}


// 활성표시
//ex) activeOnly('id이름중공통되는부분',전체수,현재순번); //현재순번의 객체만 활성화한다.
function activeOnly(coId,num,curr) {
	for (i=1;i<= num;i++) {
		var obj = document.getElementById(coId+i);
		if (obj) { obj.style.fontWeight = "normal"; }
		if (obj) { obj.style.backgroundColor = "#fff"; }
		if (obj) { obj.style.letterSpacing = "-1px"; }
		if (obj) { obj.getElementsByTagName("a")[0].style.color = "#666"; }
	}
	var obj = document.getElementById(coId+curr);
	if (obj) { obj.style.fontWeight = "bold"; }
	if (obj) { obj.style.backgroundColor = "#fa4"; }
	if (obj) { obj.style.letterSpacing = "-2px"; }
	if (obj) { obj.getElementsByTagName("a")[0].style.color = "#fff"; }
}

//이벤트위치에보여주기
function eventOnOff(a) {
	eventX = event.x;
	eventY = event.y;
	obj = document.getElementById(a);
	obj.style.left = eventX;
	obj.style.top = eventY;
	obj.style.visibility = "visible";
}






//이미지 롤오버
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}



// 마우스오버아웃
function imgOver(imgEl) {
	imgEl.src = imgEl.src.replace(".gif", "_on.gif");
}
function imgOut(imgEl) {
	imgEl.src = imgEl.src.replace("_on.gif", ".gif");
}
function menuOver() {
	this.src = this.src.replace(".gif", "_on.gif");
}
function menuOut() {
	this.src = this.src.replace("_on.gif", ".gif");
}
    
//이미지롤오버함수할당
//ex) initImgRoll("containerId");
function initImgRoll(containerId) { 
	imgEl = document.getElementById(containerId).getElementsByTagName("img");
	for (i=0; i<imgEl.length; i++) {
		var menuImg = imgEl[i]
		var where = menuImg.src.indexOf("_on.gif",0)
		if (where==-1) {
				menuImg.onmouseover = menuOver;
				menuImg.onmouseout = menuOut;
		}
	}
}




function changeLm2pic(a) {
  obj = document.getElementById("lm2pic").getElementsByTagName("img")[0];
	var aa="";
  if(a<10) { aa="0"; }
	aa=aa+a;
	if(a==0) { obj.src="/img/2011_new/inc/lm2pic"+"01"+".gif"; }
  else { obj.src="/img/2011_new/inc/lm2pic"+aa+".gif"; }
}



//바로가기
function goUri(uri,target) { 
	if(uri!="") { window.open(uri,target); }
}



// png 이미지
function setPng24(obj) { 
  obj.width=obj.height=1; 
  obj.className=obj.className.replace(/\bpng24\b/i,''); 
  obj.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"+ obj.src +"',sizingMethod='image');" 
  obj.src='';  
  return ''; 
}



// Tab Content
	function initTabMenu(tabContainerID) {
		var tabContainer = document.getElementById(tabContainerID);
		var tabAnchor = tabContainer.getElementsByTagName("a");
		var i = 0;
	
		for(i=0; i<tabAnchor.length; i++) {
			if (tabAnchor.item(i).className == "tabbtn")
				thismenu = tabAnchor.item(i);
			else
				continue;
	
			thismenu.container = tabContainer;
			thismenu.targetEl = document.getElementById(tabAnchor.item(i).href.split("#")[1]);
			thismenu.targetEl.style.display = "none";
			thismenu.imgEl = thismenu.getElementsByTagName("img").item(0);
			thismenu.onclick = function tabMenuClick() {
				currentmenu = this.container.current;
				if (currentmenu == this)
					return false;
	
				if (currentmenu) {
					currentmenu.targetEl.style.display = "none";
					if (currentmenu.imgEl) {
						currentmenu.imgEl.src = currentmenu.imgEl.src.replace("_on.gif", "_off.gif");						
					} else {
						currentmenu.className = currentmenu.className.replace(" on", "");						
					}
				}
				this.targetEl.style.display = "block";
				if (this.imgEl) {
					this.imgEl.src = this.imgEl.src.replace("_off.gif", "_on.gif");					
				} else {
					this.className += " on";					
				}
				this.container.current = this;
	
				return false;
			};
	
			if (!thismenu.container.first)
				thismenu.container.first = thismenu;
		}
		if (tabContainer.first)
			tabContainer.first.onclick();
}


// 즐겨찾기추가

function favorite() { 
			var navigator_name = navigator.appName;
			if(navigator_name == "Microsoft Internet Explorer"){
				window.external.AddFavorite('http://gjcs.webshow.co.kr/','광주시문화스포츠센터')
			}else{
				alert("");
			}
		}
		
		
		
/********************************팝업존 ********************************************************************/
//이미지 팝업존
var popup_timer = null;
var popup_delay_time = 4000;
var popup_pause = false;
var popup_button_pause = false;
var select_popup_num = 1;
  
function popup_display(popupIDX, move, strid) {
	if(!popupIDX)  {
  		popupIDX = select_popup_num;
  		if(popup_pause==true && !move) return;
  		if(popup_button_pause==true && !move) return;
  		if(!move) move = 'next';
  		hide_popup(strid, popupIDX);
  	}else{
  		hide_popup(select_popup_num);
  	}
  	if(move=='prev') {
  		if(popupIDX==1) {
  			popupIDX = popup_object_num;
  		} else {
  			popupIDX--;
  		}
  	} else if(move=='next') {
  		if(popupIDX==popup_object_num) {
  			popupIDX = 1;
  		} else {
  			popupIDX++;
  		}
  	} else if(move=='pause') {
  		if(popup_button_pause==true) {
  			popup_button_pause=false;	
  			document.getElementById("popup_pause_img").src='/eduyi/img/main/popup_btn_stop.gif';
  			document.getElementById("popup_pause_img").alt='일시정지 팝업';
  		} else if(popup_button_pause==false) {
  			popup_button_pause=true;	
  			document.getElementById("popup_pause_img").src='/eduyi/img/main/popup_btn_play.gif';
  			document.getElementById("popup_pause_img").alt='재생 팝업';
  		}
  	}
  	show_popup(strid, popupIDX);
  	select_popup_num = popupIDX;
}
  
function hide_popup(strid, num) {
  	document.getElementById(strid + num).style.display = 'none';
}
  
function show_popup(strid, num) {
  	document.getElementById(strid + num).style.display = 'block';
}

function popup_scroll(strid) {
  	popup_timer = setInterval("popup_display('','','"+strid+"')",popup_delay_time); 
}



/********************************페이지 프린트 ********************************************************************/
function bodyPrint_01(str) {
	new_window = open("/F_inc/printpage.asp?seaction="+str,"PrintWindow","width=670,height=600,left=10,top=20, resizable=yes, scrollbars=yes");
}
function popupWinWithScroll(sUrl, nWidth, nHeight) //스크롤 있는 팝업창 
{ 
nLeft = (window.screen.width - nWidth ) / 2; 
nTop  = (window.screen.height- nHeight) / 2; 
sF  = ""; 
sF += "toolbar=no,location=no,menubar=no,status=no,directories=no,resizable=no,scrollbars=yes"; 
sF += ",left=" + nLeft; 
sF += ",top=" + nTop; 
sF += ",width=" +  nWidth; 
sF += ",height=" + nHeight; 
window.open(sUrl, "", sF); 
} 



// 이미지 오버
function initImgOver(as_ID) {
	var rollNav = document.getElementById(as_ID);	
	var rollLan = rollNav.childNodes.length;	
	var rollItem;	
	var rollAnchor;
	var rollImg;	
	
	for (var i=0; i<rollLan; i++) {
		rollItem = rollNav.childNodes.item(i);
		if (rollItem.tagName != "LI") {
			continue;
		}
		rollAnchor = rollItem.getElementsByTagName("a").item(0);
		if (rollAnchor.className != "over") {
			rollAnchor.onmouseover = rollAnchor.onfocus = function () {
				if (rollNav.current) {
					rollImg = rollNav.current.childNodes.item(0);
					rollImg.src = rollImg.src.replace("_on.jpg", ".jpg");
					rollNav.current = null;				
				}
				if ((rollNav.current == null) || (rollNav.current != this)) {
					rollImg = this.childNodes.item(0);
					rollImg.src = rollImg.src.replace(".jpg", "_on.jpg");
					rollNav.current = this;
				}
				rollNav.isOver = true;			
			}
			rollAnchor.onmouseout = rollAnchor.onblur = function () {
				if (rollNav.current) {
					rollImg = rollNav.current.childNodes.item(0);
					rollImg.src = rollImg.src.replace("_on.jpg", ".jpg");
					rollNav.current = null;				
				}
			}
		}
	}	
}


function ck_opinion()
{
	if(ratingForm.information[0].checked == false && ratingForm.information[1].checked == false && ratingForm.information[2].checked == false && ratingForm.information[3].checked == false && ratingForm.information[4].checked == false)
	{
		alert("정보성 만족도를 체크 하세요.");
		return false;
	}

	if(ratingForm.convenience[0].checked == false && ratingForm.convenience[1].checked == false && ratingForm.convenience[2].checked == false && ratingForm.convenience[3].checked == false && ratingForm.convenience[4].checked == false)
	{
		alert("편의성 만족도를 체크 하세요.");
		return false;
	}
}






























