<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome</title>
<script src="js/jquery.min.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="js/bootstrap.min.js"></script>
</head>
<style>
.myp1 {
	color: #FFFFFF;
	font-family: Microsoft YaHei;
	line-height: 1px;
	font-size: 60px;
	font-weight: bold;
}

.myp2 {
	color: #FFFFFF;
	font-family: Microsoft YaHei;
	line-height: 1px;
	font-size: 40px;
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
	top: 40px;
	font-size: 35px;
}

.myhr {
	position: relative;
	left: -40px;
	width: 300px;
	position: relative;
	bottom: 20px;
}

.bg {
	width: 800px;
	height: 400px;
	border-radius: 6px;
	background-color: rgba(0, 0, 0, 0.5);
	position: relative;
	top: 10px;
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
		style="width: 700px; height: 300px; position: relative; left: 35%; top: 40px;">
		<p class="myp1">Welcome to library !</p>
		<hr class="myhr" style="position: relative; top: 20px;">
	</div>
	<div
		style="width: 1000px; position: relative; left: 22.5%; bottom: 240px;">
		<img src="images/pattern.png" style="width: 1000px; height: 150px" />
		<div class="bg" style="left: 90px; top: 20px;">
			<img src="images/logo1.png"
				style="max-width: 200px; max-height: auto; position: relative; left: 310px; top: 10px;" />
			<p class="myp2" style="position: relative; left: 360px; top: 40px;">POST</p>
			<div style="position: relative; left: 100px; top: 80px;">
				<c:forEach items="${posts}" var="postItem" varStatus="st">

					<a href="PostDetails?postID=${postItem.getPostID()}" target="_blank"
						style="display: block; font-size: 20px; font-weight: bold;"><h2
							style="color: white;">Title:${postItem.getPostTitle()}</h2></a>
				</c:forEach>

				<ul class="pagination" style="position: relative; left: 150px; top: 100px;">

					<li><a href="finPost?start=0" aria-label="First">
							First Page <span aria-hidden="true"></span>
					</a></li>

					<li><a href="finPost?start=${pre}"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>

							Previous
					</a></li>

					<li><a href="finPost?start=${next}"
						aria-label="Next"> Next <span aria-hidden="true">&raquo;</span>
					</a></li>

					<li><a href="finPost?start=${last}"
						aria-label="Last"> Last Page </a></li>


				</ul>
			</div>
		</div>
	</div>
	<div
		style="width: 1000px; height: 300px; position: relative; left: 35%; bottom: 200px;">
		<button type="button" class="mybutton"
			onmouseover="this.style.backgroundColor='#d19503';"
			onmouseout="this.style.backgroundColor='#1a1a1a';"
			onclick="location='getA?a=Librarian'">Librarian</button>
		<button type="button" class="mybutton"
			style="position: relative; left: 120px"
			onmouseover="this.style.backgroundColor='#d19503';"
			onmouseout="this.style.backgroundColor='#1a1a1a';"
			onclick="location='getA?a=Reader'">Reader</button>
	</div>
</body>
</html>