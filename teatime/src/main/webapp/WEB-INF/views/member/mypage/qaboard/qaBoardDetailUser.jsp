<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title> 질문 디테일</title>
<script type="text/javascript">

</script>
</head>
<body>

<div style="background-color: green;">${question.title }</div><br>
<h1>질문 내용</h1>
<div style="background-color: green;">${question.content }</div><br>
<c:if test="${answer != null}">
	<h1>답변 내용</h1>
	<div style="background-color: pink;">${answer.content }</div><br>	
</c:if>

<c:if test="${question.condition == 1}">
	<input type="button" value="수정" onclick="location.href='${pageContext.request.contextPath}/qaboard/questionModify?idx=${question.idx}&condition=${question.condition}'"/>
	<input type="button" value="삭제" onclick="location.href='${pageContext.request.contextPath}/qaboard/questionDelete?idx=${question.idx}&condition=${question.condition}'"/>
</c:if>

</body>
</html>