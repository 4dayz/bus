
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
	  		alert("예매수가 많습니다.");
	  	}else if (pnum < total || pnum == null){
	  		alert("예매수가 적습니다.")
	  	} else{
	  		document.SeatForm.submit();
	  	}
	  
	  
	  });
	});
