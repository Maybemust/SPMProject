<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>reader add</title>
<link rel="stylesheet" rev="stylesheet" href="./css/style.css"
	type="text/css" media="all" />


<script language="JavaScript" type="text/javascript">
function tishi()
{
  var a=confirm('数据库中保存有该人员基本信息，您可以修改或保留该信息。');
  if(a!=true)return false;
  window.open("冲突页.htm","","depended=0,alwaysRaised=1,width=800,height=400,location=0,menubar=0,resizable=0,scrollbars=0,status=0,toolbar=0");
}

function check()
{
document.getElementById("aa").style.display="";
}

</script>
<style type="text/css">
<!--
.atten {
	font-size: 12px;
	font-weight: normal;
	color: #F00;
}
-->
</style>
</head>

<body class="ContentBody">



	<form action="readeradd" method="post" name="form">

		<div class="MainDiv">


			<table width="99%" border="0" cellpadding="0" cellspacing="0"
				class="CContent">

				<tr>
					<th class="tablestyle_title">Add reader</th>
				</tr>

				<tr>
					<td class="CPanel">

						<table border="0" cellpadding="0" cellspacing="0"
							style="width: 100%">



							<TR>
								<TD width="100%">

									<fieldset style="height: 100%;">
										<legend>read register</legend>
										<table border="0" cellpadding="2" cellspacing="1"
											style="width: 100%">

											<tr>

												<td nowrap align="right" width="15%">phone:</td>

												<td width="35%"><input type="text" name="phone"
													maxlength="11" style="width: 154px"
													onkeyup="this.value=this.value.replace(/\D/g,'')"
													onafterpaste="this.value=this.value.replace(/\D/g,'')"
													value="" required
													oninvalid="setCustomValidity('The input cannot be empty');"
													oninput="setCustomValidity('');" /> <span class="red">*</span></td>


											</tr>


											<tr>
												<td align="right">email:</td>
												<td><input type="email" name="email" maxlength="20"
													style="width: 154px"
													oninvalid="this.setCustomValidity('Please enter the correct format for your mailbox');"
													value="" /></td>


											</tr>


										</table>
										<br />
									</fieldset>

								</TD>
							</TR>
						</TABLE>
					</td>
				</tr>

				<TR>
					<TD colspan="2" align="center" height="50px"><input
						type="submit" value="save" class="button" /> <input type="button"
						value="back" class="button"
						onclick="window.location.href='readerList'" /></TD>

				</TR>
			</TABLE>
			</td>
			</tr>

			</table>
		</div>
	</form>

	<script> 
    var errory='<%=request.getParameter("error")%>';
    if(errory=='yes')
    	{
    	alert("account has existed");
    	}
    else
    	if(errory=='no')
    	{
    	alert("successfully add");
    	}
   
    
    
    function validate()
    {
    	 var pwd1 = document.getElementById("password").value;
         var pwd2 = document.getElementById("password2").value;
         if(pwd1 == pwd2) {
             document.getElementById("jianyan").innerHTML="<font color='green'>The same password twice</font>";
             document.getElementById("button").disabled = false;
         }
         else {
             document.getElementById("jianyan").innerHTML="<font color='red'>Two passwords are different</font>";
           document.getElementById("button").disabled = true;
         }
    	
    }
    </script>

</body>
</html>
