<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
/* .content {margin-top :70px; margin-right:200px; width:688px; border-top:1px solid #dcdcdc;  float:right;}
.line {position:absolute; right:0; top:-1px;}
.sub_title {margin-bottom:30px; padding-top:24px; width:650px; height:34px; border-bottom:1px solid #ddd;}
.sub_title h3 {float:left; margin-top: 13px;}
.sub_title .dir {padding-right:10px; display:inline; float:right;}
.sub_title .dir img {vertical-align:middle;}
.sel_title {margin:5px 0; padding-top:13px; width:685px; height:27px; font-weight:bold; color:#333; text-align:center; background:url("images/bus/bg_sel_seat.gif") left top repeat-x;}
.sblue {color:#408dd9; font-weight:bold;}

.tbl_seat01 {margin:5px 0; width:100%; border-top:2px solid #dedede; border-bottom:2px solid #dedede;}
.tbl_seat01 td {height:39px; text-align:center; background:#d3e4f4; border-right:1px solid #fff; border-bottom:1px solid #fff;}
.tbl_seat01 td.lady {background:#c2e395;}
.tbl_seat01 td.door {background:#eaeaea;}
.tbl_seat01 td.nobg {background:#fff;}
.tbl_seat01 td.last {border-right:0;}
.tbl_seat01 td label {height:16px; line-height:14px; display:block;}
 */
</style>
<script src="//code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="comm/js/seat.js"></script>
<link rel="stylesheet" href="comm/css/busStyle.css" />
<script type="text/javascript">
	 // 좌석 체크 활성화 , 비활성화 
	var list = new Array();
	$( document ).ready(function() {
		<c:forEach var="s" items="${checkSeat }">
		var tmp = "#" + ${s.seat_num};
		<c:if test="${s.seat_num ne null}">	
		$(tmp).attr("disabled","disabled");
		</c:if>
		<c:if test="${s.seat_num eq null}">	
		$(tmp).removeattr("disabled","disabled");
		</c:if>
		</c:forEach>
	});
/* 
	//일반 예매장 확인
	$(function () {
	  $('.booking').click(function () {
	  gnum= $('input:checkbox[name="gSeat"]:checked').length;
	  total = document.getElementById('total').value;
	  	if(gnum > total){
	  		alert("예매수가 많습니다.");
	  	}else if ( gnum < total  ||  gnum == null ){
	  		alert("예매수가 적습니다.")
	  	}else{
	  		document.SeatForm.submit();
	  	}
	  
	  
	  });
	});
	//우등 예매장 확인
	$(function () {
	  $('.booking1').click(function () {
	  pnum= $('input:checkbox[name="pSeat"]:checked').length;
	  total = document.getElementById('total').value;
	  alert(pnum);
	  alert(total);
	  	if(pnum > total){
	  		alert("예매수를 많습니다.");
	  	}else if (pnum < total || pnum == null){
	  		alert("예매수가 적습니다.")
	  	} else{
	  		document.SeatForm.submit();
	  	}
	  
	  
	  });
	});
 */
	
 </script>


</head>

<body >

<div class="content">
		<img  class =" line"  alt="" src="images/bus/bg_right_01.gif">
	<div class="sub_title">
	<h3>
		<img alt="승차권예약예매" src="images/bus/h3_reservation_01.gif">
	</h3>
	<p class="dir">
	 <a><img alt="home" src="images/bus/icon_home.gif"></a>>
	 <a title="승차권 예약·예매">승차권 예약·예매</a> >
	 <a class="sel">버스선택(좌석선택)</a>
	 </p>
	</div>	<!-- subtitle -->
	<div>
	<p class="sel_title">
		${date}${time }출발&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<c:forEach var="s" items="${list }">
				<c:if test="${select1 eq s.st_code }">${s.st_name }
			</c:if>
		</c:forEach> -->
		 <span class="sblue">
		 <c:forEach var="d" items="${list2 }">
			<c:if test="${select2 eq d.dt_code }">
				${d.dt_name }
			</c:if>
		</c:forEach>
		 </span>
	</p>
	<p class="text02 black">예약하시려는 승차권 매수는 일반${adult }매, 아동${child }매 입니다.<br>잔여좌석중 개의 좌석을 지정하세요.  
	(<input type="checkbox" name="c1" class="chformat" alt="예약 가능 좌석" title="예약 가능 좌석">
	 : 예약 가능 좌석, <input type="checkbox" name="c" disabled="disabled" alt="이미 예약된 좌석" title="이미 예약된 좌석"> : 이미 예약된 좌석)
	 </p>

