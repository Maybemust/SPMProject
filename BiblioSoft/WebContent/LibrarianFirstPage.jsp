<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script src="js/jquery.min.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="js/bootstrap.min.js"></script>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Biblio -Library Management System</title>

    <!-- Bootstrap -->
    <link href="./css/bootstrap-4.0.0.css" rel="stylesheet">
    <style type="text/css">
    @import url("css/bootstrap.css");
    </style>
  </head>
  <body>
    <!--------->

	  
	  
	  <div class="row" style="padding-left: 1%">
		  
		  	<!--div class="col-md-2 "  style="background:#06246B;color:aliceblue"-->
		  <div class="col-md-2 "  style="background:#186DAD;color:aliceblue">
		<div class="panel panel-default">
  <div class="panel-heading">
	  <br>
	  <div align="center" style="background-color: aliceblue">
		  <br>
		  <img src="./imgs/libraianProfile1.JPG"  height="100px" style ="float: inherit">
	  <hr>
		      <h3 class="panel-title" align="center" style = "font-size: 20px;color:#191D30"><a>User_Name</a></h3>

	  
	  <br>
	  <p align="center" style = "font-size: 16px;color:#191D30">Biblo's librarian in Company</p></div>
  </div>
  <!--div class="panel-body">
        <a href="#" style="font-weight:bold; color:#BCBCBC; float:right;padding-right: 10px">发帖数目</a>
		<a href="#" style="color:#C8C8C8;padding-right: 10px" ></a>
  </div-->
</div>
				<hr>
<div id="left" class="left">
                    <div class="menu-title">Book Management</div>
                    <div class="menu-item" href="#one" data-toggle="tab"> 
                         －Add Book
                    </div>
                    <div class="menu-item" href="#two" data-toggle="tab">
                         －Delete Book
                    </div>
					<div class="menu-item" href="#test" data-toggle="tab">
                         －Modify Book
                    </div>
	<hr>
                    <div class="menu-title">Reader Management</div>
                    <div class="menu-item" href="#three" data-toggle="tab">
                         －Add Reader
                    </div>
                    <div class="menu-item" href="#four" data-toggle="tab">
                         －Delete Reader
                    </div> 
					<div class="menu-item" href="#four" data-toggle="tab">
                         －Modify Reader
                    </div>
	                    <div class="menu-item" href="#four" data-toggle="tab">
                         －Delete Reader
                    </div>
	                    <div class="menu-item" href="#four" data-toggle="tab">
                         －Delete Reader
                    </div>
                </div>
			<hr>
				                    <div class="menu-title">Borrow & Return</div>
                    <div class="menu-item" href="#three" data-toggle="tab">
                         －Borrow Book
                    </div>
                    <div class="menu-item" href="#four" data-toggle="tab">
                         －Return Book
                    </div> 
				<br>
