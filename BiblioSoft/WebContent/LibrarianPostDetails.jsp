<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	  <script src="js/jquery.min.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="js/bootstrap.min.js"></script>
    <title>Bibliosoft -Post Details </title>
    <!-- Bootstrap -->
    <link href="./css/bootstrap-4.0.0.css" rel="stylesheet">
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css">

<link rel="stylesheet" type="text/css" href="css/buttons.css" />
<link rel="stylesheet" type="text/css" href="css/input.css" />
<link rel="stylesheet" type="text/css" href="css/password.css" />
<link href="css/bootstrap.css" rel="stylesheet" media="screen">
<script src="http://code.jquery.com/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/ajax.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery.min.js"></script>

<script type="text/javascript"charset="utf-8" src="utf8-jsp/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="utf8-jsp/ueditor.all.js"> </script>
    <script type="text/javascript" charset="utf-8" src="utf8-jsp/ueditor.all.min.js"> </script>

    <script type="text/javascript" charset="utf-8" src="utf8-jsp/lang/zh-cn/zh-cn.js"></script>

    <style type="text/css">
        div{
            width:100%;
        }
    </style>
</head>
<body>
 <div class="row" style="padding-left: 1%" style= "background-color: aliceblue">
		  
		  	<!--div class="col-md-2 "  style="background:#06246B;color:aliceblue"-->

		  
    <div class="text-center col-md-12" style= "background-color: aliceblue">	  
	 <div class="panel panel-primary">
		  <div class="panel-heading">
	 <h3 class="panel-title" align="left" style = "font-size: 20px;color:#191D30;padpadding-left: 20px"><a>Post News -Post Details</a></h3>
		 </div>
	  <div align="center" style="background-color: aliceblue">
		  		      
		  <div class="panel-body" style="">

${post.getText()}

<div>

 <c:if test="${AUTHORITY == 'Librarian'}">
								<div class="modal-body">
									
									<button type="button" class=" btn btn-success btn-lg"
									onclick = "history.go(-1)" >return</button>

								</div>
							</c:if> 



<!--  <button type="button" class=" btn btn-warning btn-lg" onclick = "history.go(-1)" >Return</button> -->
</div>
<script>
function returnskip()
{
	window.location.href="LibrarianFirstPage";
}
</script>
</div>

</div>
</div>
</div>
</div>


		
					    


</body>
</html>