<c:if test="${grd == 'GER'}" >
<form name="SeatForm" method="post" action="bookingList.do">
		 <input type="hidden" id="adult" value="${adult }" name="adult" >
	 	 <input type="hidden" id="child" value="${child }" name="child" >
	 	 <input type="hidden" value="${date }" name="date" >
	 	 <input type="hidden" value="${select1 }" name="st" >
	 	 <input type="hidden" value="${select2 }" name="dt" >
	 	 <input type="hidden" value="${bus_num  }" name="bus_num" >
	 	 <input type="hidden" id="total" value="${total  }" name="total" >
	 	 
			<fieldset>
			<legend></legend>
<table class="tbl_seat01" summary="일반고속 좌석표"><!-- 일반고속, 우등고속, 심야고속, 심야우등 -->
			<caption>일반고속 좌석표</caption>
			<colgroup>
				<col width="52">
				<col width="56">
				<col width="*">
				<col span="11" width="43">
				<col width="56">
			</colgroup>
			<tbody>
			<tr>
				<td class="door" rowspan="5">앞</td>
				<td class="door" rowspan="2">출입문</td>
				<td class="nobg" rowspan="5"></td>
				<td><label for="c4">4</label> <input type="Checkbox"  name="gSeat" id="4" value="4" alt="4" title="4"  ></td>
				<td><label for="c8">8</label> <input type="Checkbox"  name="gSeat" id="8" value="8" alt="8" title="8"  ></td>
				<td><label for="c12">12</label> <input type="Checkbox"  name="gSeat" id="12" value="12" alt="12" title="12"  ></td>
				<td><label for="c16">16</label> <input type="Checkbox"  name="gSeat" id="16" value="16" alt="16" title="16"  ></td>
				<td><label for="c20">20</label> <input type="Checkbox"  name="gSeat" id="20" value="20" alt="20" title="20"  ></td>
				<td><label for="c24">24</label> <input type="Checkbox"  name="gSeat" id="24" value="24" alt="24" title="24"  ></td>
				<td><label for="c28">28</label> <input type="Checkbox"  name="gSeat" id="28" value="28" alt="28" title="28"  ></td>
				<td><label for="c32">32</label> <input type="Checkbox"  name="gSeat" id="32" value="32" alt="32" title="32"  ></td>
				<td><label for="c36">36</label> <input type="Checkbox"  name="gSeat" id="36" value="36" alt="36" title="36"  ></td>
				<td><label for="c40">40</label> <input type="Checkbox"  name="gSeat" id="40" value="40" alt="40" title="40"  ></td>
				<td><label for="c45">45</label> <input type="Checkbox"  name="gSeat" id="45" value="45" alt="45" title="45"  ></td>
				<td class="door last" rowspan="5">뒤</td>
			</tr>
			<tr>
				<td><label for="c3">3</label> <input type="Checkbox"  name="gSeat" id="3" value="3" alt="3" title="3"  ></td>
				<td><label for="c7">7</label> <input type="Checkbox"  name="gSeat" id="7" value="7" alt="7" title="7"  ></td>
				<td><label for="c11">11</label> <input type="Checkbox"  name="gSeat" id="11" value="11" alt="11" title="11"  ></td>
				<td><label for="c15">15</label> <input type="Checkbox"  name="gSeat" id="15" value="15" alt="15" title="15"  ></td>
				<td><label for="c19">19</label> <input type="Checkbox"  name="gSeat" id="19" value="19" alt="19" title="19"  ></td>
				<td><label for="c23">23</label> <input type="Checkbox"  name="gSeat" id="23" value="23" alt="23" title="23"  ></td>
				<td><label for="c27">27</label> <input type="Checkbox"  name="gSeat" id="27" value="27" alt="27" title="27"  ></td>
				<td><label for="c31">31</label> <input type="Checkbox"  name="gSeat" id="31" value="31" alt="31" title="31"  ></td>
				<td><label for="c35">35</label> <input type="Checkbox"  name="gSeat" id="35" value="35" alt="35" title="35"  ></td>
				<td><label for="c39">39</label> <input type="Checkbox"  name="gSeat" id="39" value="39" alt="39" title="39"  ></td>
				<td><label for="c44">44</label> <input type="Checkbox"  name="gSeat" id="44" value="44" alt="44" title="44"  ></td>
			</tr>
			<tr>
				<td class="nobg"></td>
				<td class="nobg" colspan="10">통로</td>
				<td><label for="c43">43</label> <input type="Checkbox"  name="gSeat" id="43" value="43" alt="43" title="43"  ></td>
			</tr>
			<tr>
				<td class="door" rowspan="2">운전석</td>
				<td><label for="c2">2</label> <input type="Checkbox"  name="gSeat" id="2" value="2" alt="2" title="2"  ></td>
				<td><label for="c6">6</label> <input type="Checkbox"  name="gSeat" id="6" value="6" alt="6" title="6"  ></td>
				<td><label for="c10">10</label> <input type="Checkbox"  name="gSeat" id="10" value="10" alt="10" title="10"  ></td>
				<td><label for="c14">14</label> <input type="Checkbox"  name="gSeat" id="14" value="14" alt="14" title="14"  ></td>
				<td><label for="c18">18</label> <input type="Checkbox"  name="gSeat" id="18" value="18" alt="18" title="18"  ></td>
				<td><label for="c22">22</label> <input type="Checkbox"  name="gSeat" id="22" value="22" alt="22" title="22"  ></td>
				<td><label for="c26">26</label> <input type="Checkbox"  name="gSeat" id="26" value="26" alt="26" title="26"  ></td>
				<td><label for="c30">30</label> <input type="Checkbox"  name="gSeat" id="30" value="30" alt="30" title="30"  ></td>
				<td><label for="c34">34</label> <input type="Checkbox"  name="gSeat" id="34" value="34" alt="34" title="34"  ></td>
				<td><label for="c38">38</label> <input type="Checkbox"  name="gSeat" id="38" value="38" alt="38" title="38"  ></td>
				<td><label for="c42">42</label> <input type="Checkbox"  name="gSeat" id="42" value="42" alt="42" title="42"  ></td>
			</tr>
			<tr>
				<td><label for="c1">1</label> <input type="Checkbox" name="gSeat" id="1" value="1" alt="1" title="1" ></td>
				<td><label for="c5">5</label> <input type="Checkbox" name="gSeat" id="5" value="5" alt="5" title="5"  ></td>
				<td><label for="c9">9</label> <input type="Checkbox" name="gSeat" id="9" value="9" alt="9" title="9"  ></td>
				<td><label for="c13">13</label> <input type="Checkbox" name="gSeat" id="13" value="13" alt="13" title="13"  ></td>
				<td><label for="c17">17</label> <input type="Checkbox" name="gSeat" id="17" value="17" alt="17" title="17"  ></td>
				<td><label for="c21">21</label> <input type="Checkbox" name="gSeat" id="21" value="21" alt="21" title="21"  ></td>
				<td><label for="c25">25</label> <input type="Checkbox" name="gSeat" id="25" value="25" alt="25" title="25"  ></td>
				<td><label for="c29">29</label> <input type="Checkbox" name="gSeat" id="29" value="29" alt="29" title="29"  ></td>
				<td><label for="c33">33</label> <input type="Checkbox" name="gSeat" id="33" value="33" alt="33" title="33"  ></td>
				<td><label for="c37">37</label> <input type="Checkbox" name="gSeat" id="37" value="37" alt="37" title="37"  ></td>
				<td><label for="c41">41</label> <input type="Checkbox" name="gSeat" id="41" value="41" alt="41" title="41"  ></td>
				
			</tr>
			<tr><td colspan="15"><input type="button" value="예약완료" class="booking" name="booking" id="booking" ></tr>
			</tbody>
			</table>
			</fieldset>
			</form> <!-- general -->
