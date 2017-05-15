<%@ page language="java" contentType="text/html; charset=EUC-KR" 
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>list</title>
</head>
<body>
<input type="button" value="등록" onclick="location.href='form'">
<table>
	<tr>
		<th>ID</th>
		<th>Title</th>
	</tr>
	<c:forEach var="board" items="${list}">
	<tr>
		<td><a href="detail?id=${board.id}">${board.id}</a></td>
		<td>${board.title}</td>
	</tr>	
	</c:forEach>
</table>
</body>
</html>