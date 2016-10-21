<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/main/header.jsp"%>   
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
/*   
.content {margin-top :70px; margin-right:200px; width:688px; border-top:1px solid #dcdcdc;  float:right;}
.line {position:absolute; right:0; top:-1px;}
.sub_title {margin-bottom:30px; padding-top:24px; width:650px; height:34px; border-bottom:1px solid #ddd;}
.sub_title h3 {float:left; margin-top: 13px;}
.sub_title .dir {padding-right:10px; display:inline; float:right;}
.sub_title .dir img {vertical-align:middle;}

.contbox {width:650px; color:#5f5f5f;}
.box_reservation_01 .date {width:650px; height:20px; line-height:18px; font-size:12px; font-weight:bold; color:#666; text-align:right;}
.box_reservation_01 .ticket {width:650px; border-top:2px solid #6aa9e8;}
.box_reservation_01 .ticket th, .box_reservation_01 .ticket td {height:28 px; line-height:28px; color:#333; text-align:center; border-right:1px solid #dedede; border-bottom:1px solid #dedede;}
.box_reservation_01 .ticket th {background:url("images/bus/bg_tableHeader_01.gif") left top repeat-x; border-bottom:1px solid #b6b6b6;}
.box_reservation_01 .ticket .last {border-right:0;}

.box_reservation_01 .bus_fare {margin-top:30px; width:650px; border-top:2px solid #6aa9e8;}
.box_reservation_01 .bus_fare th, .box_reservation_01 .bus_fare td {height:28 px; line-height:28px; color:#333; text-align:center; border-right:1px solid #dedede; border-bottom:1px solid #dedede;}
.box_reservation_01 .bus_fare th {background:url("images/bus/bg_tableHeader_01.gif") left top repeat-x; border-bottom:1px solid #b6b6b6;}
.box_reservation_01 .bus_fare .last {border-right:0;}


.left {float:left;}
#leftmenu01 {margin-top:70px; margin-left:20px; width:225px; font-size:11px; display:inline; overflow:hidden; position:relative; top:-20px; float:left;}
#leftmenu01 dl {margin-bottom:15px; width:224px; background:url("images/bus/bg_leftmenu02.png") left bottom no-repeat; position:relative;}
#leftmenu01 dt.bigtit {height:90px; overflow:hidden;}
#leftmenu01 dt.tit {width:75px; height:30px; color:#666; font-weight:bold; line-height:28px; text-indent:20px; background:url("images/bus/bul_02.gif") 13px 11px no-repeat; float:left; clear:both;}
#leftmenu01 dd {height:30px; line-height:28px;}
#leftmenu01 dd.btn {text-align:center; margin-right: 40px;}
#leftmenu01 dd.bottom {height:20px; overflow:hidden;  margin-left: 0px;}
#leftmenu01 dt.vit {visibility:hidden;}

img.ui-datepicker-trigger {
	padding-left:5px;
	vertical-align: top;
} */
</style>

<!--  제이쿼리 달력  -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
<script type="text/javascript" src="comm/js/script.js"></script>
<link rel="stylesheet" href="comm/css/style.css" />
<link rel="stylesheet" href="comm/css/busStyle.css" />
<script type="text/javascript">
/* $(function() {

	$( "#datepicker" ).datepicker({
		showOn: "button",
		buttonImage: "images/main/cal.gif",
		buttonImageOnly: true,
		showButtonPanel: true,
		dateFormat : "yy/mm/dd",
		showOtherMonths: true,
 		selectOtherMonths: true,
 		changeMonth: true,
     	changeYear: true,
     	numberOfMonths: 1,
      	showButtonPanel: true,
      	minDate: 0,
      	maxDate: "+5y",
      	yearRange: "2016:2021",
      	firstDay: 0,
     	showMonthAfterYear: true , // 월, 년순의 셀렉트 박스를 년,월 순으로 바꿔준다. 
     	dayNamesShort: ['일','월','화','수','목','금','토'],
     	dayNamesMin:  [ "일", "월", "화", "수", "목", "금", "토" ], // 요일
		monthNames : ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		nextText: 'next', // next 아이콘의 툴팁.
		prevText: 'prev', // prev 아이콘의 툴팁.
		dateFormat : "yy년mm월dd일",
		currentText: '오늘'
	});
});

 function sel() {
	var val = $("#select1").val();
	location.href="busSelect.do?select1=" + val;
	
} 
	
function chk() {
			var val1 = document.getElementById("adult").selectedIndex;
			var val2 = document.getElementById("child").selectedIndex;
			var total = val1 + val2;
			if(total > 6){
				alert("당일 동일노선에 대해서 한 예약 번호로 6매를 초과해서\n예약을 하실 수 없습니다.\n\n매수를 총 6매 이하로 다시 선택해 주세요")
				document.getElementById("adult").selectedIndex = 0;
				document.getElementById("child").selectedIndex = 0;
				document.getElementById("adult").focus();
				return false;
				
			}
}
// null 값 체크
function nullchk() {
	var st = document.getElementById("select1").selectedIndex;
	var ad = document.getElementById("adult").selectedIndex;
	var ch = document.getElementById("child").selectedIndex;
	
	if(st == 0){
		alert("출발지를 선택하세요!");
		return false;		
	}

if(ad == 0 && ch == 0 ){
		alert("매수를 선택하세요!")
	return false;	
}
} 		
 */
