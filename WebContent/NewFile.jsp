<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
function check(){
    cbox = input_form.chk;
    if(cbox.length) {  // 여러 개일 경우
        for(var i = 0; i<cbox.length;i++) {
            cbox[i].checked=input_form.all.checked;
        }
    } else { // 한 개일 경우
        cbox.checked=input_form.all.checked;
    }
}
</script>
</HEAD>
<BODY>
<form name="input_form">
<input type="checkbox" name="all" onclick="check();">check all<br>
<input type="checkbox" name="chk" value="01" >TEST1<br>
<input type="checkbox" name="chk" value="02" >TEST2<br>
<input type="checkbox" name="chk" value="03" >TEST3<br>
<input type="checkbox" name="chk" value="04" >TEST4<br>
</form>
</body>
</html>