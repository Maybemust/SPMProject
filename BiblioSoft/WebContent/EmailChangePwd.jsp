<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="java.text.*"%>
<!doctype html>
<html>
<head>


<meta charset="utf-8">
<title>version2.0</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="./css/bootstrap.css" rel="stylesheet" media="screen">
<script src="./js/bootstrap.min.js"></script>
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/bootstrap-table.css">
<script src="http://code.jquery.com/jquery.js"></script>
<script src="./js/bootstrap.min.js"></script>
<script src="./js/bootstrap-table.js"></script>
<script src="./js/bootstrap-table-zh-CN.js"></script>
<link href="./css/buttons-xiang.css" rel="stylesheet" media="screen">

<style>
<!--
diao style--> <style type ="text/css">#myorder {
	margin-left: 100px;
	margin-right: 200px;
	margin-top: 50px;
}

#addorder {
	margin-left: 100px;
	margin-top: 50px;
}

#ordertab {
	border-collapse: collapse;
	margin: 0 auto;
}

#ordertab td {
	border: 1px solid #cad9ea;
	color: #666;
	height: 30px;
}

#ordertab th {
	border: 1px solid #cad9ea;
	color: #666;
	height: 30px;
}

#ordertab thead th {
	background-color: #CCE8EB;
	width: 100px;
}

#ordertab tr:nth-child(odd) {
	background: #fff;
}

#ordertab tr:nth-child(even) {
	background: #F5FAFA;
}
</style>
</head>
<body>

	<script type="text/javascript">
                            function changePassword(){
                            	var oldPassword = document.getElementById("oldPasswordInput").value;
                            	var newPassword = document.getElementById("newPasswordInput").value;
                            	var newPasswordAgain = document.getElementById("newPasswordInputAgain").value;
                            	if(oldPassword == "")
                            		alert("old password can't be null");
                            	else
                            		if(newPassword == "")
                            			alert("new password can't be null");
                            		else
                            			if(newPasswordAgain == "")
                            				alert("please input new password again");
                            			else
                            				{
                            				   if(newPassword == newPasswordAgain){
                            					   if(confirm("Are you sure to cahnge the password?")){
                          					  		 document.getElementById("account").submit();
                          					  		 document.getElementById("pd").submit();
                          					       }   
                            				   }
                            				   else
                            					   alert("the two input password is inconsistent.");
                            				}
                            	alert("passwordJudge");
                            }
                        </script>
	<div id="ps-container" class="tab-pane">
		<div style="width: auto; height: 8px"></div>
		<div id="pm-head">
			<h3 style="text-indent: 5%">Personal Security</h3>
		</div>
		<hr style="color: black">
		<form method="post" action="emailchangepd">
			<div id="ps-security">
				<p>
					Account: <input id="account" name="account" class="form-control"
						placeholder="please input your account" type="text"
						readonly="true" maxlength="16" value="${account }">
				</p>
				</br>
				<p>
					NewPassword: <input id="pd" name="pd" class="form-control"
						placeholder="please input your new password" type="password"
						maxlength="16">
				</p>
				</br>
				<p>
					NewPasswordInputAgain:<input id="newPasswordInputAgain"
						name="NewPasswordAgain"
						placeholder="please input your new password again"
						class="form-control" type="password" maxlength="16">
				</p>
				</br>
				<button id="cleanImformation" style="margin-left: 100px;"
					class="btn btn-primary btn-info" onclick="changePassword">sumbit</button>
			</div>
		</form>
	</div>
	<!-- xiang -->


</body>
</html>