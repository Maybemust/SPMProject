<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>returnbook</title>
</head>

<body>
	<script>
		function returnbook(){
			document.getElementById("returnbook").submit();
		}
	</script>
	<form method="post" action="returnbook" id="returnbook">
		<input name="useraccount"></input> <input name="barCode"></input>
		<button onclick="returnbook()">确认</button>
	</form>
</body>
</html>
