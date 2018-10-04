<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<title>version1.1</title>
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<style>
		#userdefine{
			margin-left: 25%;
			margin-right: 25%;
			height: 150px;
			text-align: center;
			font-size: 50px;
		}
		#picture{
			float: left;
			width: 150px;
			height: 150px;
			position: relative;
			
		}
		#information{
			float: left;
			width: 250px;
			height: 150px;
			position: relative;
		}
		#daohang{
			margin-left: 25%;
			margin-right: 25%;
		}
		#neirong{
			margin-left: 25%;
			margin-right: 25%;
			position: relative;
		}
		#fenyeqi{
			position: relative;
        	bottom: -35px;
			margin-left: 30%;
        
		}
		@media screen and (max-width: 1100px){
			#daohang{
				margin-left: 15%;
				margin-right: 15%;
			}
			#neirong{
				margin-left: 15%;
				margin-right: 15%;
				position: relative;
			}
			#userdefine{
				margin-left: 15%;
				margin-right: 15%;
			}
		}
		@media screen and (max-width: 900px){
			#daohang{
				margin-left: 10%;
				margin-right: 10%;
			}
			#neirong{
				margin-left: 10%;
				margin-right: 10%;
				position: relative;
			}
			#userdefine{
				margin-left: 10%;
				margin-right: 10%;
				position: relative;
			}
		}
		@media screen and (max-width: 800px){
			#daohang{
				margin-left: 0%;
				margin-right: 0%;
			}
			#neirong{
				margin-left: 0%;
				margin-right: 0%;
				position: relative;
			}
			#userdefine{
				margin-left: 0%;
				margin-right: 0%;
			}
		}
		@media screen and (max-width: 500px){
			#daohang{
				width: 500px;
			}
			#neirong{
				width: 500px;
				position: relative;
			}
			#userdefine{
				width: 500px;
			}
		}
	</style>
	<!-- diao style-->
	<style type="text/css">
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
	<!--hou style-->
	<style>
		#zhinajin{
			margin-left: 0%;
			margin-right: 0%;
			position: relative;
			text-align:center;
		}
		#wodejieyue{
			margin-left: 0%;
			margin-right: 0%;
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
            border-left: 2px solid #eaeaea;
        }
		#myborrow tr td:first-child {/*设置table左边边框*/
            border-left: 2px solid #eaeaea;
        }
        #myborrow tr th:last-child{/*设置table右边边框*/
            border-right: 2px solid #eaeaea;
        }
		#myborrow tr td:last-child {/*设置table右边边框*/
            border-right: 2px solid #eaeaea;
        }
        #myborrow tr td:first-child,
        #myborrow tr td:nth-child(2),
        #myborrow tr td:nth-child(3),
        #myborrow tr td:nth-child(4),
        #myborrow tr td:nth-child(5),
        #myborrow tr td:nth-child(6),
        #myborrow tr td:last-child{/*设置table表格每列底部边框*/
            border-bottom: 2px solid #eaeaea;
        }
        /*table tr:last-child td:first-child,
        table tr:last-child td:nth-child(2),
        table tr:last-child td:nth-child(3),
        table tr:last-child td:last-child{/!*设置table表格最后一列底部边框*!/
            border-bottom: 2px solid #000;
        }*/
        #myborrow tr th {
            background: #eaeaea;
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
	</style>
	<!--xiang-->
	<style>
		#history{
			position: relative;
			height: 50px;
			background:#B8D6F0;
			border-radius: 10px;
		}
		#history-bookdetial{
			width: auto;
			height: 30px;
		}
		#history-id{
			float: left;
			width: 10%;
			height: 30px;
		}
		#history-name{
			float: left;
			width: 50%;
			height: 30px;
		}
		#history-dateb{
			float: left;
			width: 20%;
			height: 30px;
		}
		#history-dater{
			float: left;
			width: 20%;
			height: 30px;
		}
		#historydata{
			position: relative;
			width: auto;
		}
		#myhistory tr:first-child{
			border-top-left-radius: 10px;
		}
		#myhistory td:first-child{
			border-top-left-radius: 10px;
		}
		#myhistory tr:last-child{
			border-top-right-radius: 10px;
		}
		#myhistory td:last-child{
			border-top-right-radius: 10px;
		}
		#myhistory tr:first-child{
			border-bottom-left-radius: 10px;
		}
		#myhistory td:first-child{
			border-bottom-left-radius: 10px;
		}
		#myhistory tr:last-child{
			border-bottom-right-radius: 10px;
		}
		#myhistory td:last-child{
			border-bottom-right-radius: 10px;
		}
	</style>
