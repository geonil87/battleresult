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
<h1> 비밀번호 찾기 </h1>
<h3> 아이디와 이메일을 입력해주세요.</h3>
<input type="text" name="userId" id="userId" placeholder="id" /> <br>
<input type="text" name="userEmail" id="userEmail" placeholder="ex) teatime@teatime.com"/> 
<input type="button" value="인증 메일 발송" onclick="sendFindPwEmail()"/>
<br>
<input type="text" name="authText" id="authText"/>
<input type="button" value="인증" onclick="checkFindPwAuthText()"/>
<br>

<input type="button" value="닫기" onclick="javascript:window.close()"/>

<script type="text/javascript">
	  	
	function sendFindPwEmail() {
		var inputEmail = $('#userEmail').val();
		var inputId = $('#userId').val(); 
			$.ajax({
				url : "${pageContext.request.contextPath}/member/findPw",
				type:"post",
				data : { userEmail : inputEmail, userId : inputId},
				success : function(data) {
					if (data) {
						alert("인증 메일 발송 성공")
					} else if (!data) {
						alert("인증 메일 발송 실패")
					} 
				}
			});
		}
	
	function checkFindPwAuthText(){
		var authText = $('#authText').val();
			$.ajax({
				url : "${pageContext.request.contextPath}/member.checkFindPwAuthText",
				type:"post",
				data : { auth : authText },
				success : function(data) {
					if (data) {
						alert("인증 성공")
						location.href='${pageContext.request.contextPath}/member.changePw'
					} else if (!data) {
						alert("인증 실패")
					} 
				}
			});
		}
</script>
</body>
</html>