</c:if>
<c:if test="${ grd  == 'PRM'}">
			<form name="SeatForm" method="post" action="bookingList.do">
				 <input type="hidden" value="${adult }" name="adult" >
			 	 <input type="hidden" value="${child }" name="child" >
			 	 <input type="hidden" value="${date }" name="date" >
			 	 <input type="hidden" value="${select1 }" name="st" >
			 	 <input type="hidden" value="${select2 }" name="dt" >
			 	 <input type="hidden" value="${bus_num  }" name="bus_num" >
				 <input type="hidden" id="total" value="${total  }" name="total" >
			<fieldset>
			<legend></legend>
			<table class="tbl_seat01" summary="우등고속 좌석표"><!-- 일반고속, 우등고속, 심야고속, 심야우등 -->
			<caption>우등고속 좌석표</caption>
			<colgroup>
				<col width="52">
				<col width="56">
				<col width="*">
				<col span="9" width="52">
				<col width="56">
			</colgroup>
			<tbody>
			<tr>
				<td class="door" rowspan="4">앞</td>
				<td class="door">출입문</td>
				<td class="nobg" rowspan="4"></td>
				<td><label for="c3">3</label> <input type="Checkbox" spellcheck="false" name="pSeat" id="3" value="3" alt="3" title="3"  ></td>
				<td><label for="c6">6</label> <input type="Checkbox" name="pSeat" id="6" value="6" alt="6" title="6"  ></td>
				<td><label for="c9">9</label> <input type="Checkbox" name="pSeat" id="9" value="9" alt="9" title="9"  ></td>
				<td><label for="c12">12</label> <input type="Checkbox" name="pSeat" id="12" value="12" alt="12" title="12"  ></td>
				<td><label for="c15">15</label> <input type="Checkbox" name="pSeat" id="15" value="15" alt="15" title="15"  ></td>
				<td><label for="c18">18</label> <input type="Checkbox" name="pSeat" id="18" value="18" alt="18" title="18"  ></td>
				<td><label for="c21">21</label> <input type="Checkbox" name="pSeat" id="21" value="21" alt="21" title="21"  ></td>
				<td><label for="c24">24</label> <input type="Checkbox" name="pSeat" id="24" value="24" alt="24" title="24"  ></td>
				<td><label for="c28">28</label> <input type="Checkbox" name="pSeat" id="28" value="28" alt="28" title="28"  ></td>
				<td class="door last" rowspan="4">뒤</td>
			</tr>
			<tr>
				<td class="nobg"></td>
				<td class="nobg" colspan="8">통로</td>
				<td><label for="c27">27</label> <input type="Checkbox" name="pSeat" id="27" value="27" alt="27" title="27"  ></td>
			</tr>
			<tr>
				<td class="door" rowspan="2">운전석</td>
				<td><label for="c2">2</label> <input type="Checkbox" name="pSeat" id="2" value="2" alt="2" title="2"  ></td>
				<td><label for="c5">5</label> <input type="Checkbox" name="pSeat" id="5" value="5" alt="5" title="5"  ></td>
				<td><label for="c8">8</label> <input type="Checkbox" name="pSeat" id="8" value="8" alt="8" title="8"  ></td>
				<td><label for="c11">11</label> <input type="Checkbox" name="pSeat" id="11" value="11" alt="11" title="11"  ></td>
				<td><label for="c14">14</label> <input type="Checkbox" name="pSeat" id="14" value="14" alt="14" title="14"  ></td>
				<td><label for="c17">17</label> <input type="Checkbox" name="pSeat" id="17" value="17" alt="17" title="17"  ></td>
				<td><label for="c20">20</label> <input type="Checkbox" name="pSeat" id="20" value="20" alt="20" title="20"  ></td>
				<td><label for="c23">23</label> <input type="Checkbox" name="pSeat" id="23" value="23" alt="23" title="23"  ></td>
				<td><label for="c26">26</label> <input type="Checkbox" name="pSeat" id="26" value="26" alt="26" title="26"  ></td>
			</tr>
			<tr>			
				<td><label for="c1">1</label> <input type="Checkbox" name="pSeat" id="1" value="1" alt="1" title="1"  ></td>
				<td><label for="c4">4</label> <input type="Checkbox" name="pSeat" id="4" value="4" alt="4" title="4"  ></td>
				<td><label for="c7">7</label> <input type="Checkbox" name="pSeat" id="7" value="7" alt="7" title="7"  ></td>
				<td><label for="c10">10</label> <input type="Checkbox" name="pSeat" id="10" value="10" alt="10" title="10"  ></td>
				<td><label for="c13">13</label> <input type="Checkbox" name="pSeat" id="13" value="13" alt="13" title="13"  ></td>
				<td><label for="c16">16</label> <input type="Checkbox" name="pSeat" id="16" value="16" alt="16" title="16"  ></td>
				<td><label for="c19">19</label> <input type="Checkbox" name="pSeat" id="19" value="19" alt="19" title="19"  ></td>
				<td><label for="c22">22</label> <input type="Checkbox" name="pSeat" id="22" value="22" alt="22" title="22"  ></td>
				<td><label for="c25">25</label> <input type="Checkbox" name="pSeat" id="25" value="25" alt="25" title="25"  ></td>
			</tr>
			<tr><td colspan="15"><input type="button" value="예약완료" class="booking1" name="booking" id="booking" ></tr>
			</tbody>
			</table>
	
							

			</fieldset>
			</form> <!-- premeum -->
			</c:if>
			</div>
			 
</div> <!-- content -->
</body>
</html>