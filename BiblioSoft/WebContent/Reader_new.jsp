<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.text.*" %>
<!doctype html>
<html>
<head>

	</script>
	<meta charset="utf-8">
	<title>version2.0</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="./css/bootstrap.css" rel="stylesheet" media="screen"> 
    <script src="./js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/bootstrap-table.css">
    <script src="http://code.jquery.com/jquery.js"></script>
    <script src="./js/bootstrap.min.js"></script>
    <script src="./js/bootstrap-table.js"></script>
    <script src="./js/bootstrap-table-zh-CN.js"></script>
    <link href="./css/buttons-xiang.css" rel="stylesheet" media="screen">
	<!-- 这里面对body的样式进行了更改 -->
	<!-- 一些 menu的样式也是直接改了，不过我估计应该没问题-->
	<style>
        body{
            margin:0; 
            padding:0;
            font-family: Lato,Helvetica,Arial,sans-serif;
            font-size: 14px;
            line-height: 1.772;
            color: #34495e;
            background-color: #fff;
        }
        .wrap {
            min-width: 100%;
            position: absolute;
            background: #eff3f6 bottom;
            min-height: 100%;
            overflow: hidden;
         }
        .left{
            margin-left:0px;
            position: absolute;
            box-sizing: border-box;
            width: 250px;
            height: 100%;
            background: #4D4D4D bottom;
         }
         .logoDiv{
                padding-top: 20px;
                padding-bottom: 20px;
                height: 70px;
                background-color:#383838;
                font-size: 17px;
                color: #fff;
                vertical-align: bottom;    
         }
         .logoTitle{
                margin-left:15px;
                line-height: 1.7;
          }
          .menu-title {
                margin-left:15px;
                color: #828e9a;
                padding-top: 10px;
                padding-bottom: 10px;
                font-size: 14px;
                font-weight: bold;
          }
          .menu-item {
                padding-left:15px;
                line-height: 40px;
                height: 40px;
                color: #aab1b7;
                cursor: pointer;
          }
          .menu-item-active {
                /*background-color: #99ffcc; */
                border-right: 4px solid #647f9d;
                color: #ffffcc;
          }
          .right{
                box-sizing: border-box;
                float: left;
                box-sizing: border-box;
                padding-left: 250px;
                overflow-y: overlay;
                overflow-x: hidden;
                clear: both;
                color: #717592;
                min-width: 100%;
                min-height: 500px;
          }
          .content{
          	margin-left:30px;
          	margin-top:80px;
          }
    </style>
    <!-- xiang -->
    <style>
    	#ps-container{
			width: 800px;
			height: 750px;
		}
		#pm-head{
			width: auto;
			height: 50px;
		}
		#ps-security{
			margin-left: 200px;
			margin-top: 100px;
		}
		#oldPasswordInput{
			width: 300px;
			height: 30px;
			border-radius: 7px;
		}
		#newPasswordInput{
			width: 300px;
			height: 30px;
			border-radius: 7px;
		}
		#newPasswordInputAgain{
			width: 300px;
			height: 30px;
			border-radius: 7px;
		}
		#pm-head{
			width: auto;
			height: 50px;
		}
		#pm-container{
			width: 1000px;
			height: 750px;
		}
		#pm-imformation{
		    width:800px;
			margin-left: 200px;
			margin-top: 40px;
		}
		#accountInput{
			width: 300px;
			height: 30px;
			border-radius: 7px;
		}
		#emailInput{
			width: 300px;
			height: 30px;
			border-radius: 7px;
		}
		#phoneInput{
			width: 300px;
			height: 30px;
			border-radius: 7px;
		}
		#fineInput{
			width: 300px;
			height: 30px;
			border-radius: 7px;
		}
		#borrowedNumInput{
			width: 300px;
			height: 30px;
			border-radius: 7px;
		}
		#cashPledgeInput{
			width: 300px;
			height: 30px;
			border-radius: 7px;
		}
	</style>
	<!--hou style-->
	<style>
		#lishijieyue{
			width:1200px;
			margin-left: 20px;
			margin-right: 100px;
			position: relative;
			text-align:center;
		}
		#wodejieyue{
			width:1200px;
			margin-left: 20px;
			margin-right: 100px;
			position: relative;
			text-align:center;
		}
		#show{
			margin-left: 0%;
			margin-right: 0%;
			position: relative;
			text-align:center;
			display:block;
		}
		#table_wrap > myborrow {
            font-size: 16px;
            text-align: center;
            margin: 0 auto;
            border-collapse: separate;
            border-spacing: 0;
            border: 2px #000;
        }

        #myborrow thead tr{
            height: 40px;
            line-height: 50px;
            width: 150px;
            /*background-color: pink;*/
        }
		#myborrow tbody tr {
            height: 30px;
            line-height: 50px;
            /*background-color: pink;*/
        }
        #myborrow tr th:first-child{/*设置table左边边框*/
            border-left: 2px solid #B0C4DE;
        }
		#myborrow tr td:first-child {/*设置table左边边框*/
            border-left: 2px solid #B0C4DE;
        }
        #myborrow tr th:last-child{/*设置table右边边框*/
            border-right: 2px solid #B0C4DE;
        }
        #myborrow tr td:first-child,
        #myborrow tr td:nth-child(2),
        #myborrow tr td:nth-child(3),
        #myborrow tr td:nth-child(4),
        #myborrow tr td:nth-child(5),
        #myborrow tr td:nth-child(6),
        #myborrow tr td:nth-child(7),
        #myborrow tr th:first-child,
        #myborrow tr th:nth-child(2),
        #myborrow tr th:nth-child(3),
        #myborrow tr th:nth-child(4),
        #myborrow tr th:nth-child(5),
        #myborrow tr th:nth-child(6),
        #myborrow tr th:nth-child(7),
		#myborrow tr td:last-child {/*设置table右边边框*/
            border-right: 2px solid #B0C4DE;
        }
        #myborrow tr td:first-child,
        #myborrow tr td:nth-child(2),
        #myborrow tr td:nth-child(3),
        #myborrow tr td:nth-child(4),
        #myborrow tr td:nth-child(5),
        #myborrow tr td:nth-child(6),
        #myborrow tr td:nth-child(7),
        #myborrow tr td:last-child{/*设置table表格每列底部边框*/
            border-bottom: 2px solid #B0C4DE;
        }
        /*table tr:last-child td:first-child,
        table tr:last-child td:nth-child(2),
        table tr:last-child td:nth-child(3),
        table tr:last-child td:last-child{/!*设置table表格最后一列底部边框*!/
            border-bottom: 2px solid #000;
        }*/
        #myborrow tr th {
            background: #B0C4DE;
        }
        #myborrow tr:first-child  {
            border-top-left-radius: 12px;
        }

        #myborrow tr:first-child {
            border-top-right-radius: 12px;
        }
        #myborrow tr:last-child  {
            border-bottom-left-radius: 12px;
        }

        #myborrow tr:last-child {
            border-bottom-right-radius: 12px;
        }
		#myborrow th:first-child {
            border-top-left-radius: 12px;
        }

        #myborrow th:last-child {
            border-top-right-radius: 12px;
        }
        #myborrow td:first-child {
            border-bottom-left-radius: 12px;
        }

        #myborrow td:last-child {
            border-bottom-right-radius: 12px;
        }
        #myhistory thead tr{
            height: 40px;
            line-height: 50px;
            width: 150px;
            /*background-color: pink;*/
        }
		#myhistory tbody tr {
            height: 30px;
            line-height: 50px;
            /*background-color: pink;*/
        }
        #myhistory tr th:first-child{/*设置table左边边框*/
            border-left: 2px solid #B0C4DE;
        }
		#myhistory tr td:first-child {/*设置table左边边框*/
            border-left: 2px solid #B0C4DE;
        }
        #myhistory tr th:last-child{/*设置table右边边框*/
            border-right: 2px solid #B0C4DE;
        }
       	#myhistory tr td:first-child,
        #myhistory tr td:nth-child(2),
        #myhistory tr td:nth-child(3),
        #myhistory tr td:nth-child(4),
        #myhistory tr td:nth-child(5),
        #myhistory tr td:nth-child(6),
        #myhistory tr th:first-child,
        #myhistory tr th:nth-child(2),
        #myhistory tr th:nth-child(3),
        #myhistory tr th:nth-child(4),
        #myhistory tr th:nth-child(5),
        #myhistory tr th:nth-child(6),
		#myhistory tr td:last-child {/*设置table右边边框*/
            border-right: 2px solid #B0C4DE;
        }
        #myhistory tr td:first-child,
        #myhistory tr td:nth-child(2),
        #myhistory tr td:nth-child(3),
        #myhistory tr td:nth-child(4),
        #myhistory tr td:nth-child(5),
        #myhistory tr td:nth-child(6),
        #myhistory tr td:last-child{/*设置table表格每列底部边框*/
            border-bottom: 2px solid #B0C4DE;
        }
        /*table tr:last-child td:first-child,
        table tr:last-child td:nth-child(2),
        table tr:last-child td:nth-child(3),
        table tr:last-child td:last-child{/!*设置table表格最后一列底部边框*!/
            border-bottom: 2px solid #000;
        }*/
        #myhistory tr th {
            background: #B0C4DE;
        }
        #myhistory tr:first-child  {
            border-top-left-radius: 12px;
        }

        #myhistory tr:first-child {
            border-top-right-radius: 12px;
        }
        #myhistory tr:last-child  {
            border-bottom-left-radius: 12px;
        }

        #myhistory tr:last-child {
            border-bottom-right-radius: 12px;
        }
		#myhistory th:first-child {
            border-top-left-radius: 12px;
        }

        #myhistory th:last-child {
            border-top-right-radius: 12px;
        }
        #myhistory td:first-child {
            border-bottom-left-radius: 12px;
        }

        #myhistory td:last-child {
            border-bottom-right-radius: 12px;
        }
	</style>
    <!-- diao style-->
	<style type="text/css">
		#myorder{
			margin-left:100px;
			margin-right:200px;
			margin-top:50px;
		}
		#addorder{
			margin-left:100px;
			margin-top:50px;
		}
        #ordertab
        {
            border-collapse: collapse;
            margin: 0 auto;
        }
        #ordertab td
        {
            border: 1px solid #cad9ea;
            color: #666;
            height: 30px;
        }
		#ordertab th
		{
			border: 1px solid #cad9ea;
            color: #666;
            height: 30px;
		}
        #ordertab thead th
        {
            background-color: #CCE8EB;
            width: 100px;
        }
        #ordertab tr:nth-child(odd)
        {
            background: #fff;
        }
        #ordertab tr:nth-child(even)
        {
            background: #F5FAFA;
        }
    </style>
