<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>edit book</title>
<link rel="stylesheet" rev="stylesheet" href="./css/style.css"
	type="text/css" media="all" />


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

	<% String barCode = request.getAttribute("barCode").toString(); %>
	<% String ISBN = request.getAttribute("ISBN").toString(); %>
	<% String publishing = request.getAttribute("publishing").toString(); %>
	<% String author = request.getAttribute("author").toString(); %>
	<% String bookName = request.getAttribute("bookName").toString(); %>
	<% String location = request.getAttribute("location").toString(); %>
	<% String status = request.getAttribute("status").toString(); %>
	<% String price = request.getAttribute("price").toString(); %>
	<% String dateOfStorage = request.getAttribute("dateOfStorage").toString(); %>







	<form action="bookedit" method="post" name="form">

		<div class="MainDiv">


			<table width="99%" border="0" cellpadding="0" cellspacing="0"
				class="CContent">

				<tr>
					<th class="tablestyle_title">Edit book</th>
				</tr>

				<tr>
					<td class="CPanel">

						<table border="0" cellpadding="0" cellspacing="0"
							style="width: 100%">

							<TR>
								<TD width="100%">

									<fieldset style="height: 100%;">
										<legend>edit book</legend>
										<table border="0" cellpadding="2" cellspacing="1"
											style="width: 100%">

											<tr>

												<td nowrap align="right" width="15%">barcode:</td>

												<td width="35%"><input name="barCode" type="text"
													maxlength="15" style="width: 154px" value="<%=barCode %>"
													required  readonly="readonly"
													oninvalid="setCustomValidity('The input cannot be empty');"
													oninput="setCustomValidity('');" /> <span class="red">*</span></td>

												<td width="16%" align="right" nowrap="nowrap">ISBN:</td>

												<td width="34%"><input type="text" name="ISBN"
													maxlength="15" style="width: 154px" value="<%=ISBN %>"
													readonly="readonly"></td>


											</tr>
											<tr>

												<td nowrap align="right" width="15%">author:</td>

												<td width="35%"><input name="author" type="text"
													maxlength="30" style="width: 154px" value="<%=author %>"
													required
													oninvalid="setCustomValidity('The input cannot be empty');"
													oninput="setCustomValidity('');" />
												<td width="16%" align="right" nowrap="nowrap">publishing:</td>

												<td width="34%"><input type="text" name="publishing"
													maxlength="35" style="width: 154px"
													value="<%=publishing %>" required
													oninvalid="setCustomValidity('The input cannot be empty');"
													oninput="setCustomValidity('');"></td>


											</tr>


											<tr>

														<td width="16%" align="right" nowrap="nowrap">location:</td>

												<td><select name="location">
														<option selected="selected1">==none==</option>
														<c:forEach items="${locations }" var="location" varStatus="count">
														<option>${location.location }</option>
													</c:forEach>
														
												</select></td>
												
												
												<td width="16%" align="right" nowrap="nowrap">Date:</td>

												<td width="34%"><input type="date" name="date"
													style="width: 154px" value="<%=dateOfStorage %>"></td>


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
												<td><input type="button" name="cover"
													style="width: 154px" value="upload" /></td>

												<td width="16%" align="right" nowrap="nowrap">status:</td>

												<td width="34%"><input type="text" name="status"
													maxlength="1" style="width: 154px" value="<%=status %>"
													onkeyup="this.value=this.value.replace(/\D/g,'')"
													onafterpaste="this.value=this.value.replace(/\D/g,'')"
													required
													oninvalid="setCustomValidity('The input cannot be empty');"
													oninput="setCustomValidity('');"></td>
											</tr>

											<tr>
												<td width="16%" align="right" nowrap="nowrap">book name:</td>

												<td width="34%"><input type="text" name="bookName"
													maxlength="15" style="width: 154px" value="<%=bookName %>"
													required
													oninvalid="setCustomValidity('The input cannot be empty');"
													oninput="setCustomValidity('');"></td>

												<td width="16%" align="right" nowrap="nowrap">price:</td>

												<td width="34%"><input type="number" name="price"
												value="<%=price %>"
													maxlength="10" step="0.01" required
													oninvalid="setCustomValidity('please input correctlly');"
													oninput="setCustomValidity('');"
													onblur="if (!/^\d+(\.\d+)?$/.test(this.value)){this.value='';}" />
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
						type="submit" value="save" class="button" /> <input type="button"
						value="back" class="button"
						onclick="window.location.href='bookList'" /></TD>

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
    	alert("no found book");
    	}
    else
    	if(errory=='no')
    	{alert("successfully edit");
    	}
    
  
    
    
    </script>


</body>
</html>
