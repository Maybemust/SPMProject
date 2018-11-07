<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=uft-8">
<title>Modify librarian's password</title>
</head>
<style>
.main {
	background-color: #EBEBEB;
	border-radius: 20px;
	width: 300px;
	height: 200px;
	margin: auto;
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	border: 5px solid #000;
}
</style>
<body style="background-color: #FFFFFF">
	<div class="main">
		<form action="admin1" method="post">
			<div>
				<p style="position: relative; left: 20px; top: 20px">account:
					${account}</p>
				<input type="hidden" value="${account}" name="modifiedaccount"
					style="position: relative; top: -15px; left: 90px">
			</div>
			<div>
				<p style="position: relative; left: 20px; top: 10px"">question: ${question}</p>
				<input type="hidden" value="${question}" name= "checkquestion"
					style="position:relative; top:-15px;left:90px">
				
			</div>
			<input
				type="button" onclick="history.go(-1)" value="back"
				style="position: relative; left: 125px">
		</form>
	</div>
</body>
</html>