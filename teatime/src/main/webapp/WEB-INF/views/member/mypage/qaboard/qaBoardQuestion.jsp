<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title> 1:1 문의 (Q&A) </title>
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.js"></script>

<link href="${pageContext.request.contextPath}/resources/summernote/summernote.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/summernote/summernote.js"></script>
<script src="${pageContext.request.contextPath}/resources/summernote/summernote.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/summernote/lang/summernote-ko-KR.js"></script>

</head>
<body>
<form action="${pageContext.request.contextPath}/qaboard/question" method="post">
	문의 카테고리 : 
	<select id="category" name="category">
		<option value="0" >문의 카테고리 선택</option>
		<option value="1">계정 문의</option>
		<option value="2">게시물 문의</option>
		<option value="10">기타 문의</option>
	</select>
	<br>
	작성자 : <div id="userNick" style="display: inline;">${sessionScope.sessionNick}</div>
	<br>
	제목 : <input type="text" name="title"/> 
	<br>
	내용 : <textarea id="summernote" name="content"></textarea>
	<br>
	<input type="submit" value="게시물 저장" />
</form>

<script type="text/javascript">
$(document).ready(function() {
	// onImageUpload callback
	$('#summernote').summernote({
		lang : 'ko-KR',
	 	callbacks:{
			onImageUpload : function(files, editor, welEditable) {
	    	sendFile(files[0], editor, welEditable);
	   	 }
	 	}
	});

	function sendFile(file, editor, welEditable) {
	    data = new FormData();
	    data.append("uploadFile", file);
	    $.ajax({
	        data : data,
	        type : "POST",
	        url : "${pageContext.request.contextPath}/qaboard/imageUpload",
	        cache : false,
	        contentType : false,
	        processData : false,
	        success : function(url) {
	        	$('#summernote').summernote('insertImage', url);
	        }
	    });
	}
	
});
</script>

</body>
</html>