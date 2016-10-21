//달력
$(function() {
	$("#datepicker").datepicker(
			{
				showOn : "button",
				buttonImage : "images/main/cal.gif",
				buttonImageOnly : true,
				showButtonPanel : true,
				dateFormat : "yy/mm/dd",
				showOtherMonths : true,
				selectOtherMonths : true,
				changeMonth : true,
				changeYear : true,
				numberOfMonths : 1,
				showButtonPanel : true,
				minDate : 0,
				maxDate : "+5y",
				yearRange : "2016:2021",
				firstDay : 0,
				showMonthAfterYear : true, // 월, 년순의 셀렉트 박스를 년,월 순으로 바꿔준다.
				dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
				dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토" ], // 요일
				monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
						'9월', '10월', '11월', '12월' ],
				monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
						'8월', '9월', '10월', '11월', '12월' ],
				nextText : 'next', // next 아이콘의 툴팁.
				prevText : 'prev', // prev 아이콘의 툴팁.
				dateFormat : "yy년mm월dd일",
				currentText : '오늘'
			});
	$('#datepicker').val($.datepicker.formatDate('yy년mm월dd일', new Date()));
});

// 버튼 보이기 /숨기기
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

// 메인 출발지에 따라 도착지 변경
function sel() {
	var val = $("#select1").val();
	location.href = "body.do?select1=" + val;

}
// 체크 6매초과
function chk() {
	var val1 = document.getElementById("adult").selectedIndex;
	var val2 = document.getElementById("child").selectedIndex;
	var total = val1 + val2;
	if (total > 6) {
		alert("당일 동일노선에 대해서 한 예약 번호로 6매를 초과해서\n예약을 하실 수 없습니다.\n\n매수를 총 6매 이하로 다시 선택해 주세요")
		document.getElementById("adult").selectedIndex = 0;
		document.getElementById("child").selectedIndex = 0;
		document.getElementById("adult").focus();
		return false;

	}

}
// 예약 페이지에서 출발지에 따라 도착지 선택
function sel2() {
	var val = $("#select1").val();
	location.href = "busSelect.do?select1=" + val;

}

/*// null 값 체크
function chknull() {
	var st = document.getElementById("select1").selectedIndex;
	var ad = document.getElementById("adult").selectedIndex;
	var ch = document.getElementById("child").selectedIndex;

	if (st == 0) {
		alert("출발지를 선택하세요!");
		return false;
	}

	if (ad == 0 && ch == 0) {
		alert("매수를 선택하세요!")
		return false;
	}
}
*/
// null 값 체크
function nullchk() {
	var st = document.getElementById("select1").selectedIndex;
	var ad = document.getElementById("adult").selectedIndex;
	var ch = document.getElementById("child").selectedIndex;

	if (st == 0) {
		alert("출발지를 선택하세요!");
		return false;
	}

	if (ad == 0 && ch == 0) {
		alert("매수를 선택하세요!")
		return false;
	}
}

/* 이미지 슬라이드*/
 $(document).ready(function(){
	  $('.bxslider').bxSlider({
		  video:true ,
		  useCSS:false,
		  mode: 'fade',
		  slideWidth:350,
		  pager:false,
		  moveSlides : 1,
		  maxSlides : 1,
		  minSlides : 1,
		  autoHover : true,
		  auto : true,
		  controls:false
	  });
	});
 
 /*
$(document).ready(function(){
	$('.slider img').hide();
	$('.slider img').first().show();
	$('.slider img').css('width',300, 'height',100);
	setInterval(function() {
		$('.slider').append($('.slider img').first());
		$('.slider img').last().hide();
		$('.slider img').first().show();
	},2000);
	
	
});
*/
/* * function submit() { var button = $("#button").val();
 * 
 * if(button == "조회") { document.left_Box.action="busSelect.do";
 * document.left_Box.submit(); } else if(button == "선택") {
 * document.left_Box.action="seatSelect.do"; document.left_Box.submit(); } }
 */