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
    <title>Biblio -borrow books </title>
    <!-- Bootstrap -->
    <link href="./css/bootstrap-4.0.0.css" rel="stylesheet">
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css">
  </head>
  <body>
	  
	  
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
	  <p align="center" style = "font-size: 16px;color:#191D30">Biblio's librarian in Company</p></div>
  </div>
  <!--div class="panel-body">
        <a href="#" style="font-weight:bold; color:#BCBCBC; float:right;padding-right: 10px">发帖数目</a>
		<a href="#" style="color:#C8C8C8;padding-right: 10px" ></a>
  </div-->
</div>
				<hr>
<div id="left" class="left">
                    <div class="menu-title"><a href="bookList" target="mainFrame" style = "color:#F0F8FF" >Book Management</a></div>
                    
                    <div class="menu-item" href="#one" > 
                 <a href="bookadd.jsp" target="mainFrame"  style = "color:#F0F8FF">－Add Book</a>
                    </div>
                    
                    <div class="menu-item" href="#two" data-toggle="tab">
                         －Delete Book
                    </div>
					<div class="menu-item" href="#test" data-toggle="tab">
                         －Modify Book
                    </div>
	<hr>
                    <div class="menu-title"><a href="readerList" target="mainFrame" style = "color:#F0F8FF" >Reader Management</a></div>
                    
                    <div class="menu-item" href="#three" >
      <a href="readeradd.jsp" target="mainFrame" style = "color:#F0F8FF">－Add Reader</a>
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
                    <div class="menu-item" href="#three" >
                         <a href="LibrarianBorrowBook4.jsp" style = "color:#F0F8FF">－Borrow Book</a>
                    </div>
                    
                    <div class="menu-item" href="#four" >
                        <a href="LibrarianReturnBook.jsp" style = "color:#F0F8FF">－Return Book</a>
                    </div> 
				<br>
</div>
		  
		  
    <div class="text-center col-md-10" style= "background-color: aliceblue">
	<nav class="navbar navbar-expand-lg navbar-dark" style = "background-color: #002A5A;height: 10%">
       <a class="navbar-brand" href="#">BiblioSoft</a>
		     <ul class="nav navba+-*r-nav">
		  <img src="./images/logo.png" style="padding-top:2px;padding-left: 5px; height:50px">
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
				<li><a class="nav-link" href="fin.jsp">Back </a></li>
				
				<li> <a class="nav-link" href="admin1">Admin </a></li>
 
 
		<li><a href="#" style="color:#C8C8C8" >Log out</a></li>
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
	 <h3 class="panel-title" align="left" style = "font-size: 20px;color:#191D30;padpadding-left: 20px"><a>Borrow Book</a></h3>
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
			  <br>
			  <br>
			  <div>
				  <h4 class="panel-title" align="center" style = "font-size: 20px;color:#191D30;padpadding-left: 20px">
					  Submmit successfully!</h4>
			  </div>
			  <row>
			  	<a href="./LibrarianBorrowBook4.jsp" style="color:#EFA445;float:right;font-size: 24;padding-right:2%" >return</a>
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
       <hr>
       <div class="row">
          <div class="text-center col-lg-6 offset-lg-3">
             <h4>Biblio </h4>
             <p>Our website is willing to provide help for book management for users.<br><a href="#" >SPM A3's Website</a></p>
          </div>
       </div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> 
    <script src="js/jquery-3.2.1.min.js"></script>

    <!-- Include all compiled plugins (below), or include individual files as needed --> 
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap-4.0.0.js"></script>
  </body>
</html>
