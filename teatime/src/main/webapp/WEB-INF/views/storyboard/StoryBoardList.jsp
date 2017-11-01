<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!-- 상단 include -->
    <%@ include file="header.jsp" %>
    <!-- 상단 include -->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script src="resources/jquery-3.2.1.min.js"></script>
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
								<hr>
								
								<div class="block-title">
									<h3>게시판 목록</h3>
								</div>
								<hr>
							
<!-- UI Object -->
<table class="tbl_type" border="1" cellspacing="0" summary="게시판의 글제목 리스트">
<caption>게시판 리스트</caption>
<colgroup>
<col width="30"><col width="80"><col>
<col width="115"><col width="85"><col width="60">
</colgroup>
<thead>
<tr>
<th scope="col">&nbsp;</th>
<th scope="col">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;No</th>
<th scope="col" style="text-align: center;">제목</th>
<th scope="col">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;글쓴이</th>
<th scope="col">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;날짜</th>
<th scope="col">&nbsp;&nbsp;&nbsp;조회수</th>
</tr>
</thead>
<tbody>
<c:forEach items="${allstoryboardlist }" var="storyboardvo">
<tr>
<td class="frm"><input id="chk_sel" type="checkbox" value=""><label for="chk_sel">선택</label></td>
<td class="num">${storyboardvo.idx}</td>
<td class="title"><a href=${pageContext.request.contextPath}/teatime.storyBoardDetail?idx=${storyboardvo.idx}>${storyboardvo.title}</a></td>
<td><a href="#">${storyboardvo.user_nick}</a></td>
<td class="date">${storyboardvo.wdate}</td>
<td class="hit">${storyboardvo.hit}</td>
</tr>
</c:forEach>
</tbody>
</table>
<ul>
</ul>
</div>
</div><!-- Content Area /- -->
</div><!-- Row /- -->
</div><!-- container /- -->
</div><!-- Aboute-me Section /- -->


	<div class="container-fluid no-left-padding no-right-padding footer-page">
		<!-- Footer Main -->
		<footer class="container-fluid no-left-padding no-right-padding footer-main footer-section1">
			<div class="container-fluid no-left-padding no-right-padding subscribe-block">
				<!-- Container -->
				<div class="container">
				
					<form class="newsletter" action="<%=request.getContextPath() %>/teatime.storyBoardSearch">
						<div class="input-group">
										
	<select name="searchColumn">
	<option>모두</option>
	<option>제목</option>
	<option>내용</option>
	<option>작성자</option>
	</select>

							<input type="text" class="form-control" placeholder="검색어를 입력해주세요." name="keyword">
							<span class="input-group-btn">
								<button class="btn btn-secondary" type="submit">검색</button>
							</span>
						</div>
					</form>
				</div><!-- Container /- -->
							<form action="teatime.storyBoardInsert" method="get">
<input type="button" id="write"  class="btn btn-secondary" value="스토리쓰기">
</form>		
			</div>
			</footer>
			
	</div>
<div class="entry-footer">
	<nav class="navigation pagination">
								<h2 class="screen-reader-text">Posts navigation</h2>
								<div class="nav-links">
									<a class="prev page-numbers" href="#">Previous</a>
									<c:forEach var="i" begin="1" end="${pageNumCount }">
									<input type="button" id="pageNum" class="page-numbers" value="${i }" onclick="location.href='<%=request.getContextPath()%>/teatime.storyBoardList?pageNum=${i}'">
							</c:forEach>
									<a class="next page-numbers" href="#">Next</a>
								</div>
							</nav><!-- Pagination /- -->				
						</div><!-- Content Area /- -->
					</div>
				
</div>
<script type="text/javascript">
$('#write').on('click',function(e){	
	var id = "${sessionId}";
	if(id==""){		
		alert("로그인을 하지 않았습니다.");
		location.href="${pageContext.request.contextPath}/member.login";
	}else{		
		location.href="${pageContext.request.contextPath}/teatime.storyBoardInsert";
	} 
});

</script>
<!-- 하단 include -->
<%@ include file="battom.jsp" %>
<!-- 하단 include -->	
</body>
</html>