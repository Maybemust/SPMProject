<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>modify password</title>
<link rel="stylesheet" rev="stylesheet" href="./css/style.css"
	type="text/css" media="all" />

<script type="text/javascript"
	src="http://lib.sinaapp.com/js/jquery/1.8.3/jquery.min.js"></script>


<script language="JavaScript" type="text/javascript">
function tishi()
{
  var a=confirm('数据库中保存有图书的基本信息，您可以修改或保留该信息。');
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




<% String question = request.getAttribute("question").toString(); %>


	<form action="modifypassword2" method="post" name="form">

		<div class="MainDiv">


			<table width="99%" border="0" cellpadding="0" cellspacing="0"
				class="CContent">

				<tr>
					<th class="tablestyle_title">Modify Password</th>
				</tr>

				<tr>
					<td class="CPanel">

						<table border="0" cellpadding="0" cellspacing="0"
							style="width: 100%">

							<TR>
								<TD width="100%">

									<fieldset style="height: 100%;">
										<legend>modify password</legend>
										<table border="0" cellpadding="2" cellspacing="1"
											style="width: 100%">

											<tr>

												<td nowrap align="right" width="15%">Security Question:</td>

												<td width="35%"><input type="text" name="question"
													  style="width: 154px" 
													value="<%=question %>"
													required
													oninvalid="setCustomValidity('The input cannot be empty');"
													oninput="setCustomValidity('');" /> <span class="red">*</span></td>


                                                 <td align="right">answer:</td>

										<td width="35%"><input type="text" name="answer"
													maxlength="200" style="width: 154px"
													required
													oninvalid="setCustomValidity('The input cannot be empty');"
													oninput="setCustomValidity('');" /> 
											
											</tr>


                                            <tr>
                                            <td nowrap align="right" width="15%">new password:</td>

												<td width="35%"><input type="password" name="password1"
												id="password1"
													maxlength="20" style="width: 154px" required
													oninvalid="setCustomValidity('The input cannot be empty');"
													oninput="setCustomValidity('');" />
                                            
                                            
                                            <td align="right">repeat password:</td>

												<td width="35%"><input type="password" name="password2"
												    id="password2"
													maxlength="20" style="width: 154px" required
													oninvalid="setCustomValidity('The input cannot be empty');"
													oninput="setCustomValidity('');" />
                                            
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
						type="submit" value="submit" class="button" onclick="checkpassword()"/>
						
						
						 <input type="button" value="back" class="button"
						onclick="history.go(-1)" /></TD>
                      
                    
				</TR>
			</TABLE>
			</td>
			</tr>

			</table>
		</div>
	</form>

	<script> 
 function checkpassword(){
	 var password1 = document.getElementById("password1").value;
	 var password2 = document.getElementById("password2").value;
	 if(password1 != password2){
		 alert("two passwords are not same");
		 window.location.href="modifypassword.jsp";
	 }
	 
 }
	
	
 
 
 var sc='<%=request.getParameter("sc")%>';
 if(sc=='no')
 	{
 	alert("question answer is wrong ");
 	}
 if(sc=='ok')
	{
	alert("modify successfully ");
	}
	
 
 
 
    </script>


</body>
</html>
