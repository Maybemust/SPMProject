<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="java.entity.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	
<head>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<!-- 这个jsp是某一本书被归还的历史纪录 -->
<title>bookreturnededrecord</title>
	
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
     
				
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	 <input type="button" value="back" onclick="window.location.href='bookList'" /> 
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
					<td width="12%" align="center" bgcolor="#EEEEEE">borrow record ID</td>
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
					
			
						
		</form>
					
					
				
	
	
	
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
