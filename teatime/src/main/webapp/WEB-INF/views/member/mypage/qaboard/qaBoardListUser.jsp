<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title> title</title>
<script type="text/javascript">

</script>
</head>
<body>
<h1> 질문 게시판 </h1>
<table style="text-align: center; border: 1px solid #dddddd">
<thead>
<tr>
<th style="background-color: #eeeeee; text-align: center;">번호</th>
<th style="background-color: #eeeeee; text-align: center;">제목</th>
<th style="background-color: #eeeeee; text-align: center;">작성자</th>
<th style="background-color: #eeeeee; text-align: center;">작성시간</th>
<th style="background-color: #eeeeee; text-align: center;">답변상태</th>
</tr>
</thead>
<tbody>
<c:forEach items="${qaBoardList}" var="qaBoardList">
<tr>
<td>${qaBoardList.viewIdx}</td>
<td><a href='${pageContext.request.contextPath}/qaboard/userDetail?idx=${qaBoardList.idx}'>${qaBoardList.title}</a></td>
<td>${qaBoardList.userNick}</td>
<td>${qaBoardList.wdate}</td>
<td>${qaBoardList.condition}</td>
</tr>
</c:forEach>
</tbody>
</table>
<input type="button" value="질문 작성하기" onclick="location.href='${pageContext.request.contextPath}/qaboard/question'">

<!-- 페이징 -->
<br>
<a href='${pageContext.request.contextPath}/qaboard/listUser?pageNum=1'>맨앞</a>
<a href='${pageContext.request.contextPath}/qaboard/listUser?pageNum=${paging.startPage-5}'>이전</a>
<c:forEach begin="${paging.startPage }" end="${paging.endPage }" varStatus="i">
	<c:choose>
		<c:when test="${i.index != 0}">
			<b><a href='${pageContext.request.contextPath}/qaboard/listUser?pageNum=${i.index}'>${i.index}</a></b>
		</c:when>
	</c:choose>
</c:forEach>
<a href='${pageContext.request.contextPath}/qaboard/listUser?pageNum=${paging.startPage+5}'>다음</a>
<a href='${pageContext.request.contextPath}/qaboard/listUser?pageNum=${paging.totalPage}'>맨뒤</a>
<br>


</body>
</html>