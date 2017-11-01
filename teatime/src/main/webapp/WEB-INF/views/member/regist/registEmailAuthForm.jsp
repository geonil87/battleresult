<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title> title</title>


</head>
<body>
<h1> 이메일 인증 </h1>

<input type="text" name="userEmail" id="email"/>
<input type="button" value="인증 메일 발송" onclick="sendAuthEmail()"/>
<br>
<br>
<input type="text" name="authText" id="authText"/>
<input type="button" value="인증" onclick="checkAuthText()"/>
<br>
<input type="button" value="닫기" onclick="javascript:window.close()"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	document.getElementById("email").value = opener.document.getElementById("userEmail").value;
	  	
	
	/* 발송실패에 대해서 리턴값 다시생각해봐야됨 */
	function sendAuthEmail() {
		var inputed = $('#email').val();
			$.ajax({
				url : "${pageContext.request.contextPath}/member.sendAuthEmail",
				type:"post",
				data : { userEmail : inputed },
				success : function(data) {
					if (data) {
						alert("인증 메일 발송 성공")
					} else if (!data) {
						alert("인증 메일 발송 실패")
					} 
				}
			});
		}
	
	function checkAuthText(){
		var authText = $('#authText').val();
		var email = $('#email').val();
			$.ajax({
				url : "${pageContext.request.contextPath}/member.checkAuthText",
				type:"post",
				data : { auth : authText, userEmail : email },
				success : function(data) {
					if (data) {
						alert("인증 성공")
						opener.document.getElementById("userEmail").value = document.getElementById("email").value;
						close();
					} else if (!data) {
						alert("인증 실패")
					} 
				}
			});
		}
</script>
</body>
</html>