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


	<div class="row" style="padding-left: 1%">

		<!--div class="col-md-2 "  style="background:#06246B;color:aliceblue"-->
		<div class="col-md-2 " style="background: #186DAD; color: aliceblue">
			<div class="panel panel-default">
				<div class="panel-heading">
					<br>
					<div align="center" style="background-color: aliceblue">
						<br> <img src="./imgs/libraianProfile1.JPG" height="100px"
							style="float: inherit">
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
				<!--div class="panel-body">
        <a href="#" style="font-weight:bold; color:#BCBCBC; float:right;padding-right: 10px">发帖数目</a>
		<a href="#" style="color:#C8C8C8;padding-right: 10px" ></a>
  </div-->
			</div>
			<hr>
			<div id="left" class="left">
				<div class="menu-title">
					<a href="bookList" target="mainFrame" style="color: #F0F8FF">Book
						Management</a>
				</div>

				<div class="menu-item" href="#one">
					<a href="bookadd.jsp" target="mainFrame" style="color: #F0F8FF">－Add
						Book</a>
				</div>

				<div class="menu-item" href="#two" data-toggle="tab">－Delete
					Book</div>
				<div class="menu-item" href="#test" data-toggle="tab">－Modify
					Book</div>
				<hr>
				<div class="menu-title">
					<a href="readerList" target="mainFrame" style="color: #F0F8FF">Reader
						Management</a>
				</div>

				<div class="menu-item" href="#three">
					<a href="readeradd.jsp" target="mainFrame" style="color: #F0F8FF">－Add
						Reader</a>
				</div>

				<div class="menu-item" href="#four" data-toggle="tab">－Delete
					Reader</div>
				<div class="menu-item" href="#four" data-toggle="tab">－Modify
					Reader</div>
				<div class="menu-item" href="#four" data-toggle="tab">－Delete
					Reader</div>
				<div class="menu-item" href="#four" data-toggle="tab">－Delete
					Reader</div>
			</div>
			<hr>
			<div class="menu-title">Borrow & Return</div>
			<div class="menu-item" href="#three">
				<a href="LibrarianBorrowBook.jsp" style="color: #F0F8FF">－Borrow
					Book</a>
			</div>

			<div class="menu-item" href="#four">
				<a href="LibrarianReturnBook.jsp" style="color: #F0F8FF">－Return
					Book</a>
			</div>
			<br>
		</div>


		<div class="text-center col-md-10" style="background-color: aliceblue">
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
			<!--div class="well" style= "width:700;background-color: aliceblue"><strong-->

			<!--div class="panel panel-default">
  <div class="panel-heading">Panel heading without title</div>
  <div class="panel-body">
    Panel content
  </div>
</div-->

			<!--div class="panel panel-default">
  <div class="panel-heading">
    <h3 class="panel-title">Panel title</h3>
  </div>
  <div class="panel-body">
    Panel content
  </div>
</div-->

			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title" align="left"
						style="font-size: 20px; color: #191D30; padpadding-left: 20px">
						<a>Borrow Book</a>
					</h3>
				</div>
				<div align="center" style="background-color: aliceblue">

					<div class="panel-body" style="">

						<!--div class="input-group input-group-lg">
  <span class="input-group-addon" id="sizing-addon1">Book ID</span>
  <input type="text" class="form-control" placeholder="Username" aria-describedby="sizing-addon1">
	<span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span>
</div>
			  <div class="input-group">
  <span class="input-group-addon">$</span>
  <input type="text" class="form-control" aria-label="Amount (to the nearest dollar)">
	<span class="glyphicon glyphicon-menu-right" ></span>
</div-->

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
									aria-describedby="sizing-addon1" required="required" 
													> <br>
								<button type="button" class=" btn btn-success btn-lg"
									data-toggle="modal" data-target="#myModal">OK</button>

								<hr>
							</form>

							</a> <script>
		function borrowbook2(){
			print("aegwgrg==============================================");
			document.getElementById("borrowbook").submit();
		}
	</script>
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
												onclick="borrowbook2()">Save now</button>
										</div>
									</div>
								</div>
							</div>
							<c:if test="${borrowBook.getStatus() == 2}">
								<div class="modal-body">
									<h4 style="color: #002A5A">This book has already been
										borrowed!!</h4>


								</div>
							</c:if> <c:if test="${ifExist == 0}">
								<div class="modal-body">
									<h4 style="color: #002A5A">Cannot find this book!</h4>

								</div>
							</c:if>


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

										<div class="modal-body">
											<c:if test="${borrowBook.getStatus() == 2}">
        Submmit Successfully!
        </c:if>


										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default"
												data-dismiss="modal">Close</button>
											<button type="button" class="btn btn-primary"
												onclick="borrowbook()">Save changes</button>
										</div>
									</div>
								</div>
							</div>

							</row>
						</div>

					</div>
					<!--img src="./imgs/bg1.JPG" style =" width:95%;"-->
					<hr>
					<br>
				</div>
			</div>
			<script src="js/jquery-1.11.3.min.js"></script>

			<!-- Include all compiled plugins (below), or include individual files as needed -->
			<script src="js/bootstrap.js"></script>

		</div>
	</div>

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
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script
		src="file:///D|/C/desktop/Study/SPM/StaticPages/js/jquery-3.2.1.min.js"></script>

	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script
		src="file:///D|/C/desktop/Study/SPM/StaticPages/js/popper.min.js"></script>
	<script
		src="file:///D|/C/desktop/Study/SPM/StaticPages/js/bootstrap-4.0.0.js"></script>
</body>
</html>
