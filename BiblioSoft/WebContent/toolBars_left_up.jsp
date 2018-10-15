<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=uft-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="js/jquery.min.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="js/bootstrap.min.js"></script>
<title>Biblio -borrow books</title>
<!-- Bootstrap -->
<link href="./css/bootstrap-4.0.0.css" rel="stylesheet">
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
</head>
<body>
	<script src="js/jquery-1.11.3.min.js"></script>

	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.js"></script>





	<div class="row" style="padding-left: 1%">

		<!--------------------------------------------下方是左边导航条代码-------------------------------------------------------->
		<div class="col-md-2 " style="background: #186DAD; color: aliceblue">
			<br>
			<div class="panel panel-default">
				<div class="panel-heading" style="background-color: aliceblue">
					<div align="center" style="background-color: aliceblue">

						<img src="./imgs/libraianProfile1.JPG" height="100px"
							style="float: inherit">
					</div>

					<hr>
					<h3 class="panel-title" align="center"
						style="font-size: 20px; color: #191D30">
						<a>User_Name</a>
					</h3>

					<br>
					<p align="center" style="font-size: 16px; color: #191D30">Biblo's
						librarian in Company</p>
				</div>

			</div>
			<hr>
			<div id="left" class="left">
				<div class="menu-title">Book Management</div>
				<div class="menu-item" href="#one" data-toggle="tab">
					<a href="#one" style="color: #F0F8FF">－Add Book</a>
				</div>
				<div class="menu-item" href="#two" data-toggle="tab">
					<a href="#one" style="color: #F0F8FF">－Delete Book</a>
				</div>
				<div class="menu-item" href="#test" data-toggle="tab">
					<a href="#one" style="color: #F0F8FF">－Modify Book</a>
				</div>
				<hr>
				<div class="menu-title">Reader Management</div>
				<div class="menu-item" href="#three" data-toggle="tab">
					<a href="#one" style="color: #F0F8FF">－Add Reader</a>
				</div>
				<div class="menu-item" href="#four" data-toggle="tab">
					<a href="#one" style="color: #F0F8FF">－Delete Reader</a>
				</div>
				<div class="menu-item" href="#four" data-toggle="tab">
					<a href="#one" style="color: #F0F8FF">－Modify Reader</a>
				</div>
				<div class="menu-item" href="#four" data-toggle="tab">
					<a href="#one" style="color: #F0F8FF">－Delete Reader</a>
				</div>
				<div class="menu-item" href="#four" data-toggle="tab">
					<a href="#one" style="color: #F0F8FF">－Delete Reader</a>
				</div>
			</div>
			<hr>
			<div class="menu-title">Borrow & Return</div>
			<div class="menu-item" href="#three" data-toggle="tab">
				<a href="#one" style="color: #F0F8FF">－Borrow Book</a>
			</div>
			<div class="menu-item" href="#four" data-toggle="tab">
				<a href="#one" style="color: #F0F8FF">－Return Book</a>
			</div>
			<br>
		</div>
		<!----------------------------------------------------------------------------------------------------------------->







		<!-----------------------------------------------下方是右边栏目的代码------------------------------------------------->
		<div class="text-center col-md-10" style="background-color: aliceblue">

			<!---------------------------------------------------上方导航条代码开始---------------------------------------------->
			<nav class="navbar navbar-expand-lg navbar-dark"
				style="background-color: #002A5A;height: 10%"> <a
				class="navbar-brand" href="#">Biblo</a>
			<ul class="nav navbar-nav">
				<img src="./images/logo.JPG"
					style="padding-top: 2px; padding-left: 5px; height: 50px">
				<span class="sr-only">(current)</span>
			</ul>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon" style="background-color: #002A5A"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent"
				style="background-color: #002A5A">
				<ul class="navbar-nav ">
					<li class="nav-item active"><a class="nav-link" href="#"
						style="background-color: #002A5A">Home <span class="sr-only">(current)</span></a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#"
						style="background-color: #002A5A">Link1</a></li>
					<li class="nav-item dropdown" style="background-color: #002A5A">
						<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false" style="background-color: #002A5A">
							Dropdown </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown"
							style="background-color: #002A5A">
							<a class="dropdown-item" href="#"
								style="background-color: #002A5A">Action</a> <a
								class="dropdown-item" href="#" style="background-color: #002A5A">Another
								action</a>
							<div class="dropdown-divider" style="background-color: #002A5A"></div>
							<a class="dropdown-item" href="#"
								style="background-color: #002A5A">Something else here</a>
						</div>
					</li>
					<li class="nav-item" style="background-color: #002A5A"><a
						class="nav-link disabled" href="#"
						style="background-color: #002A5A">Disabled</a></li>

				</ul>
				<ul class="navbar-nav mr-auto" style="background-color: #002A5A">
					<form class="form-inline my-2 my-lg-0" style="float: left;"
						style="background-color: #002A5A">
						<input class="form-control mr-sm-2" type="search"
							placeholder="Grimms Fairytales" aria-label="Search">
						<button class="btn btn-outline-warning my-2 my-sm-0" type="submit">Search</button>
					</form>
				</ul>


				<ul class="nav navbar-nav navbar-right"
					style="background-color: #002A5A">
					<li>" "</li>
					<!--li><a href="#" style="font-weight:bold; color: #FECD00">登  陆</a></li>
								<li>"  "</li>
		<li><a href="#" style="color:#C8C8C8" >注  册</a></li-->
					<li><a href="#" style="color: #C8C8C8">Log out</a></li>
				</ul>
			</div>
			</nav>

			<!----------------------------------------------------------------------------------------------------------------->


			<!------------------------------------------这里是一个面板放比如说你这个功能是借书，就放borrow book的模块进去---------->
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title" align="left"
						style="font-size: 20px; color: #191D30; padpadding-left: 20px">
						<a>Borrow Book</a>
					</h3>
				</div>
				<div align="center" style="background-color: aliceblue">

					<div class="panel-body" style="">
						<!---------------------------------------------------------------------------------------------------------->

						<div>
							<row>
							<form method="post" action="borrowBook" id="borrowbook">

								<div
									style="float: left; font-size: 18px; color: #002A5A; width: 10%;">Book
									ID :</div>
								<input name="barCode" type="text" class="form-control"
									placeholder="Input Book Id" aria-describedby="sizing-addon1">
								<div
									style="float: left; font-size: 18px; color: #002A5A; width: 10%;">Borrower
									ID :</div>
								<input name="useraccount" type="text" class="form-control"
									placeholder="Input UserAccount"
									aria-describedby="sizing-addon1"> <br>
								<button type="button" class=" btn btn-success btn-lg"
									data-toggle="modal" data-target="#myModal">OK</button>

								<hr>
							</form>

							</a> <!-------------------------下方是一个弹窗--点击ok按钮就会蹦出来可以自己修改弹窗上面的字------------------------->
							<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
								aria-labelledby="myModalLabel" style="top: 30%">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
											<h4 class="modal-title" id="myModalLabel"></h4>
										</div>

										<div class="modal-body">Are you sure you want to submmit
											and save?</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default"
												data-dismiss="modal">Close</button>
											<button type="button" class="btn btn-primary"
												onclick="borrowbook()">Save now</button>
										</div>
									</div>
								</div>
							</div>
							<!----------------------------------------------------------------------------------------------->




							<div class="well" style="width: 700; background-color: aliceblue">

								<!------------------------------这里放入自己的代码----------------------------------------------->









								代码段1














								<!------------------------------------------------------------------------------------------------------->
							</div>
							</row>
						</div>


					</div>
					<hr>
					<br>
				</div>


			</div>
			<div class="well" style="width: 700; background-color: aliceblue">

				<!------------------------------这里也可以放入自己的代码--会出现在面板外面--------------------------------------------->


				代码段2




















				<!------------------------------------------------------------------------------------------------------->
			</div>

			<!---------------------------------右边栏目结束---------------------------------------------------------------------->
			<script src="js/jquery-1.11.3.min.js"></script>
			<!-- Include all compiled plugins (below), or include individual files as needed -->
			<script src="js/bootstrap.js"></script>

		</div>
	</div>




	<!---------------------------------------------下方是页脚---------------------------------------------------------->

	<br>
	<hr>
	<div class="row">
		<div class="text-center col-lg-6 offset-lg-3">
			<h4>Biblio</h4>
			<p>
				Our website is willing to provide help for book management for
				users.<br>
				<a href="#">SPM A3's Website</a>
			</p>
		</div>
	</div>
	<!-------------------------------------------------------------------------------------------------------------->

</body>
</html>
