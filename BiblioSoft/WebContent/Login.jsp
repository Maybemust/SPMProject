<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>log in</title>
	<style>
		.btn-medium {
  			line-height: 30px;
  			width: 60px;
 			height: 30px;
  			font-size: 120%;
		}
	    .info {
       		background: #264DEE;
		  	box-shadow: 0px 5px #5f023f;
  			color: white;
		}

		.info:hover {
  			background:#38C4E3;
  			box-shadow: 0px 4px #3f002a;
  			color: white;
		}
		.info:active {
  			top: 4px;
  			box-shadow: 0px 0px #d3545d;
		}
		body{
			background-image: url(images/image-background.jpg);
			background-size: 100% 100%;
			background-attachment: fixed;
			background-repeat: no-repeat;
			height: 600px;
		}
		#topbar{
			position: relative;
			width: 100%;
			height:100px;
		}
		#middlecontainer{
			position: relative;
			width: 100%;
		}
		#login{
			border-radius: 12px;
			opacity: 0.5;
			height: 350px;
			background:#FFFFFF;
			position: relative;
			margin-left: 10%;
			margin-top: 70px;
			width: 30%;
		}
		#container1{
			position: relative;
			width: 30%;
			margin-left: 10%;
			height: 100px;
		}
		#container2{
			position: relative;
			width: auto;
			height: 150px;
		}
		#container2-1{
			margin-left: 10%;
			width: auto;
			height: 25px;
		}
		#container2-2{
			margin-left: 10%;
			width: auto;
			height: 25px;
		}
		#container2-3{
			margin-left: 10%;
			width: auto;
			height: 25px;
		}
		#container2-4{
			margin-left: 10%;
			width: auto;
			height: 25px;
		}
		#container3{
			position: relative;
			width: auto;
			height: 100px;
		}
		#bottombar{
			position: absolute;
			width: 100%;
			height: 100px;
			bottom: 0;
		}
	</style>
</head>

<body>
	<div id="topbar">
		
	</div>
	<div id="middlecontainer">
	  <div id="login">
		  <div id="container1">
			    <br/>
		     	<h1>Log in</h1>
	      </div>
	      <script>
	      		function login(){
	      			
	      			var account=document.getElementById("useraccount").value;
	      			var pd=document.getElementById("userpassword").value;
	      			loginurl = "login?account="+account+"&&password="+pd;
	      			if(account==""){
	      				alert("please input useraccount");
	      			}
	      			else{
	      				if(pd==""){
		      				alert("please input password");
	      				}
	      				else{
	      					alert(loginurl);
	    	      			window.location.href=loginurl;
	      				}
	      			}			
	      		}
	      </script>
		  <div id="container2">
			  <div id="container2-1"> <p>Account:</p> </div>
			  <div id="container2-2"> <input id="useraccount" maxlength="14" type="text"> </div>
			  <div id="container2-3"> <p>Password:</p> </div>
			  <div id="container2-4"> <input id="userpassword" maxlength="14" type="password"> </div>
		  </div>	
		  <div id="container3">
			  <button class="btn-medium info" style="margin-left: 10%;border-radius: 5px;" type="button" onClick="login()">Login</button>
			  <a style="position: relative;left: 10%" onclick="login()">SignUp</a>
		  </div>
	  </div>
	</div>
	<div id="bottombar">
	</div>
</body>
</html>
