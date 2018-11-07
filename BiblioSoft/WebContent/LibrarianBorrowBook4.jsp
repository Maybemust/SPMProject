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


	<div class="row" style="padding-left: 1%; background-color: aliceblue">

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

		
						<script>
		function borrowbook(){
			document.getElementById("EnsureBorrowBooks").submit();
		}
	</script>
						<div>
							<row>
							<form method="post" action="EnsureBorrowBook"
								id="EnsureBorrowBooks">

								<div
									style="float: left; font-size: 18px; color: #002A5A; width: 10%;">Book
									ID :</div>
								<input name="barCode" type="text" class="form-control"
									placeholder="Input Book Id" aria-describedby="sizing-addon1">
									
								<div
									style="float: left; font-size: 18px; color: #002A5A; width: 12%;">Borrower
									ID :</div>
									
								<input name="useraccount" type="text" class="form-control"
									placeholder="Input UserAccount"
									aria-describedby="sizing-addon1"
									required
													oninvalid="setCustomValidity('The input cannot be empty');"
													oninput="setCustomValidity('');" > <br>
								<button type="submit" class=" btn btn-success btn-lg"
									data-toggle="modal" data-target="#myModal">OK</button>

								<hr>
							</form>

							</a> <!--div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style = "top:30%">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"></h4>
      </div>
      
      <div class="modal-body">
        Are you sure you want to submit?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary" onclick="borrowbook()">Submit Now</button>
      </div>
    </div>
  </div>
</div--> <c:if test="${borrowBook.getStatus() == 2}">
								<div class="modal-body">
									<h4 style="color: #002A5A">This book has already been
										borrowed!!</h4>


								</div>
							</c:if> <c:if test="${ifAccountExists == 0}">
								<div class="modal-body">
									<h4 style="color: #002A5A">The account doesn't exist!!</h4>


								</div>
							</c:if> <c:if test="${borrownum == 0}">
								<div class="modal-body">
									<h4 style="color: #002A5A">The account have reached the
										borrow upper limit!!</h4>
									<h4 style="color: #002A5A">Cannot borrow new books unless
										this reader return books!!</h4>


								</div>
							</c:if> <c:if test="${ifExist == 0}">
								<div class="modal-body">
									<h4 style="color: #002A5A">Cannot find this book!</h4>

								</div>
							</c:if>
							<c:if test="${ifReserved == 1}">
								<div class="modal-body">
									<h4 style="color: #002A5A">This book has been reserved!</h4>

								</div>
							</c:if>
							
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