</head>
<body>
	        <div class="wrap">
                <!-- 左边导航栏-->
                <div id="left" class="left">
                    <div id="logoDiv" class="logoDiv">
                        <p id="logoTitle" class="logoTitle">
                            <img id="logo" alt="picture-log" src="./imgs/logo.JPG" style="height: 28px; padding-right: 5px;vertical-align: middle;">
                            <span style="font-size:18px;">Reader</span>
                        </p>
                    </div>
                    <!-- hou -->
                    <div class="menu-item" data-toggle="collapse" data-target="#borrowcoll" onmouseover="mouseover('borrow')" onmouseout="mouseout('borrow')" id="borrow" style="font-weight: bold;color:#707983;">- Borrow And Order</div>
	                <div id="borrowcoll" class="collapse" style="background-color:#666666">
	                    <div class="menu-item" href="#jieyue" data-toggle="tab" onmouseover="mouseover('myborrowlist')" onmouseout="mouseout('myborrowlist')" id="myborrowlist"> 
	                         &nbsp;&nbsp;MyBorrowList
	                    </div>
	                    <div class="menu-item" href="#lishi" data-toggle="tab" onmouseover="mouseover('historylist');" onmouseout="mouseout('historylist')" id="historylist">
	                         &nbsp;&nbsp;HistoryList
	                    </div>
                    </div>
                 	<!-- diao -->
                    <div class="menu-item" data-toggle="collapse" data-target="#ordercoll" onmouseover="mouseover('my_order')" onmouseout="mouseout('my_order')" id="my_order" style="font-weight: bold;color:#707983;">- MyOrder</div>
	                <div id="ordercoll" class="collapse" style="background-color:#666666">
	                    <div class="menu-item" href="#myorder" data-toggle="tab" onmouseover="mouseover('orderlist')" onmouseout="mouseout('orderlist')" id="orderlist"> 
	                         &nbsp;&nbsp;OrderList
	                    </div>
	                    <div class="menu-item" href="#addorder" data-toggle="tab" onmouseover="mouseover('add_order');" onmouseout="mouseout('add_order')" id="add_order">
	                         &nbsp;&nbsp;AddOrder
	                    </div>
                    </div>              
                    <!-- xiang -->
                    <div class="menu-item" data-toggle="collapse" data-target="#informationcoll" onmouseover="mouseover('information')" onmouseout="mouseout('information')" id="information" style="font-weight: bold;color:#707983;">- PersonalInformation</div>
	                <div id="informationcoll" class="collapse" style="background-color:#666666">
	                    <div class="menu-item" href="#pm-container" data-toggle="tab" onmouseover="mouseover('baseinformation')" onmouseout="mouseout('baseinformation')" id="baseinformation"> 
	                         &nbsp;&nbsp;Modiy PersonalInformation
	                    </div>
	                    <div class="menu-item" href="#ps-container" data-toggle="tab" onmouseover="mouseover('safeinformation');" onmouseout="mouseout('safeinformation')" id="safeinformation">
	                         &nbsp;&nbsp;Change Password&Safe
	                    </div>
                    </div> 
					
                </div>
				
				<script type="text/javascript">
        			function modifyImformation(){
        				var email = document.getElementById("emailInput").value;
        				var phone = document.getElementById("phoneInput").value;
        				if(email != ""){
        					if(phone != ""){
        						if(confirm("Are you sure to modify the personal imformation?")){
        							modifyurl="modifyImformation?Email="+email+"&Phone="+phone;
        							window.location.href=modifyurl;
        							alert("modify successfully!");
        						}
        					}
        					else{
        						alert("please input the phone!");
        					}
        				}
        				else {
        					alert("please input the email!");
        				}
        			}
				</script>
                <div id="right" class="tab-content right">
                        <div id="one" class="tab-pane active">
                            <span style="margin-left:40px;text-shadow: 2px 0px 6px rgba(94, 35, 255, 0.91);">
                                   	<font size="10">Welcome to the page of Reader,${Reader.getAccount() }.</font>
                            </span>   
                        </div>
                         <!-- xiang -->
                       <div id="pm-container" class="tab-pane">
                            <div style="width: auto;height: 8px"></div>
								<div id="pm-head">
									<h3 style="text-indent: 5%">Personal Imformation</h3>
								</div>
								<hr style="color: black">
								<div id="pm-imformation" >
									<p>Account:<input id="accountInput" class="form-control" value="${reader.account}" readonly></p>
									<p>Eamil:<input id="emailInput" class="form-control" value="${reader.email}"></p>
									<p>Phone:<input id="phoneInput" class="form-control" value="${reader.phone}"></p>
									<p>Fine:<input id="fineInput" class="form-control" value="${reader.fine}" readonly></p>
									<p>BorrowedNum:<input id="borrowedNumInput" class="form-control" value="${reader.borrowedNum}" readonly></p>
									<p>CashPledge:<input id="cashPledgeInput" class="form-control" value="${reader.cashPledge}" readonly></p>
									</br>
									<button id="modify" class="btn btn-primary btn_search" onclick="modifyImformation()">modify</button>
           							<button id="cleanImformation" class="btn btn-primary btn-info">clean</button>
								</div>
						</div>
						<script type="text/javascript">
                            function changePassword(){
                            	var oldPassword = document.getElementById("oldPasswordInput").value;
                            	var newPassword = document.getElementById("newPasswordInput").value;
                            	var newPasswordAgain = document.getElementById("newPasswordInputAgain").value;
                            	if(oldPassword == "")
                            		alert("old password can't be null");
                            	else
                            		if(newPassword == "")
                            			alert("new password can't be null");
                            		else
                            			if(newPasswordAgain == "")
                            				alert("please input new password again");
                            			else
                            				{
                            				   if(newPassword == newPasswordAgain){
                            					   if(confirm("Are you sure to cahnge the password?")){
                          					  		 document.getElementById("oldPasswordInput").submit();
                          					  		 document.getElementById("newPasswordInput").submit();
                          					  		 document.getElementById("newPasswordInputAgain").submit();
                          					       }   
                            				   }
                            				   else
                            					   alert("the two input password is inconsistent.");
                            				}
                            	alert("passwordJudge");
                            }
                        </script>
							<div id="ps-container" class="tab-pane">
								<div style="width: auto;height: 8px"></div>
									<div id="pm-head">
  										<h3 style="text-indent: 5%">Personal Security</h3>
									</div>
									<hr style="color: black">
								<form method="post" action="changePassword">
								<div id="ps-security">
									<p>OldPassword:
									<input id="oldPasswordInput" name="OldPassword" class="form-control" placeholder="please input your old password" type="password" maxlength="16">
									</p>
									</br>
									<p>NewPassword:
									<input id="newPasswordInput" name="NewPassword" class="form-control" placeholder="please input your new password" type="password" maxlength="16">
									</p>
									</br>
									<p>
									NewPasswordInputAgain:<input id="newPasswordInputAgain" name="NewPasswordAgain" placeholder="please input your new password again" class="form-control" type="password" maxlength="16">
									</p>
									</br>
									<button id="cleanImformation" style="margin-left:100px;" class="btn btn-primary btn-info" onclick="changePassword">sumbit</button>
								</div>
								</form>
							</div>
                        <!-- xiang -->
                        <!-- hou -->
                		<div class="tab-pane" id="jieyue" style="position: relative">
            			<div id=wodejieyue class="table_wrap" style="text-align:center;display:block">
						<table id="myborrow" border="1" class="table" cellpadding="5" style="margin-left:5px;margin-right:30px">
						<caption style="text-align:center"><font size="5">Welcome，BorrowList${account}</caption>
						<tr>
				  			<th style="text-align:center;"><font size="4">No</font></th>				
				  			<th style="text-align:center;"><font size="4">BookID</font></th>
				  			<th style="text-align:center;"><font size="4">ReaderAccount</font></th>
				  			<th style="text-align:center;"><font size="4">BorrowDate</font></th>
				  			<th style="text-align:center;"><font size="4">ReturnDate</font></th>
				  			<th style="text-align:center;"><font size="4">Days</font></th>
				  			<th style="text-align:center;"><font size="4">Fine</font></th>
						</tr>
						<c:set var="userSum" value="0"/>
							<c:forEach items="${nowrecord}" var="nowrecord" varStatus="loop">
								<tr>
									<td><font size="4"><p id="bRID${nowrecord.bRID}">${loop.count}</p></font></td>
									<script>id1 = ${nowrecord.bRID}</script>
									<td><font size="4">${nowrecord.barCode}</font></td>
									<td><font size="4">${nowrecord.readerAccount}</font></td>
									<td><font size="4">${nowrecord.borrowedDate}</font></td>
									<td><font size="4">${nowrecord.returnedDate}</font></td>
									<td><font size="4">${nowrecord.reduceDate}Days</font></td>
									<td><font size="4">${nowrecord.fine}</font></td>
									<c:set var="userSum" value="${userSum+nowrecord.fine }"/>		
								</tr>
						</c:forEach>
						</table>
				
						<div id=123 style="text-align:right;display:block">
							<h3>FineSum：￥ ${userSum }</h3>
						</div>
						</div>
						</div>
						<div class="tab-pane" id="lishi" style="position: relative">
            				<div id=lishijieyue class="table_wrap" style="text-align:center;display:block">
								<table id="myhistory" border="1" class="table" cellpadding="5" style="margin-left:5px;margin-right:30px">
									<caption style="text-align:center"><font size="5">HistoryBorrowedList</caption>
										<tr>
				  							<th style="text-align:center;"><font size="4">No</font></th>				
				  							<th style="text-align:center;"><font size="4">BookID</font></th>
				  							<th style="text-align:center;"><font size="4">ReaderAccount</font></th>
				  							<th style="text-align:center;"><font size="4">BorrowDate</font></th>
				  							<th style="text-align:center;"><font size="4">ReturnDate</font></th>
				  							<th style="text-align:center;"><font size="4">Days</font></th>
										</tr>
									<c:forEach items="${borrowedRecord}" var="borrowedRecord" varStatus="loop">
										<tr>
											<td><font size="4"><p id="bRID${borrowedRecord.bRID}">${loop.count}</p></font></td>
											<script>id1 = ${borrowedRecord.bRID}</script>
											<td><font size="4">${borrowedRecord.barCode}</font></td>
											<td><font size="4">${borrowedRecord.readerAccount}</font></td>
											<td><font size="4">${borrowedRecord.borrowedDate}</font></td>
											<td><font size="4">${borrowedRecord.returnedDate}</font></td>
											<td><font size="4">${borrowedRecord.reduceDate}Days</font></td>	
										</tr>
									</c:forEach>
								</table>
							</div>
						</div>
                        <!-- hou -->
                        <!-- diao -->
						<div id="myorder" class="tab-pane">
                             <table id="ordertab" width="100%">
								<thead>
									<tr>
										<th>No</th>
										<th>BookName</th>
										<th>ReserveTime</th>
										<th>AffectTime</th>
										<th>Status</th>
										<th>Behavior</th>
							   		</tr>
								</thead>
							    <%
								SimpleDateFormat format = new SimpleDateFormat("HHmm");
								String nowtime= format.format(new Date());
								int intnowTime=Integer.parseInt(nowtime);
								int nowTime=(intnowTime%100)+(intnowTime-(intnowTime%100))/100*60;
								%>
								<c:set var="nowTime" value="<%=nowTime %>"/>
								<c:forEach items="${myorders }" var="myorder" varStatus="mo">
									<p><fmt:formatDate var="hout" value="${myorder.time}" pattern="HHmm"/></p><br>
									<tr>
										<th>${mo.index + 1}</th>
										<th>${myorder.bookName }</th>
										<th><fmt:formatDate value="${myorder.time }" type="both" dateStyle="medium" timeStyle="medium"/></th>
										<th><fmt:formatDate value="${myorder.time }" type="both" dateStyle="medium" timeStyle="medium"/></th>
										<c:choose>
										    <c:when test="${nowTime-((hout%100)+(hout-(hout)%100)/100*60)>120}">
										    	<th>超期</th>
										    </c:when>
										    <c:otherwise>
										    	<th>未超期</th>
										    </c:otherwise>
										</c:choose>
										<th><a href="deletOrder?rRID=${myorder.rRID}">Cancel</a></th>
									</tr>
								</c:forEach>
			    			</table>
                        </div>
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
                        					addOrder = "addOrder?barCode="+barcode_order+"&bookName="+bookName_order;
                                			location.href=addOrder;
                    
                                			alert("done");
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
                        <script>
                        function addOrder(barCode,bookName){
      						alert("hello");
                    		if (barCode != ""){
                    			if (bookName != ""){
                    				if(confirm("Are you sure about the appointment?")){
                    					addOrder = "addOrder?barCode="+barCode+"&bookName="+bookName;
                            			window.location.href=addOrder;
                            			alert("2");
                    				}
                        		}
                        		else{
                        			alert("please input bookName");
                        		}
                    		}
                    		else{
                    			alert("please input barCode");
                    		}
                    	}
                        </script>
                        <div id="addorder" class="tab-pane">
                        <form method="POST" action="searchBook">
                          <div id="search-container" style="margin-left:500px;margin-top:100px">
								<div id="search-iuput">
								  	<input id="searchBook" type="text" name="searchou" placeholder="please input key words">
								    <input id="search-button" type="submit" name="btn_submit" value="search"/>
								</div>
								<div style="height: 30px;"></div>
								<hr/>
							</div>
							</form>
							<div id=wodeyuyue class="table_wrap" style="text-align:center;display:block">
								<table id="myhistory" border="1" class="table" cellpadding="5" style="margin-left:5px;margin-right:30px">
									<caption style="text-align:center"><font size="5">SearchResult</caption>
										<tr>
				  							<th style="text-align:center;"><font size="4">barCode</font></th>				
				  							<th style="text-align:center;"><font size="4">bookName</font></th>
				  							<th style="text-align:center;"><font size="4">ISBN</font></th>
				  							<th style="text-align:center;"><font size="4">author</font></th>
				  							<th style="text-align:center;"><font size="4">publishing</font></th>
				  							<th style="text-align:center;"><font size="4">location</font></th>
				  							<th style="text-align:center;"><font size="4">introduction</font></th>
				  							<th style="text-align:center;"><font size="4">status</font></th>
				  							<th style="text-align:center;"><font size="4">dateOfStorage</font></th>
										</tr>
									<c:forEach items="${bookList}" var="bookList" varStatus="loop">
										<tr>
											<td><font size="4">${bookList.barCode}</font></td>
											<td><font size="4">${bookList.bookName}</font></td>
											<td ><font size="4">${bookList.ISBN}</font></td>
											<td><font size="4">${bookList.author}</font></td>
											<td><font size="4">${bookList.publishing}</font></td>
											<td><font size="4">${bookList.location}</font></td>	
											<td><font size="4">${bookList.introduction}</font></td>	
											<td><font size="4">${bookList.status}</font></td>	
											<td><font size="4">${bookList.dateOfStorage}</font></td>
											<th><a href="addOrder?barCode=${bookList.barCode}&bookName=${bookList.bookName}">Add</a></th>
										</tr>
									</c:forEach>
								</table>
							</div>
                            <p>barCode</p><input class="form-control" id="barCode_order" placeholder="please input barCode" style="width:300px;">
                            <p>bookName</p><input class="form-control" id="bookName_order" placeholder="please input bookName" style="width:300px;"><br/>
                            <button id="saveorder" class="btn btn-primary btn_search" onclick="saveorder()">save</button>
                            <button id="cleanorder" class="btn btn-primary btn-info" onclick="cleanorder()">clean</button>
                        </div>
                </div>
        </div>
</body>
    <script>
         $(function() {
           		$(".menu-item").click(function() {
                    $(".menu-item").removeClass("menu-item-active");
                    $(this).addClass("menu-item-active");
                    var itmeObj = $(".menu-item").find("img");
                    itmeObj.each(function() {
                        var items = $(this).attr("src");
                        items = items.replace("_grey.png", ".png");
                        items = items.replace(".png", "_grey.png")
                        $(this).attr("src", items);
                    });
                    var attrObj = $(this).find("img").attr("src");;
                    attrObj = attrObj.replace("_grey.png", ".png");
                    $(this).find("img").attr("src", attrObj);
                });
            });
            function changeFrameHeight(){
				var ifm=document.getElementById("fourIfm"); 
            	ifm.height = document.documentElement.clientHeight;
            }
            window.onresize=function(){  
                 changeFrameHeight();  
            }
            function mouseover(divname){
            	var color=document.getElementById(divname);
            	color.style.color="#FFFFFF";
            }
            function mouseout(divname){
            	 var color=document.getElementById(divname);
               	 color.style.color="#aab1b7";
            }
    </script>
</body>
</html>