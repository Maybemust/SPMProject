<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=uft-8">
<title>Modify librarian's password</title>
</head>
<style>
.main{
    background-color: #EBEBEB;
    border-radius: 20px;
    width: 300px;
    height: 200px;
    margin: auto;
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    border:5px solid #000;
    
}

</style>
<body style="background-color:#FFFFFF">
	<div class="main">
	<form action="admin1" method="post">
		<div>
			<p style="position:relative;left:20px;top:20px">account: ${account}</p>
			<input type="hidden" value="${account}" name="modifiedaccount" style="position:relative;top:-15px;left:90px">
		</div>
		<div>
			<p style="position:relative;left:20px;top:10px"">password:</p>
			<input type="text" value="${password}" id="modifiedpassword" name="modifiedpassword" style="position:relative;top:-25px;left:90px" maxlength="20">
		</div>
		<input type="submit" value="save" style="position:relative;left:75px" onclick="check()">
		<input type="button" onclick="history.go(-1)" value="back" style="position:relative;left:125px">
		</form>
	</div>
	<script>
function check(){
	var password=document.getElementById("modifiedpassword").value;
	if(password==""){
    				alert("Password can not be blank!");
    				 document.getElementById("modifiedpassword").focus();
    				 return false;
    			}
}

// function checkLength(){
//  var str = document.getElementById("modifiedpassword").value;
//  var i,sum;
//   sum=0;
//   for(i=0;i<str.length;i++)
//   {
//        if ((str.charCodeAt(i)>=0) && (str.charCodeAt(i)<=255))
//             sum=sum+1;
//        else
//             sum=sum+2;
//   }
//   if(sum<=20){
//  	 return true;
//   } else{
//  	 alert("Your input is too long");
//  	 return false;
//   }
// }
</script>
</body>
</html>