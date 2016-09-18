/**
 * options.js 
 */

	function validate_LN(userid) {
		var pattern=new RegExp(/^[a-zA-Z0-9_]+$/g);
		return pattern.test(userid);
		/*
		   	정규식  /^[a-zA-Z0-9_]+$/g
			a에서 z 사이의 문자, A~Z사이의 문자, 0 에서 9사이의 
			숫자나 _로 시작하거나 끝나야 한다는 의미
			닫기 대괄호(]) 뒤의 + 기호는 이 패턴이 한 번 또는 
			그 이상 반복된다는 의미
	    */
	}
	
	function validate_num(num) {
		var pattern=new RegExp(/^[0-9]*$/g);
		return pattern.test(num);
		/*  
			정규식  /^[0-9]*$/g
			0 에서 9사이의 숫자로 시작하거나 끝나야 한다는 의미 
			(^는 시작, $는 끝을 의미)
			닫기 대괄호(]) 뒤의 * 기호는 0번 이상 반복  
		*/
	}
	
	//회원가입 유저아이디
	function validate_userid(userid) {
		var pattern=new RegExp(/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/);
		return pattern.test(userid);		
	}
	//회원가입 생일
	function validate_birth(birth) {
		var pattern=new RegExp(/^[0-9]{6}$/);
		return pattern.test(birth);
	}
	

	/* 
	var ge=["n","FANTASY","SCIENCEFICTION","HORROR","DRAMA","ACTIONANDADVENTURE","ROMANCE","MYSTERY","SERIES","TRILOGY","COMICS","SATIRE","BIOGRAPHIES","AUTOBIOGRAPHIES","CHILDREN","DIARIES","SELFHELP","GUIDE","TRAVEL","RELIGION","PRAYERBOOKS","HISTORY","MATH","ANTHOLOGY","POETRY","JOURNALS","ENCYCLOPEDIAS","DICTIONARIES","SCIENCE","ART","COOKBOOKS","HEALTH"];
	 */
	var gn=["0","101","102","103","104","105","106","107","108","109","110","111","112","113","114","115","116","201","202","203","204","205","206","207","208","209","210","211","212","213","214","215"];
	var gh=["-Select-","판타지","공상과학소설","호러","드라마","액션및어드벤처","로맨스","미스터리","시리즈","트릴로지(3부작책)","만화","풍자","전기","자서전","아동도서","일기형식책","자기계발서","가이드","여행","종교책","기도하는책","역사책","수학책","시(선집),문집","시집","저널,학술지","백과사전","사전","과학책","예술책","요리책","헬스"];
	/* 책 장르 */
	var l="";
	for (var i = 0; i < gn.length; i++) {
		l+="<option value='"+gn[i]+"'>"+gh[i]+"</option>";
	}
	/*
	$("#genre").html(l);
    $( "#genre" )
      .selectmenu()
      .selectmenu( "menuWidget" )
        .addClass( "overflow" );
	*/
	/* 
    $( "#genre" ).selectmenu();
	 */
	