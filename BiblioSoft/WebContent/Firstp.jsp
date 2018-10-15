<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html lang="en">
<head>
<script src="js/jquery.min.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="js/bootstrap.min.js"></script>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>首页</title>

<!-- Bootstrap -->
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/config1.css" rel="stylesheet" type="tex	t/css">
<style>
body {
	background-color: #36465D;
}

table:hover {
	background-color: #36465D;
}
</style>

</head>
<body>



	<% String barCode1 = request.getAttribute("barCode1").toString(); %>



	<img src="barcode?msg=<%=barCode1 %>"
		style="height: 30%; width: 30%; position: relative; left: 35%; top: 150px" />

	<%-- <%=barCode %> --%>


</body>
</html>

