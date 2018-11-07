<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="java.entity.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	
<head>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<!-- 这个jsp是某一用户还书的历史纪录 -->
<title>returnedbookrecord</title>
	
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
.font051 {font-family: "宋体";
	font-size: 12px;
	color: #333333;
	text-decoration: none;
	line-height: 20px;
}
.font201 {font-family: "宋体";
	font-size: 12px;
	color: #FF0000;
	text-decoration: none;
}
.button {
	font-family: "宋体";
	font-size: 14px;
	height: 37px;
}
html { overflow-x: auto; overflow-y: auto; border:0;} 
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
		<table id="subtree1" style="DISPLAY: " width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>
			  <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
     
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	<input type="button" value="back" onclick="window.location.href='readerList'" />  
              <tr>
                <td height="40" class="font42">
					
					<table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646" class="newfont03">

					<tr>
                    <td height="20" colspan="15" align="center" bgcolor="#EEEEEE"class="tablestyle_title"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 	
				     Record List&nbsp;
					</td>
                    </tr>
					
                    <tr>				   
					 <td width="12%" height="20" align="center" bgcolor="#EEEEEE">barcode</td>
					<td width="12%" align="center" bgcolor="#EEEEEE">borrowed record ID</td>
					<td width="20" align="center" bgcolor="#EEEEEE">reader account</td>
					<td width="12%" align="center" bgcolor="#EEEEEE">borrowed date</td>
					<td width="12%" align="center" bgcolor="#EEEEEE">returned date</td>
					<td width="13%" align="center" bgcolor="#EEEEEE">fine</td>
					
                  </tr>
                  
                  
                 
               <form name="fom" id="fom" method="post">   
             <!-- request传递过来的record参数 -->        
		    <c:forEach items="${records}" var="record" varStatus="re">
		    <tr>		  
		    <td height="20" bgcolor="#FFFFFF">${record.barCode}</td>
            <td bgcolor="#FFFFFF">${record.bRID}</td>
            <td bgcolor="#FFFFFF">${record.readerAccount}</td>
            <td bgcolor="#FFFFFF">${record.borrowedDate}</td>
            <td bgcolor="#FFFFFF">${record.returnedDate}</td>
		    <td height="20" bgcolor="#FFFFFF">${record.fine}</td>
		   
			
		    </tr>
	        </c:forEach>
					
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
						
		</form>
					
					
					
			
                 
                </table>
			   </td>
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
    
    </script>
</body>
</html>