</head>

<body>
	<div id="userdefine">
		<div id="picture">
			<h5>这个地方用来给用用户放个假头像</h5>
		</div>
		<div id="information">
			<h5>这个地方用来读取个人信息然后展示</h5>
		</div>
	</div>
	<nav class="navbar navbar-default" role="navigation" id="daohang">
		<div class="container-fluid">
    	<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#example-navbar-collapse">
				<span class="sr-only">切换导航下拉键</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
        	<a class="navbar-brand">个人中心</a>
    	</div>
   		<div class="collapse navbar-collapse" id="example-navbar-collapse">
        	<ul class="nav navbar-nav">
            	<li class="active"><a href="#home" data-toggle="tab">我的借阅</a></li>
            	<li><a href="#myborrowhistory" data-toggle="tab">历史借阅</a></li>
				<li><a href="#myorder" data-toggle="tab">我的预约</a></li>
				<li><a href="#zhinajin" data-toggle="tab">滞纳金</a></li>
				<li><a href="#changeinf" data-toggle="tab">修改个人资料</a></li>
           		<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">备用菜单<b class="caret"></b></a>
                	<ul class="dropdown-menu">
                    	<li><a href="#" data-toggle="tab">看情况</a></li>
                    	<li><a href="#">如果不用</a></li>
                   	 	<li><a href="#">直接删除</a></li>
                   		<li class="divider"></li>
                    	<li><a href="#">要的话加内容</a></li>
                    	<li class="divider"></li>
                    	<li><a href="#">不要的话定稿再删</a></li>
                	</ul>
            	</li>
        	</ul>
    	</div>
    	</div>
	</nav>
	
	<div id="neirong">
		<div class="tab-content" style="width: 100%">
			<!--hou-->
        	<div class="tab-pane fade in active" id="home" style="position: relative">
            	<div id=wodejieyue class="table_wrap" style="text-align:center;">
				<table id="myborrow" border="1" class="table" cellpadding="5" style="margin:0 auto">
				<caption style="text-align:center"><font size="5">欢迎您，${readeraccount}</caption>
				<caption style="text-align:center"><font size="4">借阅列表</caption>
				<tr>
				  <th style="text-align:center;"><font size="4">序号</th>				
				  <th style="text-align:center;"><font size="4">图书ID</th>
				  <th style="text-align:center;"><font size="4">借阅者</th>
				  <th style="text-align:center;"><font size="4">借阅日期</th>
				  <th style="text-align:center;"><font size="4">应归还时间</th>
				  <th style="text-align:center;"><font size="4">借阅时间</th>
				  <th style="text-align:center;"><font size="4">所欠滞纳金</th>
				</tr>
				<c:set var="userSum" value="0"/>
				<c:forEach items="${borrowedRecords}" var="borrowedRecord" varStatus="loop">
						<tr>
							<td><p id="bRID${borrowedRecord.bRID}">${loop.count}</p></td>
							<script>id1 = ${borrowedRecord.bRID}</script>
							<td>${borrowedRecord.barCode}</td>
							<td>${borrowedRecord.readerAccount}</td>
							<td>${borrowedRecord.borrowedDate}</td>
							<td>${borrowedRecord.returnedDate}</td>
							<td>${date[loop.count-1]}</td>
							<td>${borrowedRecord.fine}</td>
							<c:set var="userSum" value="${userSum+borrowedRecord.fine }"/>		
						</tr>
				</c:forEach>
				</table>
				<c:if test="${borrowedRecords!=NULL}">
        			<h3 style="text-align:right;">欠费总额：${userSum }元</h3>
      			</c:if>
				
			</div>
        </div>
		
		<div id=zhinajin class="tab-pane fade">

				<div id="show" class="table_wrap">
				<table id="myborrow" border="1" class="table" style="margin:0 auto">
				<tr>
				  <th style="text-align:center;">序号</th>
				  <th style="text-align:center;">图书ID</th>
				  <th style="text-align:center;">借阅日期</th>
				  <th style="text-align:center;">应归还时间</th>
				  <th style="text-align:center;">借阅时间</th>
				  <th style="text-align:center;">所欠滞纳金</th>
				</tr>
				<c:set var="zhinasum" value="0"/>
				<c:forEach items="${borrowedRecords}" var="borrowedRecord" varStatus="loop">
						<tr>
							<td><p id="bRID${borrowedRecord.bRID}">${loop.count}</p></td>
							<script>id1 = ${borrowedRecord.bRID}</script>
							<td>${borrowedRecord.barCode}</td>
							<td>${borrowedRecord.borrowedDate}</td>
							<td>${borrowedRecord.returnedDate}</td>
							<td>${date[loop.count-1]}</td>
							<td>${borrowedRecord.fine}</td>
							<c:set var="userSum" value="${userSum+borrowedRecord.fine }"/>		
							</tr>
				</c:forEach>
				<tr>
				  <td align="center">合计</td>
				  <td align="center"> </td>
				  <td align="center"> </td>
				  <td align="center"> </td>
				  <td align="center"> </td>
				  <td align="center">${zhinasum}元</td>
				</tr>
				</table>
				</div>

				<div id="show2" style="display:none">
				<table border="1" style="margin:0 auto">
				<tr>
				  <th style="text-align:center;">图书ID</th>
				  <th style="text-align:center;">图书名</th>
				  <th style="text-align:center;">借阅日期</th>
				  <th style="text-align:center;">应归还时间</th>
				  <th style="text-align:center;">超出时间</th>
				  <th style="text-align:center;">所欠滞纳金</th>
				</tr>
				<tr>
				  <td align="center">034</td>
				  <td align="center">计算机图形学</td>
				  <td align="center">2018-8-25</td>
				  <td align="center">2018-9-25</td>
				  <td align="center">6天</td>
				  <td align="center">80元 </td>
				</tr>
				</table>
				</div>
			</div>
			<script type="text/javascript">
				function dispmes()
				{
					alert("支付成功");
				}
			</script>
		<!--xiang-->
		<div class="tab-pane fade" id="myborrowhistory" style="position: relative">
            	<div style="padding:10px;">
					<table id="ordertab" width="100%">
						<thead>
							<tr>
								<th>序号</th>
								<th>书名</th>
								<th>借阅时间</th>
								<th>归还时间</th>
							</tr>
						</thead>
						<c:forEach items="${borrowedRecords }" var="borrowedRecord" varStatus="status">
							<tr>
								<th>${status.index + 1}</th>
								<th>${borrowedRecord.barCode }</th>
								<th>${borrowedRecord.borrowedDate }</th>
								<th>${borrowedRecord.returnedDate }</th>
							</tr>
						</c:forEach>
			    	</table>
				</div>
           </div>
		<!--diao-->
		<div class="tab-pane fade" id="myorder" style="position: relative">
            <div style="padding:10px;">
				<table id="ordertab" width="100%">
					<thead>
						<tr>
							<th>序号</th>
							<th>书名</th>
							<th>预约时间</th>
							<th>有效时间</th>
							<th>状态</th>
						</tr>
					</thead>
					<c:forEach items="${myorders }" var="myorder" varStatus="mo">
						<tr>
							<th>${mo.index + 1}</th>
							<th>${myorder.barCode }</th>
							<th>${myorder.time }</th>
							<th>${myorder.time }</th>
							<th>取消</th>
						</tr>
					</c:forEach>
			    </table>
			</div>
		</div>
		<script>
			function changepd(){
				if(confirm("确认修改密码"))
				{
					var oldpd=prompt("旧密码");
					var newpd1=prompt("新密码");
					var newpd2=prompt("确认新密码");
					if (newpd1 == newpd2)
					{
						alert("same");
					}
					else
					{
						alert("different");
					}
				}
				else
				{
					alert("您取消了修改密码");
				}
	
			}
			function changesafe(){
				if(confirm("确认修改密保"))
				{
					var oldpd=prompt("旧密保");
					var newpd1=prompt("新密保");
					var newpd2=prompt("确认新密保");
					if (newpd1 == newpd2)
					{
						alert("same");
					}
					else
					{
						alert("different");
					}
				}
				else
				{
					alert("您取消了修改密保");
				}
			}
			
		</script>
	
		<div class="tab-pane fade" id="changeinf" style="position: relative">
			<table id="ordertab" width="100%">
      			<tr>
					<td>账号</td>
					<td>${reader.account }</td>
				</tr>
				<tr>
					<td>昵称</td>
					<td></td>
				</tr>
				<tr>
					<td>押金</td>
					<td>${reader.cashPledge }</td>
				</tr>
				<tr>
					<td>正在借阅</td>
					<td><a>详情</a></td>
				</tr>
				<tr>
					<td>密码</td>
					<td><button onclick="changepd()">修改密码</button></td>
				</tr>
				<tr>
					<td>密保</td>
					<td><button onclick="checksafe()">验证密保</button></td>
				</tr>
				<tr>
					<td></td>
					<td><button onclick="changesafe()">修改密保</button></td>
				</tr>
    		</table>
		</div>
     </div>
  </div>
</body>
</html>
