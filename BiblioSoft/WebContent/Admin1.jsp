<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="css/buttons.css" />
<link rel="stylesheet" type="text/css" href="css/input.css" />
<link rel="stylesheet" type="text/css" href="css/password.css" />
<link href="css/bootstrap.css" rel="stylesheet" media="screen">
<script src="http://code.jquery.com/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/ajax.js"></script>
<!-- <link rel="stylesheet" type="text/css" href="css/jquery.fs.tipper.css"/> -->
<!-- <script src="js/jquery.fs.tipper.js"></script> -->
<link rel="stylesheet" href="css/bootstrap.min.css">
 

<style>
body {
	margin: 0;
	padding: 0;
	font-family: Lato, Helvetica, Arial, sans-serif;
	font-size: 14px;
	line-height: 1.772;
	color: #34495e;
	background-color: #fff;
}

.tipped { 
		display: block; 
		width: 40px;
	}
	
	.tipped :hover{
		box-shadow: 0 0 4px 1px rgba(255,255,255,0.4) inset;
	}
	
 	.myimg{ 
 		max-height: 40px; 
 		max-width: auto; 
 	} 
.wrap {
	min-width: 100%;
	position: absolute;
	background: #eff3f6 bottom;
	min-height: 100%;
	overflow: hidden;
}

.left {
	margin-left: 0px;
	position: absolute;
	box-sizing: border-box;
	width: 250px;
	height: 100%;
	background: #4D4D4D bottom;
}

.logoDiv {
	padding-top: 20px;
	padding-bottom: 20px;
	height: 70px;
	background-color: #383838;
	font-size: 17px;
	color: #fff;
	vertical-align: bottom;
}

.logoTitle {
	margin-left: 15px;
	line-height: 1.7;
}

.menu-title {
	margin-left: 15px;
	color: #828e9a;
	padding-top: 10px;
	padding-bottom: 10px;
	font-size: 14px;
	font-weight: bold;
}

.menu-item {
	padding-left: 15px;
	line-height: 40px;
	height: 40px;
	color: #aab1b7;
	cursor: pointer;
}

.menu-item-active {
	border-right: 4px solid #647f9d;
	color: #ffffcc;
}

.right {
	box-sizing: border-box;
	float: left;
	box-sizing: border-box;
	padding-left: 250px;
	overflow-y: overlay;
	overflow-x: hidden;
	clear: both;
	color: #717592;
	min-width: 100%;
	min-height: 500px;
}

.content {
	margin-left: 30px;
	margin-top: 80px;
}
</style>
<title>管理员页面首页</title>

</head>

