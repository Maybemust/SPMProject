<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Book Detail Page</title>
</head>
<body>


<%-- <% String ISBN=request.getParameter("ISBN");   --%>

<%-- %> --%>
	<div>
		<p>ISBN:${ISBN }</p>
		<p>bookName:${bookName }</p>
		<p>author:${author }</p>
		<p>publishing:${publishing }</p>
		<p>location:${location }</p>
		<p>remaining number:${remainingNumber }</p>
		<p>date of storage:${dateOfStorage }</p>
		<p>tag:${tag1 } and ${tag2 }</p>
		<p>price:${price }</p>
	</div>

</body>
</html>