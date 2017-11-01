<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>Home</title>
</head>
<body>

<h1> mypage 간이 페이지 </h1>

<br>
세션아이디: ${sessionScope.sessionId }
<br>
세션닉네임: ${sessionScope.sessionNick }
<br><input type="button" value="회원정보 수정" onclick="location.href='${pageContext.request.contextPath}/member/modifyUserInfo'"/>
<br><input type="button" value="문의게시판" onclick="location.href='${pageContext.request.contextPath}/qaboard/listUser'"/>
</body>
</html>
