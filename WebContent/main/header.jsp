<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
div.navi {
	width: 713px;
	float: right;
	font-variant: small-caps;
}

ul.topmenu {
	margin-top: 10px;
	width: 288px;
	height: 15px;
	float: right;
	margin-right: 120px;
}

ul.topmenu li {
	height: 10px;
	float: left;
	display: block;
}

ul.topmenu li.menu1 {
	width: 50px;
}

ul.topmenu li.menu2 {
	width: 60px;
	display: none;
}

ul.topmenu li.menu3 {
	width: 60px;
	
}

ul.topmenu li.menu4 {
	width: 76px;
	display: none;
}

.navi2 {
	width: 900px;
	height: 70px;
	position: fixed;
	right: 0;
	top: 24px;
	overflow: hidden;
	float :left;
	clear: both;
}

.navi2 ul li {
	height: 45px;
	float: left;
	list-style: none;
}

.navi2 ul li a {
	width: 100%;
	height: 100%;
	display: block;
	overflow: hidden;
	
}

.navi2 ul li.menu1 {
	width: 133px;
	
}

.navi2 ul li.menu2 {
	width: 133px;
}

 .navi2 ul li.menu3 {
	width: 133px;
}

.navi2 ul li.menu4  {
	width: 133px;
}

.navi2 ul li.menu5  {
	width: 133px;
}

.navi2 ul li.menu6 {
	width: 133px;
}


</style>
</head>
<body>
	<div>
		<div class="navi">
			<ul class="topmenu">
				<li class="menu3"><a>siteMap </a></li>
				<li class="menu2"><a>myPage</a></li>
				<li class="menu4"><a>logout</a></li>
				<li class="menu1"><a>login </a></li>
				
				
				
			</ul>
		</div>

		<div class="navi2">
			<ul>
				<li><img alt="#" src="images/main/m0_first.png"></li>
				<li class="menu1"><a><img alt="#" src="images/btn/m1.png"
						onmouseover='this.src="images/btn/m6.png"'
						onmouseout='this.src="images/btn/m1.png"'> </a></li>
				<li class="menu2"><a href="busSelect.do"><img alt="#" src="images/btn/m2.png"
						onmouseover='this.src="images/btn/m7.png"'
						onmouseout='this.src="images/btn/m2.png"'> </a></li>
				<li class="menu3"><a><img alt="#" src="images/btn/m3.png"
						onmouseover='this.src="images/btn/m8.png"'
						onmouseout='this.src="images/btn/m3.png"'> </a></li>
				<li class="menu4"><a><img alt="#" src="images/btn/m4.png"
						onmouseover='this.src="images/btn/m9.png"'
						onmouseout='this.src="images/btn/m4.png"'> </a></li>
				<li><img alt="#" src="images/main/m11_end.png"></li>
			</ul>

		</div>
	</div>
</body>
</html>