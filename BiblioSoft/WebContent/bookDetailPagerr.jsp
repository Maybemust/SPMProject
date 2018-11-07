<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="js/ajax.js"></script>
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
    	box-shadow: 0 0 8px #383838;
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
		top: -50px;
	}
	
	.mydiv1{
		width: 415px;
		height: 30px;
		background-color: #c2c8cc;
	}
	
	.myselect{
		width: 180px;
		height: 20px;
		font-weight: bold;
		font-size: 14px;
		border-style: solid;
		border-width: 1px;
		position: relative;
		top: 5px;
		background-color: rgba(255,255,255,0.2);
	}
	
	.mylabel{
		padding-left: 15px;
		font-weight: bold;
		font-size: 16px;
		font-family: Microsoft YaHei;
		position: relative;
		top: 5px;
	}
	
	.mytextarea{
		width: 260px;
		position: relative;
		top: 5px;
		background-color: rgba(0,0,0,0);
		border-style: solid;
		border-width: 1px;
        border-color: rgba(0, 0, 0, 0.8);
	}
	
	body{
		background-color: #eff3f7;
	}

</style>
</head>
<body>


	<div style="margin: 0 auto; width: 800px; height: 140px; position: relative; top: 60px;">
		<img src="images/book_info_r.png"
			style="position: relative; left: 310px;">
		<div class="or-spacer">
			<div class="mask"></div>
		</div>
	</div>
	<div style="margin: 0 auto; width: 620px; height: 500px; position: relative; top: 80px;">
		<img src="${imagePath }" class="bookimg"
		         
			style="position: relative; top: 50px;">
		<div class="mydiv">
		<div class="mydiv1">
			<form action="">
				<label class="mylabel">Barcode: </label>
				<select id="barCode" name="barCode" class="myselect" onchange="changeBookInfo(this.value, 'location', 'status');">
					<c:forEach items="${books }" var="book" varStatus="st">
						<option value="${book.barCode }">${book.barCode }</option>
					</c:forEach>
				</select>
			</form>
		</div>
			<input type="text" value="ISBN:  ${ISBN }" class="myinput"
				style="background-color: #eff3f7;" readonly />
			<input type="text" value="Book name:  ${bookName }" class="myinput"
				style="background-color: #c2c8cc;" readonly />
			<input type="hidden" id="bookName" type="text" value="${bookName }" class="myinput"
				style="background-color: #c2c8cc;" readonly />
			<input type="text" value="Author:  ${author }" class="myinput"
				style="background-color: #eff3f7;" readonly />
			<input type="text" value="Publishing:  ${publishing }" class="myinput"
				style="background-color: #c2c8cc;" readonly />
			<input type="text" value="Location:  ${location }" class="myinput"
				style="background-color: #eff3f7;" id="location" readonly />
			<input type="text" value="Status:  ${status }" class="myinput"
				style="background-color: #c2c8cc;" id="status" readonly />
			<input type="text" value="Date of Storage:  ${dateOfStorage }" class="myinput"
				style="background-color: #eff3f7;" readonly />
			<input type="text" value="Tag1:  ${tag1 }" class="myinput"
				style="background-color: #c2c8cc;" readonly />
			<input type="text" value="Tag2:  ${tag2 }" class="myinput"
				style="background-color: #eff3f7;" readonly />
			<input type="text" value="Price:  ${price }" class="myinput"
				style="background-color: #c2c8cc;" readonly />
			<label class="mylabel">Introduction: </label>
			<input type="textarea" value="${introduction }" class="mytextarea" readonly/>
		</div>
		<script type="text/javascript">
			function addorder(){
				addurl="addOrder?barCode="+document.getElementById("barCode").value+"&bookName="+document.getElementById("bookName").value;
				alert("success!");
				location.href=addurl;
				location.reload(); 	
			}
		</script>
		<button onclick="addorder()">reserve</button>
<!-- 		<form action="addOrder"> -->
<!-- 			<input type="submit" value="reserve" -->
<!-- 				name="reserveBookInBookDetailPage" id="reserveBookInBookDetailPage" -->
<!-- 				style="position: relative; top: -230px"> -->
<!-- 		</form> -->
	</div>

</body>
</html>