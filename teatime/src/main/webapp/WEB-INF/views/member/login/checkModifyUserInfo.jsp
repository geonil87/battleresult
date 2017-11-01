<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>

<html>
<head>
<title> title</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery-3.2.1.min.js"></script>
<script type="text/javascript">

</script>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/customcss/button.css">
  	  	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/customcss/insert.css">
</head>
<body>

<div class="container">
	<div class="main-container">
			<div class="container-fluid no-left-padding no-right-padding page-content">
				<!-- container -->	
				<div class="container">
					<!-- Row -->
					<div class="row">
						<!-- Content Area -->
						<div class="col-sm-12 content-area">
							<div class="aboute-block">
							
							
	  <ul class="breadcrumb" style="text-align: left;">
      <li><a href="main.do"><i class="fa fa-home"></i></a></li>
      <li><a href="qaBoard.do">마이페이지 > </a></li>
      <li><a href="qaWriteInsert.do">회원관리 수정</a></li>
    </ul>
  <div class="row"></div>
							<hr>

						
<form action="${pageContext.request.contextPath}/member.checkModifyUserInfo" method="post">
		<div class="form_table">
		<table>
		<tbody>
		<tr>
		<th scope="row">비밀번호 확인</th>
		<td>
			<div class="item">
			<input type="hidden" name="userId" value="${sessionScope.sessionId}"/>
				<input title="레이블 텍스트" class="i_text" type="password" name="userPw" maxlength="16"  required="required"><div style="display: inline;">${param.checkResult}</div><br>
			</div>
		</td>
		</tr>
		</tbody>
		</table>
		<br>
		<input type="submit" value="확인"/> <input type="submit" value="취소"/>
	</div>
	</form>					
	
									</div>
								</div>
							</div>
						</div><!-- Content Area /- -->
					</div><!-- Row /- -->
				</div><!-- container /- -->
			</div><!-- Aboute-me Section /- -->


<%@ include file="battom.jsp" %>
</body>
</html>