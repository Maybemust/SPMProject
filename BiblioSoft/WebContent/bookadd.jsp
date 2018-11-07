<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>add book</title>
<link rel="stylesheet" rev="stylesheet" href="./css/style.css"
	type="text/css" media="all" />

<script type="text/JavaScript" src="../check.js"></script>
<script type="text/javascript"
	src="http://lib.sinaapp.com/js/jquery/1.8.3/jquery.min.js"></script>


<script language="JavaScript" type="text/javascript">
function tishi()
{
  var a=confirm('the database has stored the information of the book, you can change or remain the information!');
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




	<form action="bookadd" method="post" name="form">

		<div class="MainDiv">


			<table width="99%" border="0" cellpadding="0" cellspacing="0"
				class="CContent">

				<tr>
					<th class="tablestyle_title">Add book</th>
				</tr>

				<tr>
					<td class="CPanel">

						<table border="0" cellpadding="0" cellspacing="0"
							style="width: 100%">

							<TR>
								<TD width="100%">

									<fieldset style="height: 100%;">
										<legend>add book</legend>
										<table border="0" cellpadding="2" cellspacing="1"
											style="width: 100%">

											<tr>

												<td nowrap align="right" width="15%">ISBN:</td>

												<td width="35%"><input type="text" name="ISBN"
													maxlength="15" style="width: 154px" required
													oninvalid="setCustomValidity('The input cannot be empty');"
													oninput="setCustomValidity('');" /> <span class="red">*</span></td>

												<td width="16%" align="right" nowrap="nowrap">author:</td>

												<td width="34%"><input name="author" maxlength="30"
													type="text" style="width: 154px" required
													oninvalid="setCustomValidity('The input cannot be empty');"
													oninput="setCustomValidity('');" /></td>


											</tr>

											<tr>

												<td nowrap align="right" width="15%">publishing:</td>

												<td width="35%"><input type="text" name="publishing"
													maxlength="35" style="width: 154px" required
													oninvalid="setCustomValidity('The input cannot be empty');"
													oninput="setCustomValidity('');" /></td>

												<td width="16%" align="right" nowrap="nowrap">location:</td>

												<td><select name="location">
														<option selected="selected1">==none==</option>
														<c:forEach items="${locations }" var="location" varStatus="count">
														<option>${location.location }</option>
													</c:forEach>
														
												</select></td>


											</tr>


							
											<tr>

												<td align="right">tag1</td>

												<td><select name="tag1">
														<option selected="selected1">==none==</option>
														<c:forEach items="${labels }" var="label" varStatus="count">
														<option>${label.name }</option>
													</c:forEach>
														
												</select></td>
												<td align="right">tag2</td>

												<td><select name="tag2">
													<option selected="selected1">==none==</option>
													<c:forEach items="${labels }" var="label" varStatus="count">
														<option>${label.name }</option>
													</c:forEach>																		
												</select></td>
											</tr> 

											<tr>
												<td align="right">cover:</td>
												<td><!-- <input type="button" name="cover"
													style="width: 154px" value="upload" /> -->
													
													  <!-- <input type="file" name="fj" id="fj" />  --> 
													  
                    					<input type="file" id="file_input" name="fj" >
						
                
                    
                    
         

												<td width="16%" align="right" nowrap="nowrap">book name:</td>

												<td width="34%"><input type="text" name="bookName"
													maxlength="15" style="width: 154px" required
													oninvalid="setCustomValidity('The input cannot be empty');"
													oninput="setCustomValidity('');"></td>
											</tr>

											<tr>
												            <td align="right">number:</td>

										<td width="35%"><input type="text" name="number"
													maxlength="2" style="width: 154px"
													onkeyup="this.value=this.value.replace(/\D/g,'')"
													onafterpaste="this.value=this.value.replace(/\D/g,'')"
													onBlur="this.value=parseInt(this.value);if (isNaN(this.value) || this.value<=0){alert('input moren than 0');this.focus();};"
													
													
													value="" required
													oninvalid="setCustomValidity('The input cannot be empty');"
													oninput="setCustomValidity('');" /> <span class="red">*</span></td>
											
											</tr>

												<td width="16%" align="right" nowrap="nowrap">price:</td>

												<td width="34%"><input type="number" name="price"
													maxlength="10" step="1.0" required
													oninvalid="setCustomValidity('please input correctlly');"
													oninput="setCustomValidity('');"
													onblur="if (!/^\d+(\.\d+)?$/.test(this.value)){this.value='';}" 
													onBlur="this.value=parseInt(this.value);if (isNaN(this.value) || this.value<=0){alert('input moren than 0');this.focus();};"
													/>
												</td>

											</tr>





											<tr>
												<td align="right">introduction:</td>
												<td colspan="3"><textarea name="introduction"
														cols="100" rows="8"></textarea></td>
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
						onclick="window.location.href='bookaddselect.jsp'" /></TD>

				</TR>
			</TABLE>
			</td>
			</tr>

			</table>
		</div>
	</form>

	<script> 
    var errory='<%=request.getParameter("error")%>';
    
    var number='<%=request.getParameter("number")%>';
    if(errory=='yes')
    	{
    	alert("book has existed");
    	}
    else
    	if(errory=='no')
    	{alert("successfully add");
    	}
    if(number=='no')
    	{
    	alert("number must be more than 0");
    	}
    
    
 
   
  


    </script>


</body>
</html>
