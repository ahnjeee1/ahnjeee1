<%@ page language="java" contentType="text/html; charset=EUC-KR" 
	pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>detail</title>
</head>
<body>
<div>
<ul>
<li>${board.id}</li>
<li>${board.title}</li>
<li>${board.content}</li>
</ul>
<input type="button" value="����" onclick="location.href='form?id=${board.id}'">
<input type="button" value="����" onclick="location.href='delete?id=${board.id}'">
</div>
</body>
</html>