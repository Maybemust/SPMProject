<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Book Detail Page rr</title>
<style>
	.or-spacer {
    	margin-top: 5px;
    	width: 800px;
	}
	
	.or-spacer .mask {
    	overflow: hidden;
    	height: 20px;
	}
	
	.or-spacer .mask:after {
    	content: '';
    	display: block;
    	margin: -25px auto 0;
    	width: 100%;
    	height: 25px;
    	border-radius: 125px/12px;
    	box-shadow: 0 0 8px #337ab7;
	}
	
	.bookimg{
		width: 150px;
		height: 200px;
		max-width: 100%;
		max-height: auto;
	}
	
	.myinput{
		border: none;
		width: 400px;
		height: 30px;
		font-weight: bold;
		font-size: 16px;
		padding-left: 15px;
	}
	
	.mydiv{
		width: 400px;
		height: 300px;
		position: relative;
		left: 200px;
		bottom: 200px;
	}
</style>
</head>
<body>


<%-- <% String ISBN=request.getParameter("ISBN");   --%>

<%-- %> --%>
	<div style="margin: 0 auto; width: 800px; height: 140px">
		<img src="images/book_info.png" style="position: relative; left: 310px;">
		<div class="or-spacer">
    		<div class="mask"></div>
		</div>
	</div>
	<div style="margin: 0 auto; width: 620px; height: 500px">
		<img src="images/2017-12-05 111525.png" class="bookimg" style="position: relative; top:50px;">
		<div class="mydiv">
			<input type="text" value="ISBN:  ${ISBN }" class="myinput" style="background-color: #abd9ff;" readonly />
			<input type="text" value="Book Name:  ${bookName }" class="myinput" style="background-color: #f0f8ff;" readonly />
			<input type="text" value="Author:  ${author }" class="myinput" style="background-color: #abd9ff;" readonly />
			<input type="text" value="Publishing:  ${publishing }" class="myinput" style="background-color: #f0f8ff;" readonly />
			<input type="text" value="Location:  ${location }" class="myinput" style="background-color: #abd9ff;" readonly />
			<input type="text" value="Remaining Number:  ${remainingNumber }" class="myinput" style="background-color: #f0f8ff;" readonly />
			<input type="text" value="Date of Storage:  ${dateOfStorage }" class="myinput" style="background-color: #abd9ff;" readonly />
			<input type="text" value="Tag:  ${tag1 } and ${tag2 }" class="myinput" style="background-color: #f0f8ff;" readonly />
			<input type="text" value="Price:  ${price }" class="myinput" style="background-color: #abd9ff;" readonly />
		</div>
		<form>
			<input type="submit" value="reserve" name="reserveBookInBookDetailPage" id="reserveBookInBookDetailPage" style="position:relative;top:-230px">
		</form>
	</div>

</body>
</html>