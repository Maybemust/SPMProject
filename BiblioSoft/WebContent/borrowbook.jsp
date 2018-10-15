<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>returnbook</title>
</head>

<body>
	<script>
		function borrowbook(){
			document.getElementById("borrowbook").submit();
		}
	</script>
	<form method="post" action="borrowbook" id="borrowbook">
		<input name="useraccount"></input> <input name="barCode"></input>
		<button onclick="borrowbook()">确认</button>
	</form>
</body>
</html>