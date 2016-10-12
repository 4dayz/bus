<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style type="text/css">
.tab {
	width: 492px;
	height: 263px;
	margin-top: 70px;
	margin-right: 300px;
	float: right;
}

.ticket {
	overflow: hidden;
}

.ticket li {
	list-style: none;
	padding-right: 1px;
	height: 37px;
	float: left;
}

.ticket li a {
	height: 100%;
	display: block;
	overflow: hidden;
}

caption, .none {
	display: none;
}

.board1 th {
	text-align: left;
}

.board1, .board2 {
	border: 1px solid silver;
}

.board2 {
	padding-top: 10px;
	overflow: hidden;
	display: none;
}

.board2 dt {
	padding: 0px 4px;
	float: left;
	font-weight: bold;
	clear: both;
}
.board2 img {
	float :right;
	margin: -80px 70px;
}
.board2 p {
	font-size: small;
	font-style: oblique;
}

img.ui-datepicker-trigger {
	padding-left:5px;
	vertical-align: top;
}

.content_left .visual {width:305px; height:263px;}
.content_left .notice {margin:20px 0; width:305px; position:relative;}

.notice p.more {text-align:right; position:absolute; right:1px; top:5px;}
.notice ul.title {width:305px; height:37px; overflow:hidden;}
.notice ul.title li {width:91px; height:27px; float:left;}
.notice ul.title li a {height:100%;  display:block; overflow:hidden;}

.notice ul.title li.title01 a {background-position:-191px 0px;}
.notice ul.title li.title02 a {background-position:-282px 0px;}
.notice ul.title li.title01 a:active, .notice ul.title li.title01 a:focus, .notice ul.title li.title01 a:hover {background-position:0 0px;}
.notice ul.title li.title02 a:active, .notice ul.title li.title02 a:focus, .notice ul.title li.title02 a:hover {background-position:-91px 0px;}

.notice dl.notice01, .notice dl.notice02 {background:; width:305px; height:75px;}
.notice01 ul.bul li {text-indent:12px; background:url("images/bus/bul_01.gif") 3px 7px no-repeat;}
.notice01 dd ul li {width:305px; height:20px; font-size:12px; line-height:20px; overflow:hidden; position:relative;}

.notice02 ul.bul li {text-indent:12px; background:url("images/bus/bul_01.gif") 3px 7px no-repeat;}
.notice02 dd ul li {width:305px; height:20px; font-size:12px; line-height:20px; overflow:hidden; position:relative;}

</style>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
<link rel="stylesheet" href="comm/css/style.css" />
<script type="text/javascript">
	
