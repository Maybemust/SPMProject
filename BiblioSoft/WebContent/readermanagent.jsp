<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="java.entity.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />

<title>readermanagent</title>

<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}

.tabfont01 {
	font-family: "宋体";
	font-size: 9px;
	color: #555555;
	text-decoration: none;
	text-align: center;
}

.font051 {
	font-family: "宋体";
	font-size: 12px;
	color: #333333;
	text-decoration: none;
	line-height: 20px;
}

.font201 {
	font-family: "宋体";
	font-size: 12px;
	color: #FF0000;
	text-decoration: none;
}

.button {
	font-family: "宋体";
	font-size: 14px;
	height: 37px;
}

html {
	overflow-x: auto;
	overflow-y: auto;
	border: 0;
}
-->
</style>


<link href="./css/css.css" rel="stylesheet" type="text/css" />

<script type="text/JavaScript">
</script>

<link href="./css/style.css" rel="stylesheet" type="text/css" />

</head>



<SCRIPT language=JavaScript>

function selectAll(){
	var obj = document.fom.elements;
	for (var i=0;i<obj.length;i++){
		if (obj[i].name == "delid"){
			obj[i].checked = true;
		}
	}
}

function unselectAll(){
	var obj = document.fom.elements;
	for (var i=0;i<obj.length;i++){
		if (obj[i].name == "delid"){
			if (obj[i].checked==true) obj[i].checked = false;
			else obj[i].checked = true;
		}
	}
}

</SCRIPT>



<body>



	<table width="100%" border="0" cellspacing="0" cellpadding="0">

		<tr>
			<td>
				<table id="subtree1" style="DISPLAY:" width="100%" border="0"
					cellspacing="0" cellpadding="0">
					<tr>
						<td>
							<table width="95%" border="0" align="center" cellpadding="0"
								cellspacing="0">
								<tr>
									<td height="20">


										<form action="readersearch" method="post">

											<input name="searchaccount" type="text" size="12" /> <input
												type="submit" class="right-button02" value="search" />
												<a class="right-button02" target="mainFrame" href="readerList" style="display:inline-block;text-decoration:none">clear</a>
										</form>

										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</td>
								</tr>

								<tr>
									<td height="40" class="font42">

										<table width="100%" border="0" cellpadding="4" cellspacing="1"
											bgcolor="#464646" class="newfont03">

											<tr>
												<td height="20" colspan="15" align="center"
													bgcolor="#EEEEEE" class="tablestyle_title">
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													Reader List&nbsp;</td>
											</tr>


											<tr>
												
												<td width="9%" height="20" align="center" bgcolor="#EEEEEE">account</td>
												<td width="9%" align="center" bgcolor="#EEEEEE">password</td>
												<td width="9%" align="center" bgcolor="#EEEEEE">phone</td>
												<td width="14%" align="center" bgcolor="#EEEEEE">email</td>
												<td width="10%" align="center" bgcolor="#EEEEEE">fine</td>
												<td width="9%" align="center" bgcolor="#EEEEEE">borrowed number</td>
												<td width="4%" align="center" bgcolor="#EEEEEE">cash pledge</td>
											
												<td width="19%" align="center" bgcolor="#EEEEEE">operating</td>
											</tr>





											<form name="fom" id="fom" method="post">

												<c:forEach items="${readers}" var="reader" varStatus="re">
													<tr>
														
														<td height="20" bgcolor="#FFFFFF">${reader.account}</td>
														<td bgcolor="#FFFFFF">***********</td>
														<td bgcolor="#FFFFFF">${reader.phone}</td>
														<td bgcolor="#FFFFFF">${reader.email}</td>
														<td bgcolor="#FFFFFF">${reader.fine}</td>
														<td height="20" bgcolor="#FFFFFF">${reader.borrowedNum}</td>
														<td height="20" bgcolor="#FFFFFF">${reader.cashPledge}</td>

														<td bgcolor="#FFFFFF"><a
															href="readeredit.jsp?account1=${reader.account}&password=${reader.password}&phone=${reader.phone}&email=${reader.email}&fine=${reader.fine}&borrowedNum=${reader.borrowedNum}&cashPledge=${reader.cashPledge}&tag=${reader.tag}">edit</a>&nbsp;
															|&nbsp;<a
															href="readerdeleteServlet?account1=${reader.account}">delete</a>&nbsp;
															|&nbsp;<a href="ShowReaderBorrowRecord?account1=${reader.account }">borrowrecord</a>&nbsp; 
															|&nbsp;<a href="ShowReaderReturnRecord?account1=${reader.account }">returnrecord</a></td>

													</tr>
												</c:forEach>

				


											</form>




										</table>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>



				
			</td>
		</tr>
	</table>


	<script> 
    var errory='<%=request.getParameter("error")%>';
    if(errory=='yes')
    	{
    	alert("已有账号存在");
    	}
    
    var errory1='<%=request.getParameter("error1")%>';
    if(errory1=='yes')
    	{
    	alert("不存在该账号");
    	}
    
    var fine='<%=request.getParameter("fine")%>';
    if(fine=='no')
    	{
    	alert("Please pay the fine and delete");
    	}
    
    var borrownum='<%=request.getParameter("borrownum")%>';
    if(borrownum=='no')
    	{
    	alert("Please delete after returning the book");
    	}
 
    var borrownumber='<%=request.getParameter("borrownumber")%>';
    if(borrownumber=='no')
    	{
    	alert("Please return the book and delete");
    	}
    
    
    </script>




</body>
</html>
