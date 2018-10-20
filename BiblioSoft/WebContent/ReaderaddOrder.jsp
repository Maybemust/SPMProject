<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.text.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
	<title>version2.0</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="./css/bootstrap.css" rel="stylesheet" media="screen"> 
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/bootstrap-table.css">
    <script src="http://code.jquery.com/jquery.js"></script>
    <script src="./js/bootstrap.min.js"></script>
    <script src="./js/bootstrap-table.js"></script>
    <script src="./js/bootstrap-table-zh-CN.js"></script>
    <link href="./css/buttons-xiang.css" rel="stylesheet" media="screen">  
	
    <!-- diao style-->
	<style type="text/css">
		#myorder{
			margin-top:50px;
			width:1200px;
			margin-left: 20px;
			margin-right: 100px;
			position: relative;
			text-align:center;
		}
		#all{
			width:1050px;
			height:730px;
		}
        #ordertab
        {
        
            border-collapse: separate;
            border-spacing: 0;
            border: 2px #DCDCDC;
            margin: 0 auto;
        }
        #ordertab td
        {
            border: 0px solid #DCDCDC;
            color: #666;
            height: 30px;
        }
		#ordertab th
		{
			border: 0px solid #DCDCDC;
            color: #666;
            height: 50px;
		}
        #ordertab thead th
        {
            background-color: #DCDCDC;
            width: 100px;
        }
        #ordertab tr:nth-child(odd)
        {
            background: #fff;
        }
        #ordertab tr:nth-child(even)
        {
            background: #DCDCDC;
        }
        #ordertab th:first-child{/*设置table左边边框*/
            border-left: 2px solid #DCDCDC;
        }
		#ordertab td:first-child {/*设置table左边边框*/
            border-left: 2px solid #DCDCDC;
        }

        #ordertab tr td:first-child,
        #ordertab tr td:nth-child(2),
        #ordertab tr td:nth-child(3),
        #ordertab tr td:nth-child(4),
        #ordertab tr td:nth-child(5),
        #ordertab tr td:nth-child(6),
        #ordertab tr td:nth-child(7),
        #ordertab tr td:nth-child(8),
        #ordertab tr td:nth-child(9),
        #ordertab tr td:last-child{/*设置table表格每列底部边框*/
            border-bottom: 2px solid #DCDCDC;
        }
        #ordertab tr:first-child th:first-child {
            border-top-left-radius: 15px;
        }

        #ordertab tr:first-child th:last-child {
            border-top-right-radius: 15px;
        }
        #ordertab tr:last-child td:first-child {
            border-bottom-left-radius: 15px;
        }

        #ordertab tr:last-child td:last-child {
            border-bottom-right-radius: 15px;
        }
        #searchcontainer{
        	float:left;
        	width: 300px;
        	margin-top: 100px;
        	margin-left:400px;
        	height: 150px;
        }
        #addorderinput{
        	float:left;
        	margin-left:50px;
        	width: 300px;
        	height: 150px;
        	margin-top:20px;
        }
        #searchBook{
          	float: left;
          	width: 300px;
        }
        #searchbutton{
        	float: right;
        }
    </style>

</head>
<body>
	   <script type="text/javascript">
           function cleanorder(){
              document.getElementById("barCode_order").value ="";
              document.getElementById("bookName_order").value ="";

           }
           function saveorder(){
              var barcode_order = document.getElementById("barCode_order").value;
              var bookName_order = document.getElementById("bookName_order").value;
              if (barcode_order != ""){
              	if (bookName_order != ""){
                    if(confirm("Are you sure about the appointment?")){
                        	addOrder = "addOrder?barCode="+barcode_order+"&&bookName="+bookName_order;
                            window.location.href=addOrder;
                            location.reload(); 
                    }
                }
                else{
                    alert("please input bookName_order");
                }
              }
              else{
                   alert("please input barcode_order");
              }
            }
       </script>
       
       <div id="all">
			<div id="addorderinput">
				<p>barCode</p><input class="form-control" id="barCode_order" placeholder="please input barCode" style="width:300px;"></input>
                <p>bookName</p><input class="form-control" id="bookName_order" placeholder="please input bookName" style="width:300px;"><br/>
                <button id="saveorder" class="btn btn-primary btn_search" onclick="saveorder()">save</button>
                <button id="cleanorder" class="btn btn-primary btn-info" onclick="cleanorder()">clean</button>
			</div>
			<form method="POST" action="searchBook">
           		<div id="searchcontainer">
					<div id="searchiuput">
						<input id="searchBook" type="text" name="searchou" class="form-control" placeholder="please input key words">
						<button id="searchbutton" type="submit" name="btn_submit" class="btn btn-primary btn-info">search</button>
					</div>
				</div>
			</form>
			<br/>
			<div  style="text-align:center;postion:relative;">
				<table id="ordertab" border="1" width=100% cellpadding="5" style="margin-left:5px;margin-right:30px;width:1000px;margin-left:50px;">
					<thead>
						<tr>
						<th style="text-align:center;"><font size="4">No</font></th>
				  		<th style="text-align:center;"><font size="4">BookName</font></th>
				  		<th style="text-align:center;"><font size="4">ISBN</font></th>
				  		<th style="text-align:center;"><font size="4">Author</font></th>
				  		<th style="text-align:center;"><font size="4">Publishing</font></th>
				  		<th style="text-align:center;"><font size="4">Location</font></th>
				  		<th style="text-align:center;"><font size="4">Introduction</font></th>
				  		<th style="text-align:center;"><font size="4">Status</font></th>
				  		<th style="text-align:center;"><font size="4">DateOfStorage</font></th>
				  		<th style="text-align:center;"><font size="4">Operation</font></th>
						</tr>
					</thead>
					<c:forEach items="${bookList}" var="bookList" varStatus="loop">
						<tr>
						<td><font size="4">${bookList.barCode}</font></td>
						<td><font size="4"><a style="color:black;" href="bookDetailServletrr?ISBN=${booklist.ISBN }">${bookList.bookName}</a></font></td>
						<td ><font size="4">${bookList.ISBN}</font></td>
						<td><font size="4">${bookList.author}</font></td>
						<td><font size="4">${bookList.publishing}</font></td>
						<td><font size="4">${bookList.location}</font></td>	
						<td><font size="4">${bookList.introduction}</font></td>	
						<td><font size="4">${bookList.status}</font></td>	
						<td><font size="4">${bookList.dateOfStorage}</font></td>
						<td><a href="addOrder?barCode=${bookList.barCode}&bookName=${bookList.bookName}">Add</a></td>
						</tr>
					</c:forEach>
				</table>
			</div>
        </div>
	</body>
</html>