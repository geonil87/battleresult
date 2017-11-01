<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
  <head>
  	  	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/customcss/button.css">
  	  	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/customcss/insert.css">
  	  	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" /> 
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
					
		<!-- 회원가입 페이지 -->
<form action="${pageContext.request.contextPath}/member.regist" method="post">
	<fieldset>
	  <ul class="breadcrumb" style="text-align: left;">
      <li><a href="main.do"><i class="fa fa-home"></i></a></li>
      <li><a href="qaBoard.do">로그인 > </a></li>
      <li><a href="qaWriteInsert.do">회원가입</a></li>
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
				<input title="레이블 텍스트" class="i_text" type="text" name="userId" maxlength="16" id="id" required="required"><input type="button" value="아이디 중복체크" onclick='checkId()'/><div id='idSameCheck' style="display: inline;"></div><br>
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
				<input title="레이블 텍스트" class="i_text" name="userNick" id="userNick" type="text" required="required"><input type="button" value="닉네임 중복체크" onclick='checkNick()'/><div id='nickSameCheck' style="display: inline;"></div>
				<p class="i_dsc"></p>
			</div>
		</td>
		</tr>
			<tr>
		<th scope="row">이메일</th>
		<td>
			<div class="item">
				<input title="레이블 텍스트" class="i_text"  id="userEmail" name="userEmail" type="text" required="required"><input type="button"  value="이메일 인증 " onclick="checkEmail()"/><div id='idSameCheck' style="display: inline;"></div>
				<p class="i_dsc"></p>
			</div>
		</td>
		</tr>
		<tr>
		<th scope="row">이름</th>
		<td>
			<div class="item">
				<input title="레이블 텍스트" class="i_text" name="userName" id="userName" type="text" required="required">
				<p class="i_dsc"></p>
			</div>
		</td>
		</tr>
		<tr>
		<th scope="row">생년월일</th>
		<td>
			<div class="item">
				<input title="레이블 텍스트" class="i_text" id="datepicker" name="userBirthday" type="text" required="required">
				<p class="i_dsc"></p>
			</div>
		</td>
		</tr>
		<tr>
		<th scope="row">휴대폰</th>
		<td>
			<div class="item">
				<input title="레이블 텍스트" class="i_text" name="userPhone" type="text" required="required">
				<p class="i_dsc"></p>
			</div>
		</td>
		</tr>
		<tr>
		<th scope="row">주소</th>
		<td>
			<div class="item">
				<input title="레이블 텍스트" class="i_text" type="text" name="userPostcode" id='postcode' required="required"><input title="레이블 텍스트" class="i_text" type="text" name="userAddress1" id='address' required="required" ><input title="레이블 텍스트" class="i_text" type="text" name="userAddress2" id='addressDetail' required="required" ><input type="button" onclick="addressFind()" value="주소 찾기"><br>
				<p class="i_dsc"></p>
			</div>
			
		</td>
		</tr>
		<tr>
		<th scope="row">성별</th>
		<td>
			<div class="item">
				<input class="i_check" id="a1" type="radio" name="userGender" value="M" checked="checked"  ><label for="a1">남성</label> <input class="i_check" id="a2" type="radio" name="userGender" value="F" ><label for="a2">여성</label>
			</div>
		</td>
		</tr>

		</tbody>
		</table><br>
		<input type="hidden" value="1" name="userPermission"/>
             <div align="center"><input type="submit" value="저장" id='regist'/>   <input type="button" value="취소"  /></div> 
              </div>
	</fieldset>
</form>
									</div>
								</div>
							</div>
						</div><!-- Content Area /- -->
					</div><!-- Row /- -->
				</div><!-- container /- -->
			</div><!-- Aboute-me Section /- -->


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
<script type="text/javascript" src=" ${pageContext.request.contextPath}/resources/jquery-3.2.1.min.js"></script>
<script>
    function checkId() {
        var inputed = $('#id').val();
        $.ajax({
        	url : "${pageContext.request.contextPath}/member.checkSameId",
        	type:"post",
        	data : { id : inputed },
            success : function(data) {
            	data
               	if (data == '0') {
               		alert('아이디 사용 가능');
               		/* $('#idSameCheck').text('아이디 사용 가능'); */
                } else if (data == '1') {
                	alert('아이디 중복');
               		/* $('#idSameCheck').text('아이디 중복'); */
                } 
            }
        });
    }
    
    function checkNick() {
        var inputed = $('#userNick').val();
        $.ajax({
        	url : "${pageContext.request.contextPath}/member.checkSameNick",
        	type:"post",
        	data : { nick : inputed },
            success : function(data) {
               	if (data == '0') {
                	$('#nickSameCheck').text('닉네임 사용 가능');
                } else if (data == '1') {
               		$('#nickSameCheck').text('닉네임 중복');
                } 
            }
        });
    }
    
    function checkEmail(){
    	var openWin;
    	openWin = window.open("${pageContext.request.contextPath}/member.checkEmail",
    			"emailAuthForm","width=570, height=350, resizable = no, scrollbars = no");
    }
    
    
</script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script> 
<script>
$(function() {
      $("#datepicker").datepicker({
          dateFormat:'yymmdd',
          monthNamesShort:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
          dayNamesMin:['일','월','화','수','목','금','토'],
          minDate: '-100y',
          yearRange: 'c-100:c+10',
          changeMonth:true, // 월변경가능
          changeYear:true,  // 년변경가능
          showMonthAfterYear:true // 년 뒤에 월표시
      });
     });
</script>
    
 <%@ include file="battom.jsp" %>
  </body>
</html>

