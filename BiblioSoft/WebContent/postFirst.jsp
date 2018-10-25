<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="js/jquery.min.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="js/bootstrap.min.js"></script>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome</title>
</head>

<body>
	<div>
		<c:forEach items="${posts}" var="postItem" varStatus="st">

  	<img src="${postItem.getPostImage()}" title="1539503768268070846.jpg" alt="timg.jpg" style = "float:center;width:800px" onclick="PostDetails?postID =${postItem.getPostID()}"/>
  	  	<h2>${postItem.getPostTitle()}</h2>
  	  	  
  	  	<a href="PostDetails?postID=${postItem.getPostID()}">${postItem.getPostTitle()}</a>
  	  	</c:forEach>
  <ul class="pagination">
    <li>
      <a href="LibrarianFirstPage?start=${pre}" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <li><a href="LibrarianFirstPage?start=1">1</a></li>
    <li><a href="LibrarianFirstPage?start=2">2</a></li>
    <li><a href="LibrarianFirstPage?start=3">3</a></li>
    <li><a href="LibrarianFirstPage?start=4">4</a></li>
    <li><a href="LibrarianFirstPage?start=5">5</a></li>
    <li>
      <a href="LibrarianFirstPage?start=${next}" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</div>

<div>
  	${post.getPostTitle()}

</div>  
<div>
  ${post.getText()}
  </div>
  
  
  
  
</body>
</html>