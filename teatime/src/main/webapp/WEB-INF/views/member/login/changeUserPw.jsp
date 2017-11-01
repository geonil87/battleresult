<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title> login Result </title>
</head>
<body onunload="javascript:window.close()">
<h1> 비밀번호 변경 페이지 </h1>
<h3> 변경할 비밀번호를 입력해주세요</h3>
<form action="${pageContext.request.contextPath}/member.changePw" method="post">
비밀번호 : <input type="password" id="pw1" name="userPw" /><div id='pwSameCheck' style="display: inline;"></div><br> 
비밀번호 확인 : <input type="password" id="pw2"/> <br> 
<input type="submit" value="비밀번호 변경"/>
</form>
<input type="button" value="메인가기" onclick="location.href='${pageContext.request.contextPath}/teatime.main'">

<script type="text/javascript" src=" ${pageContext.request.contextPath}/resources/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$('#pw1').keyup(function() {
		if($('#pw1').val().length == '0'){
			$('#pwSameCheck').text('');
		}else if(($('#pw1').val().length != $('#pw2').val().length) && ($('#pw2').val().length == '0')){
			$('#pwSameCheck').text('');
		}else if(($('#pw1').val().length != $('#pw2').val().length) && ($('#pw1').val().length != '0')){
			$('#pwSameCheck').text("비밀번호 불일치");
		}else if(($('#pw1').val() == $('#pw2').val()) && ($('#pw1').val().length != '0')){
			if(($('#pw1').val() == $('#pw2').val())){
				$('#pwSameCheck').text('비밀번호 일치');
			}
		}
	});
	
	$('#pw2').keyup(function() {
		if($('#pw2').val().length == '0'){
			$('#pwSameCheck').text('');
		}else if(($('#pw1').val().length != $('#pw2').val().length) && ($('#pw1').val().length != '0')){
			$('#pwSameCheck').text("비밀번호 불일치");
		}else if(($('#pw1').val() == $('#pw2').val()) && ($('#pw1').val().length != '0')){
			if(($('#pw1').val() == $('#pw2').val())){
				$('#pwSameCheck').text('비밀번호 일치');
			}
		}
	});
	
});

</script>

<%@ include file="battom.jsp" %>
</body>
</html>