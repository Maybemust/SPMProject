<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Security Question</title>
<link rel="stylesheet" type="text/css" href="css/buttons.css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/backgroundShow.js"></script>
<script>
	function ok(){
	      			
		var account=document.getElementById("account").value;
		var question=document.getElementById("question").value;
		var answer=document.getElementById("answer").value;
		
		if(question == ""){
			alert("please input security question");
		}else{
			if(answer == ""){
				alert("please input answer");
			}else{
				document.getElementById("questionForm").submit();
			}
		}			
	}
	
</script>

<style type="text/css">
.d1 {
	width: 100%;
	height: 100%;
	display: block;
	position: absolute;
	left: 0px;
	top: 0px;
}

.bg {
	width: 565px;
	height: 400px;
	background: inherit;
	position: absolute;
	left: 0;
	top: 0;
	bottom: 0;
	right: 0;
	margin: auto;
}

.bg:after {
	content: "";
	width: 100%;
	height: 100%;
	position: absolute;
	left: 0;
	top: 0;
	background: inherit;
	filter: blur(15px) opacity(97%);
	z-index: 11;
}

.mydiv {
	border-radius: 8px;
	background-color: rgba(200, 200, 200, 0.13);
	width: 565px;
	height: 400px;
	position: absolute;
	left: 0;
	top: 0;
	bottom: 0;
	right: 0;
	margin: auto;
	z-index: 99;
}

.myinput {
	font-weight: bold;
	background-color: rgba(200, 200, 200, 0);
	border-style: solid;
	border-width: 2px;
	border-color: rgba(0, 0, 0, 0.8);
	border-radius: 4px;
	width: 400px;
	height: 25px;
	box-shadow: 0 0 3px rgba(0, 0, 0, 0.4) inset;
	position: relative;
	left: 80px;
}

.myinputreadonly {
	font-weight: bold;
	font-family: Microsoft YaHei;
	font-size: 30px;
	background-color: rgba(200, 200, 200, 0);
	border: none;
	width: 450px;
	height: 30px;
	position: relative;
	left: 80px;
}
	
.myp {
	color: #000000;
	line-height: 5px;
	font-size: 20px;
	font-weight: 800;
	position: relative;
	left: 80px;
}

.myh1 {

	font-weight: bold;
	font-family: Microsoft YaHei;
	position: relative;
	left: 80px;
	top: 26px;
}
</style>
</head>

<body>

	<!-- 密保窗口      -->
	<div class="mydiv">
		<img src="images/logo2.png"
			style="max-height: 26px; max-width: auto; position: relative; left: 450px; top: 5px;" />
		<div id="topbar"></div>
		<div id="middlecontainer">
			<div id="login">
				<div id="container1">
					<br />
					<h2 class="myh1">Please Set Your Security Question</h1>
				</div>

				<div id="container2">
					<form action="modifyQuestion" method="post" id="questionForm">

						<div id="container2-1">
							<p class="myp" style="position: relative; top: 30px;">Question:</p>
						</div>
						<div id="container2-2">
							<input id="question" name="question" maxlength="200"
								type="text" class="myinput"
								style="position: relative; top: 30px;">
						</div>
						<div id="container2-3">
							<p class="myp" style="position: relative; top: 40px;">Answer:</p>
						</div>
						<div id="container2-4">
							<input id="answer" name="answer" maxlength="200"
								type="text" class="myinput"
								style="position: relative; top: 40px;">
						</div>
						<div id="container2-5">
							<label style="font-weight: bold; font-family: Microsoft YaHei; font-size: 30px; position: relative; left: 80px; bottom: 200px;">Hello, </label>
							<input id="account" name="account"
								type="text" class="myinputreadonly" value="${account}" style="bottom: 200px;" readonly>
							<label style="font-weight: bold; font-family: Microsoft YaHei; font-size: 30px;  position: relative; bottom: 200px;">!</label>
						</div>
					</form>
				</div>
				<div id="container3"
					style="position: relative; left: 90px; top: 25px;">
					<button style="padding: 0.7em 2em;"
						class="button button--round-s button--wayra button--border-medium button--text-thick button--size-l"
						type="button" onClick="ok()">OK</button>
					<button style="padding: 0.7em 2em;"
						class="button button--round-s button--wayra button--border-medium button--text-thick button--size-l"
						type="button" onClick="history.go(-1)">Cancel</button>
				</div>

			</div>
		</div>
		<div id="bottombar"></div>
	</div>

	<!--  背景     -->
	<div id="banner"
		style="width: 100%; height: 100%; margin: 0; padding: 0;">
		<div class="d1"
			style="background-image: url(images/back_1.jpg); background-attachment: fixed; background-repeat: no-repeat; background-size: cover;">
			<div class="bg"></div>
		</div>
		<div class="d1"
			style="background-image: url(images/back_2.jpg); background-attachment: fixed; background-repeat: no-repeat; background-size: cover;">
			<div class="bg"></div>
		</div>
		<div class="d1"
			style="background-image: url(images/back_3.jpg); background-attachment: fixed; background-repeat: no-repeat; background-size: cover;">
			<div class="bg"></div>
		</div>
		<div class="d1"
			style="background-image: url(images/back_4.jpg); background-attachment: fixed; background-repeat: no-repeat; background-size: cover;">
			<div class="bg"></div>
		</div>
	</div>
	<script type="text/javascript">banner()</script>
</body>
</html>
