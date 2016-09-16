<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css">
<script src="<c:url value='/jquery/jquery-3.1.0.min.js'/>" type="text/javascript"></script>
<script src="<c:url value='/jquery/jquery-ui.js'/>"	type="text/javascript"></script>


<script type="text/javascript">
	$(document).ready(function() {
			
		/* 	
		$(".endDay").datepicker({
			dateFormat:"yy-mm-dd",
			changeMonth: true,
			changeYear:true,
			dayNamesMin:['일','월','화','수','목','금','토'],
			monthNames:['1월','2월','3월','4월','5월','6월',
			            '7월','8월','9월','10월','11월','12월']
		});
			
		
		
		
		// Getter
		var monthNamesShort = $( ".endDay" ).datepicker( "option", "monthNamesShort" );
		// Setter
		$( ".endDay" ).datepicker( "option", "monthNamesShort", ['1월','2월','3월','4월','5월','6월',
		                                   			            '7월','8월','9월','10월','11월','12월'] );
		  */
		
		$.setToday();
		
		$(".period").focus(function() {
			$(this).val("");
		});
		
		
		$(".period").keyup(function() {
			var days=$(this).val();
			
			var period=$.getPeriodDate(days);
			
			$(this).parent().parent().parent().find(".endDay").val(period);
		});
		
	});
	
	
	$.getPeriodDate=function(days){
		//종료일을 기준으로 7일전, 1개월전, 3개월전의 날짜를 구해서 시작일에 셋팅
		
		//종료일에 해당하는 날짜 구하기
		var today=new Date();
		var gdate=$.getDate(today);
		var str=gdate.split("-"); //2016-09-13
		var period=new Date(str[0],str[1]-1,str[2]);
		alert(days);
		period.setDate(period.getDate()+days);
		var str=$.getDate(period);
		
		return str;
	}
	
/* 	
	$.getPeriodDate=function(){
		//종료일을 기준으로 7일전, 1개월전, 3개월전의 날짜를 구해서 시작일에 셋팅
		
		//종료일에 해당하는 날짜 구하기
		var str=$("#endDay").val().split("-"); //2016-09-13
		var endDate=new Date(str[0],str[1]-1,str[2]);
		var str1=$(".startDay").val().split("-"); //2016-09-13
		var startDay=new Date(str1[0],str1[1]-1,str1[2]);
		var today=new Date();
		var str2=$.getDate(today);
		
		//new Date(2016, 8, 13);
		var period=(endDate-startDay)/(60*60*24*1000);
		if (period<1) {
			alertify.alert("대여 만료일이 대여시작일보다 늦거나 같을 수 없습니다."); 
			$("#endDay").focus();
			$("#period").val(0);
			return false;
		}		
		$("#period").val(period);
	}
	 */
	
	//jquery 함수
	$.setToday=function(){
		if ($(".startDay").val()==null || $(".startDay").val()=="") {
			var today=new Date();
			var str=$.getDate(today);
			
			$(".startDay").val(str);
			$(".endDay").val(str);
		}
	}
	
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
	
	//function setToday2(){} 자바스크립트 함수
</script>

	<!-- 
	<input type="button" id="btWeek" value="1주일" >
	<input type="button" id="btMonth1" value="1개월" >
	<input type="button" id="btMonth3" value="3개월" >
	 -->
	 
	
	<input type="text" name="startDay" class="startDay" id="startDay" readonly="readonly"> 
	~ 
	<input type="text" name="endDay" id="endDay" class="endDay" readonly="readonly">
	
	<input type="button" name="btPeriod" id="btPeriod" value="변경">
	<p>
	대여 총일
	<input type="text" name="period" id="period" class="period" value="0">
	</p>