<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcom</title>
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
		<button type="button" class="mybutton"
			onmouseover="this.style.backgroundColor='#d19503';"
			onmouseout="this.style.backgroundColor='#1a1a1a';" onClick="location='LibrarianFirstPage.jsp'">Librarian</button>
		<button type="button" class="mybutton"
			style="position: relative; left: 90px"
			onmouseover="this.style.backgroundColor='#d19503';"
			onmouseout="this.style.backgroundColor='#1a1a1a';  " onClick="location='getreader?account=diao'"    >Reader</button>
	</div>
</body>
</html>