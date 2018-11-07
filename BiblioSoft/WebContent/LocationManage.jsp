<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.text.*" %>
<!doctype html>
<html>
<head>
<title>Edit Add Delete Location</title>
<link href="/css/buttonsxiang.css" rel="stylesheet" media="screen">

	<style>
		#container{
			height: 600px;
			width: 1000px;
		}
		#con-title{
			width: 800px;
			height: 50px;
		}
		#TagTable{
			height: 400px;
		}
		#con-addtag{
			height: 30px;
		}
		#addtag{
			margin-left: 300px;
			width: 200px;
			height: 25px;
		}
		#tag-detail{
			margin-top: 50px;
		}
		#tag-detail tr:first-child{
			height: 50px;
			border-top-left-radius: 7px;
			border-bottom-left-radius: 7px;
		}
		#tag-detail tr:last-child{
			border-bottom-left-radius: 7px;
			border-top-left-radius: 7px;
		}
		#tag-detail td:first-child{
			height: 50px;
			border-top-left-radius: 7px;
			border-bottom-left-radius: 7px;
		}
		#tag-detail td:last-child{
			border-top-right-radius: 7px;
			border-bottom-right-radius: 7px;
		}
		#tag-detail td{
			background: #F1F1F1;
		}
	</style>
</head>
<body>
 		<script type="text/javascript">
			function opreatelocation(no,name,temid){
		
				id="tdis"+temid;
		
				if(no == "3")
				{
				
					var newnametest = document.getElementById(id).value;
					urllabel="opreatelocation?no="+no+"&name="+name+"&newname=" + newnametest;
				
				}	
				if(no == "2"){
					name = document.getElementById("addtag").value;
					var newname = "";
					urllabel="opreatelocation?no="+no+"&name="+name+"&newname="+newname;
				
				}
					
				if(no == "1")
					urllabel="opreatelocation?no="+no+"&name="+name+"&newname= ";
				location.href=urllabel;		
			} 
		</script>
	<div id="container">
		<div style="height: 10px;"></div>
		<div id="con-title">
			<h3 style="margin-left: 40px;">Edit Location</h3>
		</div>
		<hr>
		<div id="con-addtag">
				<input id="addtag" type="text" placeholder="please input the location">
				<button class="button button-primary button-rounded button-small" onclick="opreatelocation(2,'',0)">Add</button>
		</div>
		
	 	<div id="TagTable"> 
			<table  id="tag-detail" align="center" border="0" cellspacing="0">
				<tr>
					<td style="width: 50px;"><h4 style="margin-left: 10px;">Num</h4></td>
				 	<td style="width: 300px;"><h4 style="margin-left: 120px;">Location</h4></td>
					<td style="width: 100px;"></td>
					<td style="width: 100px;"></td>
				</tr>
				<c:forEach items="${locations }" var="label" varStatus="count">
				<tr>
					<td align="center">${count.index + 1 }</td>
					<td><input id="tdis${count.index+1}" style= "height: 30px;width: 200px;margin-left: 40px;" type="text" value="${label.location }"></td>
					<td><button type="button" onclick="opreatelocation(1,'${label.location}',0)">DeleteLocation</button></td>
					<td><button type="button" onclick="opreatelocation(3,'${label.location}','${count.index+1}')">ModiyLocation</button></td>
				</tr>
				</c:forEach>
			</table>
		</div>
		
	</div>
</body>
</html>