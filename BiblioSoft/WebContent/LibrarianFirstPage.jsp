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
                 <a href="bookaddselect.jsp" target="mainFrame"  style = "color:#F0F8FF">－Add Book</a>
                    </div>
                    
                    <div class="menu-item" href="#two" >
                         <a href="bookdeleteList" target="mainFrame"  style = "color:#F0F8FF">－Book Delete Information</a>
                    </div>
					<div class="menu-item" href="#test" data-toggle="tab">
                         －Modify Book
                    </div>
	<hr>
                    <div class="menu-title"><a href="readerList" target="mainFrame" style = "color:#F0F8FF" >Reader Management</a></div>
                    
                    <div class="menu-item" href="#three" >
      <a href="readeradd.jsp" target="mainFrame" style = "color:#F0F8FF">－Add Reader</a>
                    </div>
                    
                    <div class="menu-item" href="#four" >
                      <a href="borrowedrecordList" target="mainFrame" style = "color:#F0F8FF"> － Borrowedrecord List</a>
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
                         <a href="LibrarianBorrowBook4.jsp" target="mainFrame" style = "color:#F0F8FF">－Borrow Book</a>
                    </div>
                    
                    <div class="menu-item" href="#four" >
                        <a href="LibrarianReturnBook.jsp"   target="mainFrame"  style = "color:#F0F8FF">－Return Book</a>
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
 
 
		<li><a href="logout" style="color:#C8C8C8" >Log out</a></li>
      </ul>
       </div>
    </nav>
    
    
    
    
    <iframe style="width:90% ; height:80%"   src="images/123.png"  scrolling=no frameborder=0 name="mainFrame" id="mainFrame" title="mainFrame"> 
    
  
   
    </iframe>
    
<!--       <div class="well" style= "width:700;background-color: aliceblue"><strong> 
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
		  
	  <hr>

	  
	  <br>
	 </div>
  </div>		  
	
    </div> -->

		 
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
    </div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> 
    <script src="js/jquery-3.2.1.min.js"></script>
 <script src="js/jquery-1.11.3.min.js"></script>


<script src="js/bootstrap.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed --> 
    <script src="js/popper.min.js"></script>
  <script src="js/bootstrap-4.0.0.js"></script>
  </body>
</html>
