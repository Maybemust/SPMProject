<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>add book</title>
<link rel="stylesheet" rev="stylesheet" href="./css/style.css" type="text/css" media="all" />

<script type="text/javascript" src="http://lib.sinaapp.com/js/jquery/1.8.3/jquery.min.js"></script>


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



  
<form action="bookadd" method="post"  name="form"  >
  
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
						  
					     <td nowrap align="right" width="15%">ISBN:</td>
						  
					    <td width="35%"><input type="text" name="ISBN" maxlength="15" style="width:154px"  required oninvalid="setCustomValidity('The input cannot be empty');" oninput="setCustomValidity('');"/>
							
				        <span class="red">*</span></td>
						  
					    <td width="16%" align="right" nowrap="nowrap">author:</td>
						  
					    <td width="34%"><input name="author" maxlength="30" type="text" style="width:154px" required oninvalid="setCustomValidity('The input cannot be empty');" oninput="setCustomValidity('');"/></td>
					    
				
					  </tr>
					  
					  <tr>
						  
					     <td nowrap align="right" width="15%">publishing:</td>
						  
					    <td width="35%"><input type="text" name="publishing" maxlength="35" style="width:154px" required oninvalid="setCustomValidity('The input cannot be empty');" oninput="setCustomValidity('');"/></td> 
						  
					    <td width="16%" align="right" nowrap="nowrap">location:</td>
						  
					    <td width="34%"><input name="location"  type="text" maxlength="35" style="width:154px"  required oninvalid="setCustomValidity('The input cannot be empty');" oninput="setCustomValidity('');" /></td>
					    
						  
					  </tr>
					  
					  
					<!--   <tr>
						  
					     <td nowrap align="right" width="15%">location:</td>
						  
					    <td width="35%"><input name="location"  type="text" maxlength="35" style="width:154px" /> 
						  
					    <td width="16%" align="right" nowrap="nowrap">Date:</td>
						  
					    <td width="34%"><input type="date" name="date" style="width:154px"></td>
					    
						  
					  </tr> -->
					  
		  			  <tr>
					  <tr>
						
					    <td align="right">tag1</td>
						  
					    <td><select name="tag1" >
                            <option selected="selected1">==none==</option>
                            <option>Music</option>
                            <option>Milltary</option>
                            <option>Bibliography</option>
                            <option>World History</option>
                            <option>Fine Arts</option>
                            <option>Philososphy</option>
                            <option>Technology</option>
                            <option>Language</option>
                            <option>Geography</option>
                        </select></td>
                        <td align="right">tag2</td>
						  
					    <td><select name="tag2" >
                            <option selected="selected2">==none==</option>
                          <option>Music</option>
                            <option>Milltary</option>
                            <option>Bibliography</option>
                            <option>World History</option>
                            <option>Fine Arts</option>
                            <option>Philososphy</option>
                            <option>Technology</option>
                            <option>Language</option>
                            <option>Geography</option>
                        </select></td>
					  </tr>
					  
					  <tr>
					    <td align="right">cover:</td>
					    <td><input  type="button"  name="cover" style="width:154px" value="upload"/></td>
                         
                          
					    <td width="16%" align="right" nowrap="nowrap">bookName:</td>
						  
					    <td width="34%"><input type="text" name="bookName" maxlength="15" style="width:154px" required oninvalid="setCustomValidity('The input cannot be empty');" oninput="setCustomValidity('');"></td> 
					  </tr>
					  
					  <tr>
					  <td align="right">number:</td>
					  
					  <td><input type="button" class="opt" value="-"/>
                         <input type="text"    name="number"    id="res" value="1" readonly="readonly"/>
                      <input type="button" class="opt" value="+"/></td>
                      
                      
                      <td width="16%" align="right" nowrap="nowrap">price:</td>
						  
					    <td width="34%"><input type="number" name="price" maxlength="10"   step="0.01" required oninvalid="setCustomValidity('please input correctlly');" oninput="setCustomValidity('');" onblur="if (!/^\d+(\.\d+)?$/.test(this.value)){this.value='';}" />  </td>
                      
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
    
    
    
    $(function(){
        $(':button').click(function(){
            $('#res').val(eval($('#res').val() + $(this).val() + "1"));
        });
    })
    </script>
     

</body>
</html>