<body>
	<div class="wrap">
		<!-- 左边导航栏-->

		<div id="left" class="left">
			<div id="logoDiv" class="logoDiv">
				<p id="logoTitle" class="logoTitle">
					<img id="logo" alt="picture-log" src="./imgs/logo.JPG"
						style="height: 28px; padding-right: 5px; vertical-align: middle;">
					<span style="font-size: 18px;">Admin</span>
				</p>
			</div>

			<div class="menu-item" data-toggle="collapse" data-target="#demo1"
				onmouseover="mouseover('div2')" onmouseout="mouseout('div2')"
				id="div2">operate for librarian</div>
			<div id="demo1" class="collapse" style="background-color: #666666">
				<div class="menu-item" href="#two" data-toggle="tab"
					onmouseover="mouseover('div3')" onmouseout="mouseout('div3')"
					id="div3">add librarian</div>
				<div class="menu-item" href="#three" data-toggle="tab"
					onmouseover="mouseover('div4');" onmouseout="mouseout('div4')"
					onClick="location.reload();" id="div4">search, view and
					delete librarian</div>
			</div>

			<div class="menu-item" data-toggle="collapse" data-target="#demo2"
				onmouseover="mouseover('div5')" onmouseout="mouseout('div5')"
				id="div5">change system parameters</div>
			<div id="demo2" class="collapse" style="background-color: #666666">
				<div class="menu-item" href="#four" data-toggle="tab"
					onmouseover="mouseover('div6')" onmouseout="mouseout('div6')"
					id="div6">maximum borrowing volume</div>
				<div class="menu-item" href="#five" data-toggle="tab"
					onmouseover="mouseover('div7')" onmouseout="mouseout('div7')"
					id="div7">fine strategy</div>
				<div class="menu-item" href="#six" data-toggle="tab"
					onmouseover="mouseover('div8')" onmouseout="mouseout('div8')"
					id="div8">cash pledge</div>
				<div class="menu-item" href="#seven" data-toggle="tab"
					onmouseover="mouseover('div9')" onmouseout="mouseout('div9')"
					id="div9">reservation</div>
				<div class="menu-item" href="#eight" data-toggle="tab"
					onmouseover="mouseover('div10')" onmouseout="mouseout('div10')"
					id="div10">modify Admin's password</div>
			</div>


		</div>
		<a href="LogOutServlet" style="position: relative;left:200px;top:15px;" class="tipped" ><img src="images/quit_img.png" class="myimg"/></a>
		
		<!-- 添加导航栏所链接的内容-->
		<div id="right" class="tab-content right">

			<div id="two" class="tab-pane">

				<div class="content">
					<form action="">
						<p>account &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*a
							string of no more than 15 digits*</p>

						<input type="text" id="account" name="account"
							onkeyup="this.value=this.value.replace(/\D/g,'');"
							onafterpaste="this.value=this.value.replace(/\D/g,'')"
							maxlength="15"> <label style="color: red;"
							name="accountsame" id="accountsame"></label>
						<p>The default password is 001001</p>
						
						<button type="button" name="register" id="register"
							onClick="addLibrarian('account')">Register</button>
					</form>
				</div>
			</div>

			<div id="three" class="tab-pane active">
				<div class="content">
					<form action="admin1" method="post">
						<input type="text" name="searchLibrarian"
							style="font-weight: bold; font-size: 18px; width: 400px"
							placeholder="Enter the librarian you are searching for"
							onkeyup="this.value=this.value.replace(/\D/g,'')"
							onafterpaste="this.value=this.value.replace(/\D/g,'')"
							maxlength="15"> <input type="submit" name="search"
							value="search"> <a href="admin1">SHOW ALL</a>
					</form>
					<br> <br>
					<table border="1">
						<tr>
							<td style="width: 300px;">account</td>
							<td style="width: 100px;">view</td>
							<td style="width: 100px;">delete</td>
						</tr>
						<c:forEach items="${librarians}" var="librarian" varStatus="st">
							<tr>
								<td>${librarian.account}</td>
								<td>
									<form action="admin2" method="post">
										<input type="hidden" value="${librarian.account}"
											name="account"> <input type="hidden"
											value="${librarian.question}" name="question"> <input
											type="submit" value="view">
									</form>
								</td>
								<td>
									<form action="admin1" method="post">
										<input type="hidden" value="${librarian.account}"
											name="deleteaccount"> <input type="submit"
											name="delete" value="delete">
									</form>
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>



			<div id="four" class="tab-pane">
				<div
					style="width: 400px; position: relative; top: 100px; left: 100px">
					<form action="">
						<input style="width: 400px" required="" required
							oninvalid="setCustomValidity('Can not be empty')" type="text"
							id="number" name="number"
							onkeyup="this.value=this.value.replace(/\D/g,'')"
							onafterpaste="this.value=this.value.replace(/\D/g,'')"
							maxlength="2"> <label
							style="font-weight: bold; font-size: 18px"
							alt="current maximum number: ${borrowedMaxinum}"
							placeholder="maximum number" id="numberlabel" name="numberlabel"></label>
						<p style="position: relative; top: 0px">&nbsp;&nbsp;&nbsp;&nbsp;*a
							string of no more than 2 digits*</p>
						<button type="button"
							style="position: relative; left: 80px; bottom: 10px"
							class="button button--round-s button--ujarak button--border-thin button--text-thick"
							onClick="sendtext('number','numberlabel')">Modify</button>
					</form>
				</div>
			</div>

			<div id="five" class="tab-pane">
				<div
					style="width: 400px; position: relative; top: 100px; left: 100px">
					<form action="">
						<input style="width: 400px" required="" required
							oninvalid="setCustomValidity('Can not be empty')" type="text"
							id="fineStrategy" name="fineStrategy" maxlength="7"
							onkeyup="value=value.replace(/[^\d||/.]/g,'')"
							onbeforepaste="this.val(this.val().replace(/[^\d||/.]/g,''))">
						<label style="font-weight: bold; font-size: 18px"
							alt="current fine strategy: ${fine}" placeholder="fine strategy"
							id="finelabel" name="finelabel"></label>
						<p style="position: relative; top: 0px">&nbsp;&nbsp;&nbsp;&nbsp;*the fine that a reader will pay for each book per day*</p>
							<p>&nbsp;&nbsp;&nbsp;&nbsp;*a
							decimal less than 1000*</p>
						<button type="button"
							style="position: relative; left: 400px; bottom: 130px"
							class="button button--round-s button--ujarak button--border-thin button--text-thick"
							onClick="sendtext('fineStrategy','finelabel')">Modify</button>
						<input style="width: 400px" required="" required
							oninvalid="setCustomValidity('Can not be empty')" type="text"
							id="fineLimitTime" name="fineLimitTime"
							onkeyup="this.value=this.value.replace(/\D/g,'')"
							onafterpaste="this.value=this.value.replace(/\D/g,'')"
							maxlength="5"> <label
							style="font-weight: bold; font-size: 18px"
							alt="current fine limit time: ${fineTime}"
							placeholder="fine limit time" id="fineLimitTimeLabel"
							name="fineLimitTimeLabel"></label>
						<p style="position: relative; top: 0px">&nbsp;&nbsp;&nbsp;&nbsp;*a
							string of no more than 5 digits*</p>
						<button type="button"
							style="position: relative; left: 400px; bottom: 100px"
							class="button button--round-s button--ujarak button--border-thin button--text-thick"
							onClick="sendtext('fineLimitTime','fineLimitTimeLabel')">Modify</button>
					</form>
				</div>
			</div>

			<div id="six" class="tab-pane">
				<div
					style="width: 400px; position: relative; top: 100px; left: 100px">
					<form action="">
						<input style="width: 400px" required="" required
							oninvalid="setCustomValidity('Can not be empty')" type="text"
							id="cashPledge" name="cashPledge" maxlength="7"
							onkeyup="value=value.replace(/[^\d||/.]/g,'')"
							onbeforepaste="this.val(this.val().replace(/[^\d||/.]/g,''))">
						<label style="font-weight: bold; font-size: 18px"
							alt="current pledge: ${cash}" placeholder="cash pledge"
							id="cashlabel" name="cashlabel"></label>
						<p style="position: relative; top: 0px">&nbsp;&nbsp;&nbsp;&nbsp;*a
							decimal less than 1000*</p>
						<button type="button"
							style="position: relative; left: 80px; bottom: 10px"
							class="button button--round-s button--ujarak button--border-thin button--text-thick"
							onClick="sendtext('cashPledge','cashlabel')">Modify</button>
					</form>
				</div>
			</div>

			<div id="seven" class="tab-pane">
				<div
					style="width: 400px; position: relative; top: 100px; left: 100px">
					<form action="">
						<input style="width: 400px" required="" required
							oninvalid="setCustomValidity('Can not be empty')" type="text"
							id="reservedMaxinum" name="reservedMaxinum"
							onkeyup="this.value=this.value.replace(/\D/g,'')"
							onafterpaste="this.value=this.value.replace(/\D/g,'')"
							maxlength="2"> <label
							style="font-weight: bold; font-size: 18px"
							alt="current reserved maxinum: ${reservedmaxinum}"
							placeholder="reserved maxinum" id="reservedMaxinumLabel"
							name="reservedMaxinumLabel"></label>
						<p style="position: relative; top: 0px">&nbsp;&nbsp;&nbsp;&nbsp;*a
							string of no more than 2 digits*</p>
						<button type="button"
							style="position: relative; left: 400px; bottom: 100px"
							class="button button--round-s button--ujarak button--border-thin button--text-thick"
							onClick="sendtext('reservedMaxinum','reservedMaxinumLabel')">Modify</button>
						<input style="width: 400px" required="" required
							oninvalid="setCustomValidity('Can not be empty')" type="text"
							id="reservedTime" name="reservedTime"
							onkeyup="this.value=this.value.replace(/\D/g,'')"
							onafterpaste="this.value=this.value.replace(/\D/g,'')"
							maxlength="3"> <label
							style="font-weight: bold; font-size: 18px"
							alt="current reserved time: ${reservedtime}"
							placeholder="reserved time" id="reservedTimeLabel"
							name="reservedTimeLabel"></label>
						<p style="position: relative; top: 0px">&nbsp;&nbsp;&nbsp;&nbsp;*a
							string of no more than 3 digits*</p>
						<button type="button"
							style="position: relative; left: 400px; bottom: 100px"
							class="button button--round-s button--ujarak button--border-thin button--text-thick"
							onClick="sendtext('reservedTime','reservedTimeLabel')">Modify</button>
					</form>
				</div>
			</div>
			<div id="eight" class="tab-pane">
				<div class="content">
					<form action="">
						<p>old password</p>
						<input type="text" id="modifyadminoldpassword"
							name="modifyadminoldpassword" maxlength="15"> <label
							style="color: red;" name="adminoldpassword" id="adminoldpassword"></label>
						<p>new password &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*a string
							of no more than 20 characters*</p>
						<input type="password" id="modifyadminnewpassword"
							name="modifyadminnewpassword" maxlength="20">
						<p>repeat password</p>
						<input type="password" id="modifyadminrepeatpassword"
							name="modifyadminrepeatpassword" maxlength="20"> <br>
						<br>
						<button type="button" name="adminrepeatpassword"
							id="adminrepeatpassword"
							onClick="modifyAdminPassword('modifyadminoldpassword', 'modifyadminnewpassword', 'modifyadminrepeatpassword')">Modify</button>
					</form>
				</div>
			</div>
		</div>
	</div>

