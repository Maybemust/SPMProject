<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="java.entity.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />

<title>income</title>

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
<link href="./css/style.css" rel="stylesheet" type="text/css" />
<link href="./css/css.css" rel="stylesheet" type="text/css" />

</style>
<script type="text/javascript">
    function submit1(){
        var date = document.getElementById("date").value;
      
        if(date==""){
            alert("Please input correctly!");
            return false;
        }else{
            form.submit();
            return true;
        }
    }
    function submit2(){
    	 var date1 = document.getElementById("date1").value;
    	 var date2 = document.getElementById("date2").value;
        if(date1=="" || date2==""){
            alert("Please input correctly!");
            return false;
        }else{
            form.submit();
            return true;
        }
    }
   
   
</script>



</head>




<body>

 <a href="LibrarianFirstPage.jsp"/>back</a>&nbsp;</td>

<br>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">

		<tr>
		  
		  <form action="ShowIncome" method="post" onsubmit="return submit1()">
		  
                   查询某天收入：  <input type="text" name="date"  id="date"  value="${riqi}"/>  &nbsp;<input type="submit" value="查询"/>       
		    
		  </form>
		  <form action="ShowIncome1" method="post" onsubmit="return submit2()">
		   查询一段时间收入： <input type="text" name="date1" id="date1" value="${qishi}"/>   &nbsp;-&nbsp; <input type="text" name="date2" id="date2" value="${jieshu}"/> &nbsp;<input type="submit" value="查询"/>    
		
		  </form>
		
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
													income List&nbsp;</td>
											</tr>

											<tr>
											
												
												<td width="30%" align="center" bgcolor="#EEEEEE">Cash</td>
												<td width="20" align="center" bgcolor="#EEEEEE">Fine</td>
												<td width="20%" align="center" bgcolor="#EEEEEE">Total</td>
											</tr>
											<form name="fom" id="fom"  method="post">

												
														
														
														<td bgcolor="#FFFFFF">${income2.cash}</td>
														<td bgcolor="#FFFFFF">${income2.fine}</td>
														<td bgcolor="#FFFFFF">${income2.cash+income2.fine}</td>
														

														<%-- <input type="hidden" name="barCode1" value="${book.barCode}"  /></input>
	        <input type="hidden" name="ISBN" value="${book.ISBN}"  /></input>
	        <input type="hidden" name="author" value="${book.author}"  /></input>
	        <input type="hidden" name="publishing" value="${book.publishing}"  /></input>
	        <input type="hidden" name="bookName" value="${book.bookName}"  /></input>
	        <input type="hidden" name="location" value="${book.location}"  /></input>
	        <input type="hidden" name="status" value="${book.status}"  /></input>
	        <input type="hidden" name="price" value="${book.price}"  /></input>
	        <input type="hidden" name="dateOfStorage" value="${book.dateOfStorage}" /></input> --%>

														





												
												
												 
														
                                                   
                                                
                                              
                                              </form>
 



												<%-- 	 <tr>
		  	    <td bgcolor="#FFFFFF"><input type="checkbox" name="delid"/></td> 
		    <td height="20" bgcolor="#FFFFFF">${book1.barCode}</td>
            <td bgcolor="#FFFFFF">${book1.ISBN}</td>
            <td bgcolor="#FFFFFF">${book1.author}</td>
            <td bgcolor="#FFFFFF">${book1.publishing}</td>
            <td bgcolor="#FFFFFF">${book.bookName}</td>
            <td bgcolor="#FFFFFF">${book1.location}</td>
		    <td height="20" bgcolor="#FFFFFF">${book1.status}</td>
		    <td height="20" bgcolor="#FFFFFF">${book.price}</td>
		    <td height="20" bgcolor="#FFFFFF">${book1.tag1}</td>
			<td height="20" bgcolor="#FFFFFF">${book1.tag2}</td>
			<td height="20" bgcolor="#FFFFFF">${book1.dateOfStorage}</td>
			<td bgcolor="#FFFFFF"><a href="bookedit.jsp?barCode1=${book1.barCode}&ISBN=${book1.ISBN}&author=${book1.author}&publishing=${book1.publishing}&bookName=${book1.bookName}&location=${book1.location}&status=${book1.status}&price=${book1.price}&dateOfStorage=${book1.dateOfStorage}">edit</a>&nbsp; |&nbsp;<a href="bookdeleteServlet?barCode1=${book1.barCode}" >delete</a>&nbsp;</td>
	
		    </tr> --%>

											





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
	
	
</body>
</html>