/* function submit() {
	var button = $("#button").val();

	if(button == "조회") {
		document.left_Box.action="busSelect.do";
		document.left_Box.submit();
	} else if(button == "선택") {
		document.left_Box.action="seatSelect.do";
		document.left_Box.submit();
	}
	
} */
</script>
</head>
<body>
<div>
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
	</div>
	<!-- sub_title -->
	
	<div class="contbox box_reservation_01">
		<p class="date">
		검색결과:
		<c:forEach var="c" items="${list }" >
			<c:if test="${select1 eq c.st_code }">
		 		<font color="#FF6600" >${c.st_name }</font>
			</c:if>
		</c:forEach>
		->
		<c:forEach var="c" items="${list2 }">
			<c:if test="${select2 eq c.dt_code }">
				<font color="#009900">${c.dt_name }</font>
			</c:if>
		</c:forEach>
		
		</p>
		<p class="dir">&nbsp;</p>
		<table class="ticket" summary="버스선택">
			<caption>버스선택</caption>
			<%-- <colgroup>
				<col width="120">
				<col width="120">
				<col width="*">
				<col width="120">
				<col width="120">
			</colgroup> --%>
			<thead>
				<tr>
					<th scope="col" >출발시각</th>
					<th scope="col">등급</th>
					<th scope="col">회사</th>
					<th scope="col">잔여좌석</th>
					<th class="last" scope="col">&nbsp;</th>
				
				</tr>
			</thead>
			<tbody>
				<c:forEach var="s" items="${list4 }">
				<tr>
					<td>${s.start_time }</td>
					<td>${s.grd_name }</td>
					<td>${s.b_company }</td>
					<td>${s.all_seat }</td>
					<td><input type="image" src="images/btn/btn_select.gif" 
					onclick="location.href='seatSelect.do?grd=${s.grd_code}&adult=${adult }&child=${child }&date=${datepicker }&time=${s.start_time }&select2=${select2 }&select1=${select1 }&bus_num=${s.bus_num }'" title="선택" alt="선택"> </td>
				</tr>
				</c:forEach>
				<tr>
					<td colspan="5" style="text-align: right;"><input type="image" src="images/btn/btn_time.gif" > </td>
				</tr>
			</tbody>
		</table>
		<!-- 버스예매예약 -->
		<table class="bus_fare" summary="요금표">
			<caption>요금표</caption>
<%-- 			<colgroup>
				<col width="120">
				<col width="120">
			</colgroup> --%>
			<thead>
			
			<tr>
				<th scope="col" width="20%">구분</th>
				<th scope="col" colspan="2" width="40%">일반고속</th>
				<th scope="col" colspan="2" width="40%">우등고속</th>
			</tr>
			</thead>
			<tbody>
								<tr>
					<td>일반요금</td>
					<td colspan="2">${li.price}</td>
					<td colspan="2">${li.primeum}</td>
				</tr>
				<tr>
					<td>아동요금</td>
					<td class="last" colspan="6">일반요금의 50%</td>
				</tr>
				<tr>
					<td>소요시간</td>
					<td class="last" colspan="6">${li.hour }시간 ${li.min }분</td>
				</tr>
				<tr>
					<td>거리</td>
					<td class="last" colspan="6">${li.run_way }KM</td>
				</tr>
			</tbody>
		</table>
		<!-- 요금표 -->
	</div>
	<!-- contbox -->
