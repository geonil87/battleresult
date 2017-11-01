<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ include file="header.jsp" %>
     
<!DOCTYPE html>
<html lang="en">
<head>
<title>글쓰기</title><meta http-equiv="content-type" content="text/html;charset=UTF-8" />
</head>
<script src="resources/jquery-3.2.1.min.js"></script>

<body>


<div class="Container">

<form id="reportForm" method="post" action="${pageContext.request.contextPath}/teatime.storyBoardReport" enctype="multipart/form-data">
<div id="editor_fram"></div>
	<input type="hidden" id="idx" name="idx" value="${param.idx }" />
<table class="table table-striped"  style="border:1px solid #dddddd">
<thead>
<tr>
</tr>
</thead>
<tbody>

<tr><td>${param.idx }</td></tr>
<tr><td><textarea id="content" class="form-control"  placeholder="글내용" name="content" maxlength="500" style="height: 350px;"></textarea></td></tr>



</tbody>

</table>
<div align="right">
<input type="button"  class="btn btn-default" onclick="location.href='${pageContext.request.contextPath}/teatime.storyBoardDetail?idx=${param.idx }'" value="취소">
<input type="button" id="report" class="btn btn-default" value="신고하기"/> </div>

</form>



</div>
<script type="text/javascript">
$(document).ready(function(){
	 $('#report').on("click",function(e){		
		var content = $('#content').val();		
		if(content==''){
			alert("내용을 입력하세요.");
		}else{
			var idx = $('#idx').val();
			checkReport(idx);
		}
	}); 
	
	
	
});

function checkReport(idx){
	$.ajax({
		type:"post",
		data:{"idx":idx},
		url:"${pageContext.request.contextPath}/teatime.checkReport",
		success:function(result){
			if(result==0){
				alert("신고하였습니다.");
				$('#reportForm').submit();
			}else{
				alert("이미 신고한 게시글입니다.");
				
			}
		}
	});
}

</script>



<%@ include file="battom.jsp" %>

</body>

</html>