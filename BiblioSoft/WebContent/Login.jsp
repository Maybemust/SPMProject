<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login</title>
<link rel="stylesheet" type="text/css" href="css/buttons.css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/backgroundShow.js"></script>
<script>
	      		function login(){
	      			
	      			var account=document.getElementById("useraccount").value;
	      			var pd=document.getElementById("userpassword").value;
	      			loginurl = "login?useraccount="+account+"&userpassword="+pd;
	      			if(account==""){
	      				alert("please input useraccount");
	      			}
	      			else{
	      				if(pd==""){
		      				alert("please input password");
	      				}
	      				else{
	      					
	    	      			document.getElementById("log").submit();
	    	      		}
	      			}			
	      		}
	      		
	      		function forgetpd(){
	      			
	      			
	      			var AUTHORITY =document.getElementById("AUTHORITY").value ;
	      		
	      			if(AUTHORITY == "Reader"){
	      			var st=prompt("Please input your account to reset password by email");
	      			var urlsend="sendemail?account="+st;
	      			window.location.href=urlsend;}
	      
	 
	      			else{
		      			var st=prompt("Please input your account to reset password ");
		      			var urlsend="modifypassword1?account="+st;
		      			window.location.href=urlsend;}
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
	width: 300px;
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
	width: 300px;
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
	width: 210px;
	height: 25px;
	box-shadow: 0 0 3px rgba(0, 0, 0, 0.4) inset;
	position: relative;
	left: 40px;
}

.myp {
	color: #000000;
	line-height: 5px;
	font-size: 20px;
	font-weight: 800;
	position: relative;
	left: 40px;
}

.myh1 {
	font-weight: bold;
	font-family: Microsoft YaHei;
	position: relative;
	left: 40px;
	bottom: 20px;
}
</style>
</head>

<body>





	<!-- 登录窗口      -->
	<div class="mydiv">
		<img src="images/logo2.png"
			style="width: 30%; height: 6%; position: relative; left: 200px; top: 5px;" />
		<div id="topbar"></div>
		<div id="middlecontainer">
			<div id="login">
				<div id="container1">
					<br />
					<h1 class="myh1">Log in</h1>
				</div>


<div>      <input type="hidden"  value='${AUTHORITY}' id="AUTHORITY"  name="AUTHORITY" > </div>


				<div id="container2">
					<form action="login" method="post" id="log">
						<div id="container2-1">
							<p class="myp">Account:</p>
						</div>
						<div id="container2-2">
							<input id="useraccount" name="useraccount" maxlength="14"
								type="text" class="myinput">
						</div>
						<div id="container2-3">
							<p class="myp" style="position: relative; top: 20px;">Password:</p>
						</div>
						<div id="container2-4">
							<input id="userpassword" name="userpassword" maxlength="14"
								type="password" class="myinput"
								style="position: relative; top: 20px;">
						</div>
					</form>
				</div>
				<div id="container3"
					style="position: relative; left: 52px; top: 40px;">
					<button style="padding: 0.7em 2em;"
						class="button button--round-s button--wayra button--border-medium button--text-thick button--size-l"
						type="button" onClick="login()">Login</button>
					<a
						style="position: relative; left: -10px; top: 15px; font-weight: bold; font-size: 12px;"
						onclick="forgetpd()">Forget</a>
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



<script type="text/javascript">


var mima='<%=request.getParameter("mima")%>';

if(mima=='no')
	{
	alert("your password is wrong");
	}







</script>
</html>