</body>
<script>
	$(function() {
		$(".menu-item").click(function() {
			$(".menu-item").removeClass("menu-item-active");
			$(this).addClass("menu-item-active");
			var itmeObj = $(".menu-item").find("img");
			itmeObj.each(function() {
				var items = $(this).attr("src");
				items = items.replace("_grey.png", ".png");
				items = items.replace(".png", "_grey.png")
				$(this).attr("src", items);
			});
			var attrObj = $(this).find("img").attr("src");
			;
			attrObj = attrObj.replace("_grey.png", ".png");
			$(this).find("img").attr("src", attrObj);
		});
	});
	function changeFrameHeight() {
		var ifm = document.getElementById("fourIfm");
		ifm.height = document.documentElement.clientHeight;
	}
	window.onresize = function() {
		changeFrameHeight();
	}
	function addcheck() {
		var account = document.getElementById("account").value;
		var password = document.getElementById("password").value;
		var repeatPassword = document.getElementById("repeatPassword").value;
		if (account == "") {
			alert("用户名不能为空!");
			document.getElementById("account").focus();
			return false;
		}
		if (password == "") {
			alert("密码不能为空!");
			document.getElementById("password").focus();
			return false;
		}
		if (password != repeatPassword) {
			alert("两次输入密码不相同!");
			document.getElementById("repeatPassword").focus();
			return false;
		}
	}

	function mouseover(divname) {
		var color = document.getElementById(divname);
		color.style.color = "#FFFFFF";
	}
	function mouseout(divname) {
		//if($("#"+divname).prop("className") == "menu-item"){
		var color = document.getElementById(divname);
		color.style.color = "#aab1b7";
		//}
	}


</script>
</html>