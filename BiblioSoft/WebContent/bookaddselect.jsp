<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>add select</title>
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


	<div class="MainDiv">



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

									<fieldset style="height: 400px; width: 97.5%;">
										<legend>add book</legend>





										<input type="button" value="Internet input" class="button"
											style="position: relative; top: 150px; left: 500px; height: 50px; width: 200px; font-size: 20px"
											onclick="window.location.href='bookadd2.jsp'" /> <input
											type="button" value="No Internet input" class="button"
											style="position: relative; top: 150px; left: 500px; height: 50px; width: 200px; font-size: 20px"
											onclick="window.location.href='Labeledit?no=1'" /> <br />
									</fieldset>

								</TD>

							</TR>
						</TABLE>


					</td>
				</tr>

				<!-- <TR>
			<TD colspan="2" align="center" height="50px">
			
			
			<input type="submit"  value="save" class="button"  />　 
			
			<input type="button"  value="back" class="button" onclick="window.location.href='bookList'" /></TD>
		                                                          
		</TR> -->
			</TABLE>
			</td>
			</tr>

			</table>
		</div>
</body>
</html>
