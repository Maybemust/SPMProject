<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>add book</title>
<link rel="stylesheet" rev="stylesheet" href="./css/style.css" type="text/css" media="all" />


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
.atten {font-size:12px;font-weight:normal;color:#F00;}
-->
</style>
</head>

<body class="ContentBody">



  
<form action="bookadd" method="post"  name="form" target="sypost" >
  
<div class="MainDiv">


<table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent">

  <tr>
      <th class="tablestyle_title" >Add book</th>
  </tr>
  
  <tr>
    <td class="CPanel">
		
		<table border="0" cellpadding="0" cellspacing="0" style="width:100%">
		
				<TR>
			<TD width="100%">
				
				<fieldset style="height:100%;">
				<legend>add book</legend>
					  <table border="0" cellpadding="2" cellspacing="1" style="width:100%">
					 
					  <tr>
						  
					     <td nowrap align="right" width="15%">barCode:</td>
						  
					    <td width="35%"><input name="barCode"  type="text" style="width:154px" required/> 
							
				        <span class="red">*</span></td>
						  
					    <td width="16%" align="right" nowrap="nowrap">ISBN:</td>
						  
					    <td width="34%"><input type="text" name="ISBN" style="width:154px"></td>
					    
						  
					  </tr>
					  <tr>
						  
					     <td nowrap align="right" width="15%">author:</td>
						  
					    <td width="35%"><input name="author"  type="text" style="width:154px" /> 
						  
					    <td width="16%" align="right" nowrap="nowrap">publishing:</td>
						  
					    <td width="34%"><input type="text" name="publishing" style="width:154px"></td>
					    
						  
					  </tr>
					  
					  
					  <tr>
						  
					     <td nowrap align="right" width="15%">location:</td>
						  
					    <td width="35%"><input name="location"  type="text" style="width:154px" /> 
						  
					    <td width="16%" align="right" nowrap="nowrap">Date:</td>
						  
					    <td width="34%"><input type="text" name="date" style="width:154px"></td>
					    
						  
					  </tr>
					  
		  			  <tr>
					  <tr>
						
					    <td align="right">tag1</td>
						  
					    <td><select name="tag1" >
                            <option selected="selected1">==select==</option>
                            <option>history</option>
                            <option>literature</option>
                        </select></td>
                        <td align="right">tag2</td>
						  
					    <td><select name="tag2" >
                            <option selected="selected2">==select==</option>
                            <option>history</option>
                            <option>literature</option>
                        </select></td>
					  </tr>
					  <tr>
					    <td align="right">cover:</td>
					    <td><input  type="button"  name="cover" style="width:154px" value="upload"/></td>
                         
                          
					    <td width="16%" align="right" nowrap="nowrap">bookName:</td>
						  
					    <td width="34%"><input type="text" name="bookName" style="width:154px"></td> 
					  </tr>
					  
					  
		
					  <tr>
					    <td align="right">introduction:</td>
					    <td colspan="3"><textarea name="introduction" cols="100" rows="8"></textarea></td>
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
			<TD colspan="2" align="center" height="50px">
			
			
			<input type="submit"  value="save" class="button"  />　 
			
			<input type="button"  value="back" class="button" onclick="window.location.href='bookList'" /></TD>
		                                                          
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
    	alert("book has existed");
    	}
    else
    	if(errory=='no')
    	{alert("successfully add");
    	}
  
    </script>
     

</body>
</html>