//달력
$(function() {
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
		
		//버튼 보이기 /숨기기
		$(function() {
			$('.btn1').click(function() {
				$('.board1').show();
				$('.board2').hide();
			});
			$('.btn2').click(function() {
				$('.board2').show();
				$('.board1').hide();
			});
		});
	
		//출발지에 따라 도착지 변경
	function sel() {
		var val = $("#select1").val();
		location.href="body.do?select1=" + val;
		
	}
	//체크 6매초과
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

		
		
</script>
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<div class="content_right">
	<div class="tab">
		<div class="ticket">
			<ul>
				<li class="btn1"><a><img alt="" src="images/btn/b5.png"
						onmouseover='this.src="images/btn/b6.png"'
						onmouseout='this.src="images/btn/b5.png"'></a></li>
				<li class="btn2"><a><img alt="" src="images/btn/b7.png"
						onmouseover='this.src="images/btn/b8.png"'
						onmouseout='this.src="images/btn/b7.png"'></a></li>
				<li>
			</ul>
		</div>
		<!-- ticket -->
		<div class="board1">
			<form action="busSelect.do" method="post" >
				<div>
					<table>
						<caption>승차권예약</caption>
						<colgroup>
							<col width="15%">
							<col width="35%">
							<col width="15%">
							<col width="35%">
						</colgroup>
						<tbody>
							<tr>

								<th><label>출발지</label></th>
								<td>
									<select id="select1" name="select1" style="width: 100%;" onchange="sel()"  >
										<%-- <c:if test="${select1 eq ''}">
											<option selected="selected">선&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;택</option>
										</c:if>  --%>
										
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
								</td>
								<th><label>도착지</label></th>
								<td><select  id="select2" name="select2" style="width: 100%;" tabindex="2" >
										<option selected="selected">선&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;택</option>
										<c:forEach var="b" items="${list2 }" >
										<option selected="selected" value="${b.dt_code }">${b.dt_name }[${b.dt_code }]</option>
										</c:forEach>
								</select></td>
							</tr>
							<tr>
								<th><label>출발일시</label></th>
								<td colspan="3"><input type="text" id="datepicker"
									size="13" readonly="readonly" name="datepicker"> 
								<select id="time" name="time" style="width: 25%;" >
								<c:forEach var="t" begin="0" end="24">
									<c:if test="${t < 10 }">
									<option  value="0${t}00">0${t}:00</option>
									</c:if>
									<c:if test="${t>=10 }">
									<option value="0${t}00">${t}:00</option>
									</c:if>
								</c:forEach>
								</select>
								시이후 
					</td>
							</tr>
							<tr>
								<th><label>등급</label></th>
								<td colspan="3"><select id="grd" name="grd" style="width: 35%;">
									<option value="" selected="selected">전체등급</option>
								<c:forEach var="d" items="${list3 }">
									<option value="${d.grd_code }">${d.grd_name }</option>	
								</c:forEach>
								</select></td>
							</tr>
							<tr>
								<th><label>매수</label></th>
								<td colspan="3">
								어른<select id="adult" name="adult" style="width: 15%; " onchange="chk()">
									<c:forEach var="a" begin="0" end="6">
									<option value="${a}">${a}</option>
									</c:forEach>
								</select>
								&nbsp;&nbsp;&nbsp;&nbsp;아동
								<select id="child" name="child" style="width: 15%;" onchange="chk()">
									<c:forEach var="c" begin="0" end="6">
									<option value="${c}">${c}</option>
									</c:forEach>
								</select>

								</td>
							</tr>
							

						</tbody>
					</table>
					<p align="center">
						<input type="image" src="images/main/btn1.png">
					</p>
				</div>
			</form>
		</div>
		<!-- board1 -->
		<div class="board2">
			<p>예약/예매시 예약번호와 핸드번호를 입력하세요</p>
			<dl>
				<dt>
					<label>예약번호</label>
				</dt>
				<dd  style="padding-left: 18px;">
					<input type="text" name="bkNo" style="width: 154px;">
				</dd>
			</dl>
			<dl >
				<dt>
					<label>핸드폰번호</label>
				</dt>
				<dd>
					<input type="text" name="telNo" style="width: 154px; ">
				</dd>
			</dl>
			<dl>
				<dd>
					<a href="/bus/busSelect.jsp"><img alt="" src="images/main/btn2.png" > </a>
				</dd>
			</dl>
		</div>
		<!-- //board2 -->
	</div>
	<!-- tab -->
	</div>
	<!-- content_right -->
	<div class="content_left">
		<div class="visual"></div>
		<div class="notice">
			<ul class="title">
				<li class="title01"><a><img alt="" src="images/btn/n1.png"
						onmouseover='this.src="images/btn/n2.png"'
						onmouseout='this.src="images/btn/n1.png"'></a>
				</li>
				<li class="title02"><a><img alt="" src="images/btn/n3.png"
						onmouseover='this.src="images/btn/n4.png"'
						onmouseout='this.src="images/btn/n3.png"'></a>
				</li>
			</ul>
			<p class="more">
				<a><img alt="" src="images/btn/btn_more.png"> </a>
			</p>
			<dl class="notice01">
				<dt class="none">공지사항</dt>
				<dd>
					<ul class="bul">
						<li></li>
					</ul>
				</dd>
			</dl>
			<!-- 공지사항 -->
			<dl class="notice02">
				<dt class="none">고객센터</dt>
				<dd>
					<ul>
						<li></li>
					</ul>
				</dd>
			</dl>
			<!-- 고객센터 -->
		</div>
		<!-- notice -->
	</div>
	<!-- content_left -->
	</div> 
	<!-- container -->
</body>
</html>