</div>
	<!-- content -->
 	<div id="leftmenu01">
 	<div class="left" style="display: block;">
 	<form action="busSelect.do" method="post" name="left_Box">
 		<dl class="lmenu03">
 			<dt class="bigtit">
 				<img alt="승차권예약예매" src="images/bus/title_leftmenu03.png">	
 			</dt>
 			<dt class="tit">
 				<label>출발지</label>
 			</dt>
 			<dd>
 				<select class="sel" id="select1" name="select1" style="width: 135px;" title="출발지선택" onchange="sel2()">
 				<c:forEach var="b" items="${list}" varStatus="status">
					<c:if test="${status.index == 0 }">
						<option selected="selected">선&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;택</option>
					</c:if>
					<c:if test="${select1 eq b.st_code }">
						<option value="${b.st_code}" selected="selected"  >${b.st_name }[${b.st_code }]</option>
					</c:if>
					<c:if test="${select1 ne b.st_code}">
						<option value="${b.st_code}">${b.st_name }[${b.st_code }]</option>
					</c:if>
				</c:forEach>
 				</select>
 			</dd>
 			<dt class="tit">
 				<label>도착지</label>
 			</dt>
 			<dd>
 				<select class="sel" id="select2" name="select2" style="width: 135px;" title="도착지선택">
							<option selected="selected">선&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;택</option>					
					<c:forEach var="b" items="${list2 }" varStatus="status1" >
						<c:if  test="${select2 eq b.dt_code }">
							<option selected="selected" value="${b.dt_code }">${b.dt_name }[${b.dt_code }]</option>
						</c:if>
						<c:if  test="${select2 ne b.dt_code }">
							<option value="${b.dt_code }">${b.dt_name }[${b.dt_code }]</option>
						</c:if>
					</c:forEach>
 				</select>
 			</dd>
 			<dt class="tit">
 				<label>출발일시</label>
 			</dt>
 			<dd>
 			<c:if test="${empty datepicker}">
 				<input type="text" id="datepicker" name="datepicker" size="10" value="${year }년${month}월${day}일"  readonly="readonly">
 			</c:if> 
 			<c:if test="${!empty datepicker}">
 				<input type="text" id="datepicker" name="datepicker" size="10" value="${datepicker }"  readonly="readonly">
 			</c:if>
 			</dd>
 			<dt class="tit vit">
 				<label>시간</label>
 			</dt>
 			<dd>
 				<select class="sel" id="time" name="time" title="시간선택" style="width: 65px;">
 					<c:forTokens var="t" items="${time }" delims="," varStatus="status">
						<c:if test="${status.index == 0 }"> <!-- 시간 첫번째 지정 00:00 -->
						<option selected="selected" value="${t}">${t}:00</option>	
						</c:if>
						<c:if test="${seltime eq t }">
						<option selected="selected" value="${t}">${t}:00</option>
						</c:if>
						<c:if test="${seltime ne t }">
						<option  value="${t}">${t}:00</option>
						</c:if>
 				</c:forTokens>
 				</select>
 				시이후
 			</dd>
 			<dt class="tit">
 				<label>등급</label>
 			</dt>
 			<dd>
 				<select class="sel" id="grd" name="grd" style="width: 80px;" title="등급선택">
 					
 				<c:forEach var="d" items="${list3 }" varStatus="status">
 					<c:if test="${status.index == 0 }">
 						<option value="" selected="selected">전체선택</option>
 					</c:if>
 					<c:if test="${grd eq d.grd_code }">
						<option selected="selected" value="${d.grd_code }">${d.grd_name }</option>	
					</c:if>
 					<c:if test="${grd ne d.grd_code }">
						<option  value="${d.grd_code }">${d.grd_name }</option>	
					</c:if>
				</c:forEach>
 				</select>
 			</dd>
 			<dt class="tit vit">
 				<label>어른</label>
 			</dt>
 			<dd>
 				&nbsp;&nbsp;어른
 				<select class="sel" id="adult" name="adult" style="width: 50px;"title="어른매수 선택" onchange="chk()">
 				<c:forEach var="a" begin="0" end="6">
 					<c:if test="${adult eq a}"> 
						<option  selected="selected" value="${a}">${a}</option>
					</c:if>
					<c:if test="${adult ne a}"> 
						<option  value="${a}">${a}</option>
					</c:if> 
				</c:forEach>
 				 </select>명	<br>&nbsp;
 			</dd>
 			<dt class="tit vit">
 				<label>아동</label>
 			</dt>
 			<dd>
 				&nbsp;&nbsp;아동
 				<select class="sel" id="child" name="child" style="width: 50px;"title="아동매수 선택" onchange="chk()">
 				<c:forEach var="c" begin="0" end="6">
 					<c:if test="${child eq c }">
					<option selected="selected" value="${c}">${c}</option>
					</c:if>
 					<c:if test="${child ne c }">
					<option value="${c}">${c}</option>
					</c:if>
				</c:forEach>
 				 </select>명	
 			</dd>
 			<dd class="btn">
 				<input type="image" src="images/btn/btn_search.gif" value="조회" alt="조회" title="조회" onclick="return nullchk()">
 			</dd>
 			<dd class="bottom">
 				<img alt="" src="images/bus/left_bottom.png">
 			
 			</dd>
 		</dl>
 		</form>
 	</div>
 	</div>
</div>
</body>
</html>