</div>
		  
		  
    <div class="text-center col-md-10" style= "background-color: aliceblue">
		<nav class="navbar navbar-expand-lg navbar-dark" style = "background-color: #002A5A;height: 10%">
       <a class="navbar-brand" href="#">Biblo</a>
		     <ul class="nav navbar-nav">
		  <img src="./images/logo.JPG" style="padding-top:2px;padding-left: 5px; height:50px">
        <span class="sr-only">(current)</span>
      </ul>
       <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
       <span class="navbar-toggler-icon"></span>
       </button>
       <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav ">
             <li class="nav-item active">
                <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
             </li>
             <li class="nav-item">
                <a class="nav-link" href="#">Link1</a>
             </li>
             <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Dropdown
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                   <a class="dropdown-item" href="#">Action</a>
                   <a class="dropdown-item" href="#">Another action</a>
                   <div class="dropdown-divider"></div>
                   <a class="dropdown-item" href="#">Something else here</a>
                </div>
             </li>
             <li class="nav-item">
                <a class="nav-link disabled" href="#">Disabled</a>
             </li>

          </ul>
		   <ul class="navbar-nav mr-auto">
			  <form class="form-inline my-2 my-lg-0"style = "float :left;">
             <input class="form-control mr-sm-2" type="search" placeholder="Grimms Fairytales" aria-label="Search">
             <button class="btn btn-outline-warning my-2 my-sm-0" type="submit">Search</button>
          </form>
		   </ul>
		   
          
		    <ul class="nav navbar-nav navbar-right">
				<li>"  "</li>
        <!--li><a href="#" style="font-weight:bold; color: #FECD00">登  陆</a></li>
								<li>"  "</li>
		<li><a href="#" style="color:#C8C8C8" >注  册</a></li-->
		<li><a href="#" style="color:#C8C8C8" >Log out</a></li>
      </ul>
       </div>
    </nav>
      <div class="well" style= "width:700;background-color: aliceblue"><strong> 
 <div class="panel-heading">
	  <br>
	  <div align="center" style="background-color: aliceblue">
		  		      <h3 class="panel-title" align="left" style = "font-size: 20px;color:#191D30;padpadding-left: 20px"><a>News!!</a></h3>
		  <div class="panel-body" style="background:url('./imgs/bg1.JPG');background-size:100%;height:300px;width:95%">
		  	  <p align="left" style = "font-size: 16px;color: aliceblue;padding-left: 5px">New Books In F3!!</p>
		  	  <p align="center" style = "font-size: 16px;color: aliceblue">Grimms Fairytales</p>
		  	  <p align="center" style = "font-size: 16px;color: aliceblue">...</p>

    <nav aria-label="Page navigation">
  <ul class="pagination">
    <li>
      <a href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <li><a href="#">这个分页器样式好难调整</a></li>
    <li><a href="#">1</a></li>
    <li><a href="#">2</a></li>
    <li><a href="#">3</a></li>
    <li><a href="#">4</a></li>
    <li><a href="#">5</a></li>
    <li>
      <a href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>
			  
			  
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
		  
	</div>
	  
	  
	  
    <!--div class="jumbotron jumbotron-fluid text-center">
       <h1 class="display-4">Bootstrap with Dreamweaver</h1>
       <p class="lead">Easily build your page using the Bootstrap components from the Insert panel.</p>
       <hr class="my-4">
       <p>This is a simple hero unit, a simple jumbotron-style component for calling extra attention to featured content or information.</p>
       <p class="lead">
          <a class="btn btn-primary btn-lg" href="#" role="button">Learn more</a>
       </p>
    </div>
    <div class="container">
       <div class="row text-center">
          <div class="col-lg-6 offset-lg-3">Click outside the blue container to select this <strong>row</strong>. Columns are always contained within a row. <strong>Rows are indicated by a dashed grey line and rounded corners</strong>. </div>
       </div>
       <br>
       <hr>
       <br>
       <div class="row">
          <div class="col-md-4">
             <div class="card">
                <img class="card-img-top" src="images/card-img.png" alt="Card image cap">
                <div class="card-body">
                   <h4 class="card-title">Card title</h4>
                   <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                   <br><br>
                   <a href="#" class="btn btn-primary">Go somewhere</a>
                </div>
             </div>
          </div>
          <div class="col-md-4">
             <div class="card">
                <div class="card-body">
                   <h5 class="card-title">Card title</h5>
                   <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
                   <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                   <a href="#" class="card-link">Card link</a>
                   <a href="#" class="card-link">Another link</a>
                </div>
             </div>
             <br>
             <br/>
             <div class="card">
                <div class="card-header">
                   Featured
                </div>
                <ul class="list-group list-group-flush">
                   <li class="list-group-item">Cras justo odio</li>
                   <li class="list-group-item">Dapibus ac facilisis in</li>
                   <li class="list-group-item">Vestibulum at eros</li>
                </ul>
             </div>
          </div>
          <div class="col-md-4">
             <div class="card">
                <img class="card-img-top" src="images/card-img.png" alt="Card image cap">
                <div class="card-body">
                   <h5 class="card-title">Card title</h5>
                   <p class="card-text">Some text to build on the card's content.</p>
                </div>
                <ul class="list-group list-group-flush">
                   <li class="list-group-item">Cras justo odio</li>
                   <li class="list-group-item">Dapibus ac facilisis in</li>
                </ul>
                <div class="card-body">
                   <a href="#" class="card-link">Card link</a>
                   <a href="#" class="card-link">Another link</a>
                </div>
             </div>
          </div>
       </div>
       <br/>
       <br/>
       <div class="row">
          <div class=" col-md-4"> Click here to select this<strong> column.</strong> Always place your content within a column. Columns are indicated by a dashed blue line. </div>
          <div class="col-md-4 "> You can <strong>resize a column</strong> using the handle on the right. Drag it to increase or reduce the number of columns.</div>
          <div class="col-md-4 "> You can <strong>offset a column</strong> using the handle on the left. Drag it to increase or reduce the offset. </div>
       </div>
       <br/>
       <br/>
       <div class="row">
          <div class="col-md-6 text-center">
             <div class="card">
                <div class="card-body">
                   <h3>Adding <strong>Buttons</strong></h3>
                   <p>Quickly add buttons to your page by using the button component in the insert panel. </p>
                   <button type="button" class="btn btn-info btn-md">Info Button</button>
                   <button type="button" class="btn btn-success btn-md">Success Button</button>
                </div>
             </div>
          </div>
          <div class="text-center col-md-6">
             <div class="card">
                <div class="card-body">
                   <h3>Adding <strong>Badges</strong></h3>
                   <p>Using the insert panel, add badge to your page by using the badge component.</p>
                   <span class="badge badge-info">Info Badge</span> <span class="badge badge-danger">Danger Badge</span>
                </div>
             </div>
          </div>
       </div-->
       <br>
       <hr>
		
       <div class="row">
          <div class="text-center col-lg-6 offset-lg-3">
             <h4>Biblio </h4>
             <p>Our website is willing to provide help for book management for users.<br><a href="#" >SPM A3's Website</a></p>
          </div>
       </div>
    </div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> 
    <script src="js/jquery-3.2.1.min.js"></script>

    <!-- Include all compiled plugins (below), or include individual files as needed --> 
    <script src="js/popper.min.js"></script>
  <script src="js/bootstrap-4.0.0.js"></script>
  </body>
</html>
