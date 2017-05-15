<%@ page language="java" contentType="text/html; charset=EUC-KR" 
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>form</title>
</head>
<body>
<form name="boardForm">
id : <input type="text" name="id" value="${board.id}" readonly="readonly"><br>
title : <input type="text" name="title" value="${board.title}"><br>
content : <input type="text" name="content" value="${board.content}"><br>
<c:if test="${empty board}">
<input type="button" value="등록" onclick="insert();">
</c:if>
<c:if test="${!empty board}">
<input type="button" value="수정" onclick="update();">
</c:if>
</form>
</body>
<script type="text/javascript">
function insert(){
	var form = document.boardForm;
	form.action = "write";
	form.submit();
}

function update(){
	var form = document.boardForm;
	form.action = "update";
	form.submit();
}
</script>
</html>