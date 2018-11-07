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
<script type="text/javascript">
// 	window.onload=function(){
// 		window.location.replace("LibrarianFirstPage");
// 	}
</script>
</head>

<body>
	<div>
		<c:forEach items="${posts}" var="postItem" varStatus="st">
	  	  
  	  	<a href="PostDetails?postID=${postItem.getPostID()}" style="display:block;font-size:20px;font-weight:bold"><h2>Post Title:${postItem.getPostTitle()}</h2></a>
  	  	</c:forEach>

  <ul class="pagination">
  
      <li>
      <a href="LibrarianFirstPage?start=0" aria-label="First">
      First Page
        <span aria-hidden="true"></span>
      </a>
    </li>
    
    <li>
    
      <a href="LibrarianFirstPage?start=${pre}" aria-label="Previous">
              <span aria-hidden="true">&laquo;</span>
      
                Previous
      </a>
    </li>

    <li>
      <a href="LibrarianFirstPage?start=${next}" aria-label="Next">
      Next
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
    
        <li>
          <a href="LibrarianFirstPage?start=${last}" aria-label="Last">
          Last Page
      </a>
    </li>
    
    
  </ul>
</div>


  
  
  
  
</body>
</html>