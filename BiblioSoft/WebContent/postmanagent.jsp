<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="java.entity.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />

<title>postmanagent</title>

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
								
										
										<input name="Submit" type="button"
										class="" value="Add reader"
										onclick="window.location.href='LibrarianEditPostText.jsp'" />
									</td>
								</tr>
									<hr>
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
													Post List&nbsp;</td>
											</tr>


											<tr>
												<td width="6%" align="center" bgcolor="#EEEEEE">select</td>
												<td width="9%" height="20" align="center" bgcolor="#EEEEEE">postID</td>
												<td width="9%" align="center" bgcolor="#EEEEEE">author</td>
												<td width="9%" align="center" bgcolor="#EEEEEE">time</td>
												<td width="10%" align="center" bgcolor="#EEEEEE">postImage</td>
												<td width="9%" align="center" bgcolor="#EEEEEE">postTitle</td>
												<td width="9%" align="center" bgcolor="#EEEEEE">operation</td>
											
											</tr>





											<form name="fom" id="fom" method="post">

												<c:forEach items="${posts}" var="post" varStatus="ps">
													<tr>
														<td bgcolor="#FFFFFF"><input type="checkbox"
															name="delid" /></td>
														<td height="20" bgcolor="#FFFFFF">${post.postID}</td>
														<td bgcolor="#FFFFFF">${post.author}</td>
														<td bgcolor="#FFFFFF">${post.time}</td>
														<td bgcolor="#FFFFFF"><img src = "${post.postImage}" style = "height:100px;"></img></td>
														<td height="20" bgcolor="#FFFFFF">${post.postTitle}</td>
												
														<td bgcolor="#FFFFFF"><a
															href="EditNewsServlet2?postID=${post.postID}">edit</a>&nbsp;
															|&nbsp;<a
															href="postdeleteServlet?postID=${post.postID}">delete</a>&nbsp;</td>

													</tr>
													<script>
													function editnews(){
														
													}
													</script>
												</c:forEach>

						


											</form>




										</table>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>



				<table width="95%" border="0" align="center" cellpadding="0"
					cellspacing="0">
					<tr>
						<td height="6"><img src="../images/spacer.gif" width="1"
							height="1" /></td>
					</tr>
					<tr>
						<td height="33"><table width="100%" border="0" align="center"
								cellpadding="0" cellspacing="0" class="right-font08">
								<tr>
									<!-- <td width="50%">共<span class="right-text09">5</span> 页 | 第<span class="right-text09">1</span> 页</td> -->
									<td width="49%" align="right">[<a href="#"
										class="right-font08">first page</a> | <a href="#"
										class="right-font08">previous page</a> | <a href="#"
										class="right-font08">next page</a> | <a href="#"
										class="right-font08">last page</a>] go to
									</td>
									<td width="1%"><table width="20" border="0"
											cellspacing="0" cellpadding="0">
											<tr>
												<td width="1%"><input name="textfield3" type="text"
													class="right-textfield03" size="1" /></td>
												<td width="87%"><input name="Submit23222" type="submit"
													class="right-button06" value=" " /></td>
											</tr>
										</table></td>
								</tr>
							</table></td>
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
 
    </script>




</body>
</html>
