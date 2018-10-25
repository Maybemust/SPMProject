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
    <title>Biblio -Recieve Fine </title>
    <!-- Bootstrap -->
    <link href="./css/bootstrap-4.0.0.css" rel="stylesheet">
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css">
  </head>
  <body>
	  
	  
	  	  <div class="row" style="padding-left: 1%" style= "background-color: aliceblue">
		  
		  	<!--div class="col-md-2 "  style="background:#06246B;color:aliceblue"-->

		  
    <div class="text-center col-md-12" style= "background-color: aliceblue">	  
	 <div class="panel panel-primary">
		  <div class="panel-heading">
	 <h3 class="panel-title" align="left" style = "font-size: 20px;color:#191D30;padpadding-left: 20px"><a>Recieve Fine -Ensure Recieve Fine</a></h3>
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
		function recievefine(){
			document.getElementById("recievefine2").submit();
		}
		
	</script>
			  <div>
				  <row>
				  
				  				  <p style = "font-size: 20px;color:#191D30;padding-left: 20px;float:left">Borrower Account :${borrower.getAccount()}</p>
									  <br>
					  <br>
				  		<c:forEach items="${booklist}" var="book" varStatus="st">

					  
				  <p style = "font-size: 20px;color:#191D30;padding-left: 20px;float:left">Book name:${book.getBookName()}</p>
				  <br>
				  <br>
				  <p style = "font-size: 20px;color:#191D30;padding-left: 20px;float:left">Book ID :${book.getBarCode()}</p>
				  				  <br>
				  <br>
				  	  	  	</c:forEach>
				  				  <form method="post" action="recievefine2" id="recievefine2">

					  <input  name="useraccount" type="hidden" value = "${borrower.getAccount()}"class="form-control" placeholder="Input UserAccount" aria-describedby="sizing-addon1">

				  	<br>

				  	
				  <p style = "font-size: 20px;color:#191D30;padding-left: 20px;float:left">Fine number :${fine}</p>
			  					  <br>
			  
				  						    <button type="button" class=" btn btn-warning btn-lg"
				  						     onclick = "window.location.href='./LibrarianRecieveFine1.jsp'" style = "float:left;">Return</button>
					    <button type="button" class=" btn btn-success btn-lg" data-toggle="modal" data-target="#myModal" 
					    style = "float:center" >OK</button>

					  <hr>
					  	</form>
					  	
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style = "top:30%">
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
        <button type="button" class="btn btn-primary" onclick="recievefine()">Submit Now</button>
      </div>
    </div>
  </div>
</div>				  	
					  <!-- div style  = "float :left; font-size: 18px;color: #002A5A;width:10%;">Book ID :${barcode}</div>
					  <div style  = "float :left; font-size: 18px;color: #002A5A;width:10%;">Book ISBN :${ISBN}</div-->

				  	<br>

					  <hr>
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
    <script src="file:///D|/C/desktop/Study/SPM/StaticPages/js/jquery-3.2.1.min.js"></script>

    <!-- Include all compiled plugins (below), or include individual files as needed --> 
    <script src="file:///D|/C/desktop/Study/SPM/StaticPages/js/popper.min.js"></script>
    <script src="file:///D|/C/desktop/Study/SPM/StaticPages/js/bootstrap-4.0.0.js"></script>
  </body>
</html>
