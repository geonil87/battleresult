<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title> Registration Form </title>

</head>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/customcss/button.css">
  	  	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/customcss/insert.css">
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
					
		<!-- 회원가입 페이지 -->
<form action="${pageContext.request.contextPath}/member.modifyUserInfo" method="post">
	<fieldset>
	
  <ul class="breadcrumb" style="text-align: left;">
      <li><a href="main.do"><i class="fa fa-home"></i></a></li>
      <li><a href="qaBoard.do">마이페이지 > </a></li>
      <li><a href="qaWriteInsert.do">회원정보 수정</a></li>
    </ul>
  <div class="row"></div>
 
	<hr>
		<legend></legend>
		<div class="form_table">
		<table border="1" cellspacing="0" summary="표의 요약을 반드시 넣어 주세요">
		<tbody>
		<tr>
		<th scope="row">아이디</th>
		<td>
			<div class="item">
				 <div id='userId' style="display: inline;">${memberDTO.userId }</div><br>
			</div>
		</td>
		</tr>
		<tr>
		<th scope="row">비밀번호</th>
		<td>
			<div class="item">
				<input title="레이블 텍스트" class="i_text" type="password" name="userPw" id='pw1'  maxlength="16" required="required"><div id='pwSameCheck' style="display: inline;"></div>
			</div>
		</td>
		</tr>
		<tr>
		<th scope="row">비밀번호 확인</th>
		<td>
			<div class="item">
				<input title="레이블 텍스트" class="i_text" type="password" id='pw2' maxlength="16" required="required">
			</div>
		</td>
		</tr>
		<tr>
		<th scope="row">닉네임</th>
		<td>
			<div class="item">
				<div id='userNick' style="display: inline;">${memberDTO.userNick }</div>
				<p class="i_dsc"></p>
			</div>
		</td>
		</tr>
			<tr>
		<th scope="row">이메일</th>
		<td>
			<div class="item">
				<div id='userEmail' style="display: inline;">${memberDTO.userEmail }</div>
				<p class="i_dsc"></p>
			</div>
		</td>
		</tr>
		<tr>
		<th scope="row">이름</th>
		<td>
			<div class="item">
				<div id='userName' style="display: inline;">${memberDTO.userName }</div>
				<p class="i_dsc"></p>
			</div>
		</td>
		</tr>
		<tr>
		<th scope="row">생년월일</th>
		<td>
			<div class="item">
				<div id='userBirthday' style="display: inline;">${memberDTO.userBirthday }</div>
				<p class="i_dsc"></p>
			</div>
		</td>
		</tr>
		<tr>
		<th scope="row">휴대폰</th>
		<td>
			<div class="item">
				<input title="레이블 텍스트" class="i_text" name="userPhone" type="text" required="required" value="${memberDTO.userPhone }" >
				<p class="i_dsc"></p>
			</div>
		</td>
		</tr>
		<tr>
		<th scope="row">주소</th>
		<td>
			<div class="item">
				<input title="레이블 텍스트" class="i_text" type="text" name="userPostcode" id='postcode' required="required" value="${memberDTO.userPostcode }"><input title="레이블 텍스트" class="i_text" type="text" name="userAddress1" id='address' required="required" value="${memberDTO.userAddress1 }" ><input title="레이블 텍스트" class="i_text" type="text" name="userAddress2" id='addressDetail' required="required" value="${memberDTO.userAddress2 }" ><input type="button" onclick="addressFind()" value="주소 찾기"><br>
				<p class="i_dsc"></p>
			</div>
			
		</td>
		</tr>
		<tr>
		<th scope="row">성별</th>
		<td>
			<div class="item">
				<input class="i_check" id="a1" type="radio" name="userGender" value="M" checked="checked" <c:out value="${memberDTO.userGender == 'M'?'checked':''}"/>  ><label for="a1">남성</label> <input class="i_check" id="a2" type="radio" name="userGender" value="F" <c:out value="${memberDTO.userGender == 'F'?'checked':''}"/> ><label for="a2">여성</label>
			</div>
		</td>
		</tr>

		</tbody>
		</table><br>
		<input type="hidden" name="userId" value="${memberDTO.userId }"/>
             <div align="center"><input type="submit" value="확인" id='regist'/>   <input type="button" value="취소"  />   <input type="button" value="회원 탈퇴" onclick="location.href='${pageContext.request.contextPath}/member.userDefection'">	</div> 
              </div>
	</fieldset>
</form>

									</div>
								</div>
							</div>
						</div><!-- Content Area /- -->
					</div><!-- Row /- -->
				</div><!-- container /- -->

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery-3.2.1.min.js"></script>
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

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function addressFind() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('addressDetail').focus();
            }
        }).open();
    }
</script>

<%@ include file="battom.jsp" %>
</body>
</html>