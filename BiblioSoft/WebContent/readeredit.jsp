<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>reader edit</title>
<link rel="stylesheet" rev="stylesheet" href="./css/style.css"
	type="text/css" media="all" />


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


	<% String account1=request.getParameter("account1");  %>
	<% String password=request.getParameter("password");  %>
	<% String phone=request.getParameter("phone");  %>
	<% String email=request.getParameter("email");  %>
	<% String fine=request.getParameter("fine");  %>
	<% String borrowedNum=request.getParameter("borrowedNum");  %>
	<% String cashPledge=request.getParameter("cashPledge");  %>
	<% String tag=request.getParameter("tag");  %>



	<form action="readeredit" method="post" name="form">
		<div class="MainDiv">
			<table width="99%" border="0" cellpadding="0" cellspacing="0"
				class="CContent">
				<tr>
					<th class="tablestyle_title">Edit reader</th>
				</tr>
				<tr>
					<td class="CPanel">

						<table border="0" cellpadding="0" cellspacing="0"
							style="width: 100%">

							<TR>
								<TD width="100%">

									<fieldset style="height: 100%;">
										<legend>reader information</legend>
										<table border="0" cellpadding="2" cellspacing="1"
											style="width: 100%">

											<tr>

												<td nowrap align="right" width="15%">account:</td>




												<td width="35%"><input name='account' type="text"
													class="text" style="width: 154px" value="<%=account1 %>"
													readonly="readonly" /> <span class="red">*</span></td>

												<td width="16%" align="right" nowrap="nowrap">password:</td>

												<td width="34%"><input class="text" name="password"
													maxlength="15" type="password" id="password"
													style="width: 154px" value="<%=password %>"></td>

											</tr>

											<tr>

												<td nowrap align="right" width="15%"></td>

												<td width="35%">&nbsp;</td>

												<td width="16%" align="right" nowrap="nowrap">confirm
													password:</td>

												<td width="34%"><input class="text" name="password2"
													maxlength="15" type="password" id="password2"
													style="width: 154px" value="<%=password %>" onkeyup="validate()"></td>
													
												<span id="jianyan" style="display: block; padding-left: 66%"></span>


											</tr>



											<tr>
												<td align="right">email:</td>
												<td><input class="text" name="email" type="email"
													maxlength="20" style="width: 154px"
													oninvalid="this.setCustomValidity('Please enter the correct format for your mailbox');"
													value="<%=email %>" /></td>
												<td align="right">phone:</td>
												<td><input class="text" name="phone" maxlength="11"
													style="width: 154px" value="<%=phone %>"
													onkeyup="this.value=this.value.replace(/\D/g,'')"
													onafterpaste="this.value=this.value.replace(/\D/g,'')"
												
													
													
													 /></td>
												
											</tr>



											<tr>
												

												<td align="right">cash pledge:</td>
												<td><input type="number" name="cashPledge"
													style="width: 154px" value="<%=cashPledge %>" step="0.1"
													required
													oninvalid="setCustomValidity('please input correctlly');"
													oninput="setCustomValidity('');"
													onblur="if (!/^\d+(\.\d+)?$/.test(this.value)){this.value='';}"></td>


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
						type="submit" value="save" class="button" /> <input
						type="button" value="back" class="button"
						onclick="window.location.href='readerList'" /></TD>
				</TR>
			</TABLE>


			</td>
			</tr>

			</table>
		</div>
	</form>



	<script> 
    var errory1='<%=request.getParameter("error")%>';
    var mima='<%=request.getParameter("mima")%>';
    if(errory1=='yes')
    	{
    	alert("not find reader");
    	}
    	else
        	if(errory1=='no')
        	{
        	alert("successfully edit");
        	}
   
    if(mima=='no')
    	{

    	alert("Two password entries are different");
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

