<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.text.*" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="./css/bootstrap.css" rel="stylesheet" media="screen"> 
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/bootstrap-table.css">
<script src="http://code.jquery.com/jquery.js"></script>
<script src="./js/bootstrap.min.js"></script>
<script src="./js/bootstrap-table.js"></script>
<script src="./js/bootstrap-table-zh-CN.js"></script>
<link href="./css/buttons-xiang.css" rel="stylesheet" media="screen">
<title>ChangePassword</title>
<style>
		#pm-head{
			margin-left: 400px;
			width: auto;
			height: 50px;
		}
		#ps-container{
			width: 1400px;
			height: 900px;
		}
		#ps-security{
			margin-left: 200px;
			margin-top: 100px;
		}
		#oldPasswordInput{
			width: 300px;
			height: 30px;
			border-radius: 7px;
		}
		#newPasswordInput{
			width: 300px;
			height: 30px;
			border-radius: 7px;
		}
		#newPasswordInputAgain{
			width: 300px;
			height: 30px;
			border-radius: 7px;
		}
</style>
</head>
<script>
	function load(sta){
		if(sta != "")
			alert(sta);
	}
</script>
<body onload="load('${status}')">
 	<script>
  	 function changePassword(){
     	var oldPassword = document.getElementById("oldPasswordInput").value;
        var newPassword = document.getElementById("newPasswordInput").value;
        var newPasswordAgain = document.getElementById("newPasswordInputAgain").value;
                        
        if(oldPassword==""){
        	alert("old password can't be null");
        }
        else
        	{
            	if(newPassword == ""||newPassword == " ")
                alert("new password can't be null");
            else
            	{
                	if(newPasswordAgain == "")
                    alert("please input new password again");
            		else
                    	{
                      		if(newPassword==newPasswordAgain){
                            	if(confirm("Are you sure to change the password?"))
                          			document.getElementById("changepd").submit();
								}
                            	else
                            		alert("the two input password is inconsistent.");
                        }
                 }
                            				                            	
           	}
         }
 	</script>
	<div id="ps-container" class="tab-pane">
		<div style="width: auto;height: 8px"></div>
		<div id="pm-head">
  			<h3 style="text-indent: 5%">Personal Security</h3>
		</div>
		<hr style="color: black">
		<form method="post" action="changePassword" id="changepd">
			<div id="ps-security">
				<p>Old Password:(Please do not enter Spaces)
				<input id="oldPasswordInput" name="OldPassword" onkeyup="this.value=this.value.replace(/^ +| +$/g,'')" class="form-control" placeholder="please input your old password" type="password" maxlength="16">
				</p>
				<br/>
				<p>New Password:(Please do not enter Spaces)
				<input id="newPasswordInput" name="NewPassword" onkeyup="this.value=this.value.replace(/^ +| +$/g,'')" class="form-control" placeholder="please input your new password" type="password" maxlength="16">
				</p>
				<br/>
				<p>New Password Input Again:(Please do not enter Spaces)
				<input id="newPasswordInputAgain" name="NewPasswordAgain" onkeyup="this.value=this.value.replace(/^ +| +$/g,'')" placeholder="please input your new password again" class="form-control" type="password" maxlength="16">
				</p>
				<br/>
				<button id="cleanImformation" style="margin-left:100px;" class="btn btn-primary btn-info" onclick="changePassword()">sumbit</button>
				</div>
			</form>
	</div>
</body>
</html>