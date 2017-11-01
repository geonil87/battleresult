<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title> title</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery-3.2.1.min.js"></script>
<script type="text/javascript">

</script>
</head>
<body>
<h1> 아이디 찾기 </h1>
<h3> 회원가입시 입력 했던 이메일로 아이디를 전송합니다.</h3>
이메일 : <input type="text" name="userEmail" id="userEmail" placeholder="ex) teatime@teatime.com"/> 
<input type="button" value="인증 메일 발송" onclick="sendFindIdEmail()"/>
<br>
<input type="button" value="닫기" onclick="javascript:window.close()"/>

<script type="text/javascript">
	  	
	function sendFindIdEmail() {
		var inputed = $('#userEmail').val();
			$.ajax({
				url : "${pageContext.request.contextPath}/member.findId",
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
</script>

</body>
</html>