<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome</title>
</head>
<style>
.myp1 {
	color: #FFFFFF;
	font-family: Microsoft YaHei;
	line-height: 1px;
	font-size: 60px;
	font-weight: bold;
}

.mybutton {
	background-color: #1a1a1a;
	color: #FFFFFF;
	border-radius: 6px;
	height: 100px;
	width: 250px;
	border: none;
	font-size: 18px;
	font-weight: bold;
	position: relative;
	top: 100px;
	font-size: 35px;
}

.myhr {
	position: relative;
	left: -40px;
	width: 300px;
	position: relative;
	bottom: 20px;
}

body {
	background-image: url(images/background.png);
	background-attachment: fixed;
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
<body>
	<div
		style="width: 700px; height: 300px; position: relative; left: 35%; top: 200px">
		<p class="myp1">Welcome to library !</p>
		<hr class="myhr">
	</div>
	<div
		style="width: 1000px; position: relative; left: 22.5%; bottom: 80px;">
		<img src="images/pattern.png" style="width: 1000px; height: 150px" />
		<img src="images/logo1.png"
			style="width: 60%; height: 60%; position: relative; left: 230px; top: 40px;" />
	</div>
	<div
		style="width: 1000px; height: 300px; position: relative; left: 25%;">
		<button type="button" class="mybutton"
			onmouseover="this.style.backgroundColor='#d19503';"
			onmouseout="this.style.backgroundColor='#1a1a1a';" onclick="location='getA?a=Librarian'">Librarian</button>
		<button type="button" class="mybutton"
			style="position: relative; left: 90px"
			onmouseover="this.style.backgroundColor='#d19503';"
			onmouseout="this.style.backgroundColor='#1a1a1a';" onclick="location='getA?a=Reader'">Reader</button>
		<button type="button" class="mybutton"
			style="position: relative; left: 180px"
			onmouseover="this.style.backgroundColor='#d19503';"
			onmouseout="this.style.backgroundColor='#1a1a1a';" onclick="location='getA?a=Admin'">Admin</button>
	</div>
</body>
</html>