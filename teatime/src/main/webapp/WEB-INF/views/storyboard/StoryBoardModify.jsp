<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ include file="writeHeader.jsp" %>
     
<!DOCTYPE html>
<html lang="en">
<head>
<title>M&K Cosmatic</title><meta http-equiv="content-type" content="text/html;charset=UTF-8 />
</head>
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote-bs4.js"></script>

<body>


<div class="Container">

<form method="post" action=""${pageContext.request.contextPath}/teatime.storyBoardModify" enctype="multipart/form-data">
<div id="editor_fram"></div>
<table class="table table-striped"  style="border:1px solid #dddddd">
<thead>
<tr>
</tr>
</thead>
<tbody>

<tr><td><input type="hidden" value="${modify.idx }" name="idx"/></td></tr>
<tr><td><input type="text" class="form-control" placeholder="글제목" name="title" maxlength="50" value="${modify.title}"></td></tr>
<tr><td><textarea class="form-control" id="summernote" placeholder="글내용" name="content" maxlength="500" style="height: 350px;">${modify.content}</textarea></td></tr>
<tr><td><input type="text" class="form-control" value="${modify.user_nick}" placeholder="회원 아이디" name="user_nick" maxlength="16" style="width 50px;"></td></tr>


</tbody>

</table>

<div align="right">
<input type="button"  class="btn btn-default" onclick="location.href='${pageContext.request.contextPath}/teatime.storyBoardList'" value="취소">
<input type="submit" class="btn btn-default" value="저장"></div>
</form>

<script type="text/javascript">
$(document).ready(function() {
   // onImageUpload callback
   $('#summernote').summernote({
	   height: 350,
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
           url : "${pageContext.request.contextPath}/teatime.storyBoardImageUpload",
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

</div>




<%@ include file="battom.jsp" %>

</body>

</html>