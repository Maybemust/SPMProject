<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>无标题文档</title>
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
		width: 230px;
		background-color: rgba(200,200,200,0); 
		border-style: solid;
		border-width: 1px;
        border-color: rgba(0, 0, 0, 0.8);
		border-radius: 2px;
		font-weight: bold;
		font-size: 16px;
	}
	
	.mydiv{
		width: 500px;
		height: 300px;
		position: relative;
		left: 200px;
		top:-50px;
		text-align: right;
	}
	
	.mydiv1{
		width: 415px;
		height: 30px;
		background-color: #abd9ff;
	}
	
	.mydiv2{
		width: 415px;
		height: 30px;
		background-color: #f0f8ff;
	}
	
	.mylabel{
		padding-left: 15px;
		font-weight: bold;
		font-size: 16px;
	}
	
	.myposition{
		position: relative;
		top: 5px;
	}
</style>
</head>

<body>

<% String barCode = request.getAttribute("barCode").toString(); %>
<% String ISBN = request.getAttribute("ISBN").toString(); %>
<% String publishing = request.getAttribute("publishing").toString(); %>
<% String author = request.getAttribute("author").toString(); %>
<% String bookName = request.getAttribute("bookName").toString(); %>
<% String location = request.getAttribute("location").toString(); %>
<% String price = request.getAttribute("price").toString(); %>
<% String dateOfStorage = request.getAttribute("dateOfStorage").toString(); %>
<% String tag1 = request.getAttribute("tag1").toString(); %>
<% String tag2 = request.getAttribute("tag2").toString(); %>
<% String imagePath = request.getAttribute("imagePath").toString(); %>
<% String readerAccount = request.getAttribute("readerAccount").toString(); %>
<% String bRID = request.getAttribute("bRID").toString(); %>
<% String type = request.getAttribute("type").toString(); %>








	<div style="margin: 0 auto; width: 800px; height: 140px">
		<img src="images/book_info.png" style="position: relative; left: 310px;">
		<div class="or-spacer">
    		<div class="mask"></div>
		</div>
	</div>
	<div style="margin: 0 auto; width: 620px; height: 500px">
		<img src="<%=imagePath %>" class="bookimg" style="position: relative; top:50px;" >
		<form action="lostfine2" method="post">
		<div class="mydiv">
		
	            <input   type="hidden" value=<%=type %> class="myposition myinput" name="type"/>
				<input   type="hidden" value=<%=bRID %> class="myposition myinput" name="bRID"/>
				<input   type="hidden" value=<%=readerAccount %> class="myposition myinput" name="readerAccount"/>
				<input   type="hidden" value=<%=barCode %> class="myposition myinput" name="barCode"/>
			
		      
			<div class="mydiv1">
				<label class="myposition mylabel">ISBN: </label>
				<input type="text" value=<%=ISBN %> class="myposition myinput" name="saveISBN"/>
			</div>
			<div class="mydiv2">
				<label class="myposition mylabel">barCode: </label>
				<input type="text" value=<%=barCode %> class="myposition myinput" name="savebarCode"/>
			</div>
			<div class="mydiv1">
				<label class="myposition mylabel">Book Name: </label>
				<input type="text" value=<%=bookName %> class="myposition myinput" name="saveBookName"/>
			</div>
			<div class="mydiv2">
				<label class="myposition mylabel">Author: </label>
				<input type="text" value=<%=author %> class="myposition myinput" name="saveAuthor"/>
			</div>
			<div class="mydiv1">
				<label class="myposition mylabel">Publishing: </label>
				<input type="text" value=<%=publishing %> class="myposition myinput" name="savePublishing"/>
			</div>
			<div class="mydiv2">
				<label class="myposition mylabel">Location: </label>
				<input type="text" value=<%=location %> class="myposition myinput" name="saveLocation"/>
			</div>
			<div class="mydiv1">
				<label class="myposition mylabel">Tag1: </label>
				<input type="text" value=<%=tag1 %> class="myposition myinput" name="saveTag1"/>
			</div>
			<div class="mydiv2">
				<label class="myposition mylabel">Tag2: </label>
				<input type="text" value=<%=tag2 %> class="myposition myinput" name="saveTag2"/>
			</div>
			<div class="mydiv1">
				<label class="myposition mylabel">Price: </label>
				<input type="text" value=<%=price %> class="myposition myinput" name="savePrice"/>
			</div>
		</div>
		<input type="submit" value="confirm" name="savebook" id="savebook" style="position:relative;top:-230px">
		<input type="button" value="cancel" name="cancelbook" id="cancelbook" style="position:relative;top:-230px" onclick="location='readerList'">
		</form>
	</div>

</body>
</html>
