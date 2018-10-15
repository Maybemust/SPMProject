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


	<div class="row" style="padding-left: 1%"
		style="background-color: aliceblue">

		<!--div class="col-md-2 "  style="background:#06246B;color:aliceblue"-->



		<div class="text-center col-md-12" style="background-color: aliceblue">

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
						<script>
		function borrowbook(){
			document.getElementById("borrowbook").submit();
		}
	</script>
						<br> <br>
						<div>
							<h4 class="panel-title" align="center"
								style="font-size: 20px; color: #191D30; padpadding-left: 20px">
								Submmit successfully!</h4>
						</div>
						<row> <a href="./LibrarianBorrowBook4.jsp"
							style="color: #EFA445; float: right; font-size: 24; padding-right: 2%">return</a>
						</row>

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

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="js/jquery-3.2.1.min.js"></script>

	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap-4.0.0.js"></script>
</body>
</html>
