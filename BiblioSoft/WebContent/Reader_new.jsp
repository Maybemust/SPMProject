<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.text.*" %>
<!doctype html>
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
			margin-top:50px;
			width:1200px;
			margin-left: 20px;
			margin-right: 100px;
			position: relative;
			text-align:center;
		}
		#wodejieyue{
			margin-top:50px;
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
		#wodeyuyue{
			margin-top:50px;
			width:1200px;
			margin-left: 20px;
			margin-right: 100px;
			position: relative;
			text-align:center;
		}
	</style>
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
		#addorder{
			margin-top:50px;
			width:1200px;
			margin-left: 20px;
			margin-right: 100px;
			position: relative;
			text-align:center;
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
    </style>
<!-- welcome style by xiang-->
	<style>
		#welcome{
	   		margin-top: 30px;
	   		margin-left:240px;
	   		text-shadow: 2px 0px 6px rgba(94, 35, 255, 0.91);
	   		width: 1000px;
	   		height: 100px;
	  	}
	  	#post-imformation{
	  	    width: 1000px;
	  	    
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
				
				<!-- 添加导航栏所链接的内容-->
				
                <div id="right" class="tab-content right">
                        <div id="one" class="tab-pane active">
                            <div id="welcome">
                            	<font size="10" style="color: gray;">Welcome to the page of Reader,${Reader.getAccount() }.</font>
                            </div>
                            <div id="post-information">
                             	<h2 style="margin-left: 250px;">Post Information :</h2>
                            	<table id="ordertab" border="1" cellpadding="5"> 
                            	<thead>
                            		<tr>
                            			<th style="text-align: certer;width: 200px;"><font size="4" style="margin-left:86px;">Title</th>
                            			<th style="text-align: center;width: 500px;"><font size="4">Text</th>
                            			<th style="text-align: center;width: 200px;"><font size="4">Post Time</th>
                            		</tr>
                            	</thead>
                            	<c:forEach items="${posts}" var="post" varStatus="counter">
                            		<tr>
                            			<td style="text-align: center"><a target="_blank" href="#" style="color:black">${post.getPostTitle() }</a></td>
                            			<td style="text-align: center"><a target="_blank" href="#" style="color:black">${post.getText() }</a></td>
                            			<td style="text-align: center">${post.getTime() }</td>
                            		</tr>
                            	</c:forEach>
                            	</table>
                            </div>   
                        </div>
                         <!-- xiang -->
                         <script type="text/javascript">
        					function modifyImformation(){
        						var email = document.getElementById("emailInput").value;
        						var phone = document.getElementById("phoneInput").value;
        						if(email != ""){
        							if(phone != ""){
        								if(confirm("Are you sure to modify the personal imformation?")){
        									modifyurl="modifyImformation?Email="+email+"&&Phone="+phone;
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
									<br/>
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
									<br/>
									<p>NewPassword:
									<input id="newPasswordInput" name="NewPassword" class="form-control" placeholder="please input your new password" type="password" maxlength="16">
									</p>
									<br/>
									<p>
									NewPasswordInputAgain:<input id="newPasswordInputAgain" name="NewPasswordAgain" placeholder="please input your new password again" class="form-control" type="password" maxlength="16">
									</p>
									<br/>
									<button id="cleanImformation" style="margin-left:100px;" class="btn btn-primary btn-info" onclick="changePassword">sumbit</button>
								</div>
								</form>
							</div>
                        <!-- xiang -->
                        <!-- hou -->
                		<div class="tab-pane" id="jieyue" style="position: relative">
            			<div id="wodejieyue"  style="text-align:center;display:block">
            			<h2  style="text-align:center;">Welcome to BorrowList page,${reader.getAccount()}!</h2>
						<table id="ordertab" border="1" width=100% cellpadding="5" style="margin-left:5px;margin-right:30px;">
						<thead>
						<tr>
				  			<th style="text-align:center;"><font size="4">No</font></th>				
				  			<th style="text-align:center;"><font size="4">BookID</font></th>
				  			<th style="text-align:center;"><font size="4">ReaderAccount</font></th>
				  			<th style="text-align:center;"><font size="4">BorrowDate</font></th>
				  			<th style="text-align:center;"><font size="4">ReturnDate</font></th>
				  			<th style="text-align:center;"><font size="4">Days</font></th>
				  			<th style="text-align:center;"><font size="4">Fine</font></th>
						</tr>
						</thead>
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
            				<div id="lishijieyue" style="text-align:center;display:block">
								<table id="ordertab" border="1"  style="margin-left:5px;margin-right:30px;width:100%">
									<thead>
										<tr>
				  							<th style="text-align:center;"><font size="4">No</font></th>				
				  							<th style="text-align:center;"><font size="4">BookID</font></th>
				  							<th style="text-align:center;"><font size="4">ReaderAccount</font></th>
				  							<th style="text-align:center;"><font size="4">BorrowDate</font></th>
				  							<th style="text-align:center;"><font size="4">ReturnDate</font></th>
				  							<th style="text-align:center;"><font size="4">Days</font></th>
										</tr>
										</thead>
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
                         <script>
                        	function deletOrder(rRID){
                        		var deletOrder="deletOrder?rRID="+rRID;
                        		alert(deletOrder);
                        		window.location.href=deletOrder;		
                        	}
                        </script>
						<div id="myorder" class="tab-pane" style="text-align:center;postion:relative;">
						<div style="display:block" >
                             <table id="ordertab" border="1" width=100% cellpadding="5" style="margin-left:5px;margin-right:30px;">
								<thead>
									<tr>
										<th style="text-align:center;"><font size="4">No</th>
										<th style="text-align:center;"><font size="4">BookName</th>
										<th style="text-align:center;"><font size="4">ReserveTime</th>
										<th style="text-align:center;"><font size="4">AffectTime</th>
										<th style="text-align:center;"><font size="4">Status</th>
										<th style="text-align:center;"><font size="4">Behavior</th>
							   		</tr>
								</thead>
						
								<c:forEach items="${myorders }" var="myorder" varStatus="mo">
									
									<tr>
										<td><font size="4">${mo.index + 1}</td>
										<td><font size="4">${myorder.bookName }</td>
										<td><font size="4"><fmt:formatDate value="${myorder.time }" type="both" dateStyle="medium" timeStyle="medium"/></td>
										<td><font size="4"><fmt:formatDate value="${myorder.time }" type="both" dateStyle="medium" timeStyle="medium"/></td>
										<c:choose>
										    <c:when test="${nowTime-((hout%100)+(hout-(hout)%100)/100*60)>120}">
										    	<td>超期</td>
										    </c:when>
										    <c:otherwise>
										    	<td>未超期</td>
										    </c:otherwise>
										</c:choose>
										<td><font size="4"><a onclick="deletOrder(${myorder.rRID})" style="color:black;">Cancel</a></td>
									</tr>
								</c:forEach>
			    			</table></div>
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
                        					addOrder = "addOrder?barCode="+barcode_order+"&&bookName="+bookName_order;
                                			window.location.href=addOrder;
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
                        function addorder(barCode,bookName){
                    		if (barCode != ""){
                    			if (bookName != ""){
                    				if(confirm("Are you sure about the appointment?")){
                    					addOrder = "addOrder?barCode="+barCode+"&&bookName="+bookName;
                            			window.location.href=addOrder;
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
                        <div id="addorder" class="tab-pane"style="width:100%;margin-top:0px;margin-left:0px;">
							<iframe src="ReaderaddOrder.jsp" style="width:100%;height:730px;margin-top:0px;">
							</iframe>

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