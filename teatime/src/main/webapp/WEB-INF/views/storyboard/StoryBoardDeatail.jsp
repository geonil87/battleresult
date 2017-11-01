<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ include file="header.jsp" %>
<!DOCTYPE html>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="resources/jquery-3.2.1.min.js"></script>
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
								<hr>
								<div class="block-title">
									<h3>${detail.title}</h3>
								</div>
								<hr>
								<p>${detail.content}</p>
								<ul>
									
								</ul>
							</div>
						</div><!-- Content Area /- -->
					</div><!-- Row /- -->
				</div><!-- container /- -->
			</div><!-- Aboute-me Section /- -->
			
<!-- 신고 이미지 -->		
			<div class="entry-footer">
<div class="tags" align="right">
<a href="${pageContext.request.contextPath }/teatime.storyBoardReport?idx=${detail.idx}"><img src="resources/assets/images/6.PNG" alt="Post Image" /></a>
</div>
</div>
<!-- 신고 이미지 -->
<hr>
							
<!-- About Author -->
<div class="about-author-box">
<h4>글쓴이 ${detail.user_nick}</h4>
<div class="post-meta">
<span class="byline">by <a href="#" title="Indesign">작성시간</a></span>
<span class="post-date">${detail.wdate }</span>
</div>
<div align="center">
<span id="goodValue" style="font-size:80px">${recommend.good }</span>&nbsp;&nbsp;
<img id="good" src="resources/assets/images/3.PNG" alt="Post Image" />&nbsp;
<img id="bad" src="resources/assets/images/4.PNG" alt="Post Image" />&nbsp;&nbsp;
<span id="badValue" style="font-size:80px">${recommend.bad }</span>
</div>
<hr>





		
<input type="submit"  class="btn btn-default" onclick="location.href='${pageContext.request.contextPath}/teatime.storyBoardList'" value="목록">
<input type="button" id="modify" class="btn btn-default"  value="수정">
<input type="button" id="delete" class="btn btn-default" value="삭제">
							
							<!-- Comment Area -->
							<div class="comments-area">
								<h2 class="comments-title">${countcomment} Comments</h2>
								<c:forEach items="${comment}" var="comment" varStatus="status">								
								<ol class="comment-list">
									<li class="comment byuser comment-author-admin bypostauthor even thread-even depth-1 parent">
								<c:if test="${comment.indent==0}">
										<div class="comment-body">
											<footer class="comment-meta">
												<div class="comment-author vcard">
													
													<b class="fn">${comment.user_nick}</b>
												</div>
												<div class="comment-metadata">
													<a href="#">${comment.wdate}</a>											
												</div>
											</footer>
											
											<div class="comment-content">
											<c:if test="${comment.available==0}">
												<p>${comment.content}</p>
											</c:if>
											<c:if test="${comment.available!=0}">
													[삭제된 댓글입니다.]
											</c:if>	
											</div>
											<span class="commentGood">추천 :<input type="hidden" value="${comment.idx }"></span><span class="commentGoodValue">${commentRecommend[status.index].good }</span>
											<span class="commentBad">비추천 :<input type="hidden" value="${comment.idx }"></span><span class="commentBadvalue">${commentRecommend[status.index].bad }</span>
											<a href="${pageContext.request.contextPath }/teatime.commentReport?board_idx=${detail.idx}&comment_idx=${comment.idx}">신고</a>
									<!-- 삭제 -->
											<c:if test="${comment.available==0}">
											<a href="${pageContext.request.contextPath}/teatime.storyBoardCommentDelete?idx=${comment.idx}&board_idx=${detail.idx}">삭제</a>
											</c:if>
									<!-- 삭제 -->	
										<!-- 댓글수정 -->
										<c:if test="${comment.available==0}">
											<a href='javascript:void(0)' onclick="this.innerHTML=(this.nextSibling.style.display=='none')?'글수정취소':'글수정';this.nextSibling.style.display=(this.nextSibling.style.display=='none')?'block':'none'";>글수정</a><DIV style='display:none'>				
												<div class="comment-respond">
													<h2 class="comment-reply-title">글 수정하기</h2>
													<form method="post" class="comment-form" action="${pageContext.request.contextPath}/teatime.storyBoardCommentModify">
														<p class="comment-form-author">
															<input type="hidden" name="idx" value="${comment.idx}">
															<input type="hidden" name="board_idx" value="${detail.idx}">
															<input type="hidden" name="comment_group" value="${comment.comment_group}">
														
														</p>
														<p class="comment-form-comment">
															<textarea id="comment" name="content" rows="8" required="required" >${comment.content}</textarea>
														</p>
														<p class="form-submit">
															<input name="submit" class="submit" value="저장" type="submit"/>
														</p>
													</form>
												</div>
											</DIV>
										</c:if>
										<!-- 댓글달기 -->	
							<c:if test="${comment.available==0}">			
							<a href='javascript:void(0)' onclick="this.innerHTML=(this.nextSibling.style.display=='none')?'댓글취소':'댓글달기';this.nextSibling.style.display=(this.nextSibling.style.display=='none')?'block':'none'";>댓글달기</a><DIV style='display:none'>				
								<div class="comment-respond">
									<h2 class="comment-reply-title">댓글 쓰기</h2>
									<form method="post" class="comment-form" action="${pageContext.request.contextPath}/teatime.storyBoardReCommentInsert">
										<p class="comment-form-author">
											<input type="hidden" name="indent" value="${comment.indent}">
											<input type="hidden" name="comment_group" value="${comment.comment_group}">
											<input type="hidden" name="board_idx" value="${detail.idx }">
										
										</p>
										<p class="comment-form-comment">
											<textarea id="comment" name="content" placeholder="내용을 입력해주세요." rows="8" required="required"></textarea>
										</p>
										<p class="form-submit">
											<input name="submit" class="submit" value="저장" type="submit"/>
										</p>
									</form>
								</div><!--Comment Form /- -->
											</DIV>
											</c:if>									
										
										</div>											
										</c:if>
										<c:if test="${comment.indent>=1}">						
										<ol class="children">
											<li class="comment byuser comment-author-admin bypostauthor odd alt depth-2 parent">
												<div class="comment-body">
													<footer class="comment-meta">
														<div class="comment-author vcard">
															
															<b class="fn">${comment.user_nick}</b>
														</div>
														<div class="comment-metadata">
															<a href="#">${comment.wdate}</a>											
														</div>
													</footer>
													<div class="comment-content">
														<c:if test="${comment.available==0}">
														<p>${comment.content}</p>
														</c:if>
														<c:if test="${comment.available!=0}">
														[삭제된 댓글입니다.]
														</c:if>	
													</div>
														<span class="commentGood">추천 :<input type="hidden" value="${comment.idx }"></span><span class="commentGoodValue">${commentRecommend[status.index].good }</span>
														<span class="commentBad">비추천 :<input type="hidden" value="${comment.idx }"></span><span class="commentBadvalue">${commentRecommend[status.index].bad }</span>
														<a href="${pageContext.request.contextPath }/teatime.commentReport?board_idx=${detail.idx}&comment_idx=${comment.idx}">신고</a>
															<!-- 											삭제  -->
													<c:if test="${comment.available==0}">
													<a href="${pageContext.request.contextPath}/teatime.storyBoardCommentDelete?idx=${comment.idx}&board_idx=${detail.idx}">삭제</a>
													</c:if>
		<!-- 											삭제 -->	
		<!-- 												댓글수정 -->
													<c:if test="${comment.available==0}">
													<a href='javascript:void(0)' onclick="this.innerHTML=(this.nextSibling.style.display=='none')?'글수정취소':'글수정';this.nextSibling.style.display=(this.nextSibling.style.display=='none')?'block':'none'";>글수정</a><DIV style='display:none'>				
														<div class="comment-respond">
															<h2 class="comment-reply-title">글 수정하기</h2>
															<form method="post" class="comment-form" action="${pageContext.request.contextPath}/teatime.storyBoardCommentModify">
																<p class="comment-form-author">
																	<input type="hidden" name="idx" value="${comment.idx}">
																	<input type="hidden" name="board_idx" value="${detail.idx}">
																	<input type="hidden" name="comment_group" value="${comment.comment_group}">
																
																</p>
																<p class="comment-form-comment">
																	<textarea id="comment" name="content" rows="8" required="required" >${comment.content}</textarea>
																</p>
																<p class="form-submit">
																	<input name="submit" class="submit" value="저장" type="submit"/>
																</p>
															</form>
														</div>
													</DIV>
													</c:if>
													<div class="reply">
														
													</div>
												</div>
											</li>
										</ol>
										</c:if>
									</li>
								</ol>
								</c:forEach>
								<!-- comment-list /- -->

				
                        <div class="comment-respond">
                           <h2 class="comment-reply-title">댓글 쓰기</h2>
                           <form method="post" class="comment-form" action="${pageContext.request.contextPath}/teatime.storyBoardCommentInsert">
                              <p class="comment-form-author">
                                 <input type="hidden" name="board_idx" value="${detail.idx }">
                               
                              </p>
                              <p class="comment-form-comment">
                                 <textarea id="comment" name="content" placeholder="내용을 입력해주세요." rows="8" required="required"></textarea>
                              </p>
                              <p class="form-submit">
                                 <input name="submit" class="submit" value="저장" type="submit"/>
                              </p>
                           </form>
                        </div><!--Comment Form /- -->
							
							</div><!-- Comment Area /- -->
						
						</div><!-- Content Area /- -->
					</div>
				</div><!-- Container /- -->


<script type="text/javascript">
$(document).ready(function(){
	var idx = ${detail.idx};
	$('#good').on("click",function(){
		var id = "${sessionId}";
		if(id==""){		
			alert("로그인을 하지 않았습니다.");
			location.href="${pageContext.request.contextPath}/member.login";
		}else{
			recommend("good",idx);
		}
	});
	$('#bad').on("click",function(){
		var id = "${sessionId}";
		if(id==""){		
			alert("로그인을 하지 않았습니다.");
			location.href="${pageContext.request.contextPath}/member.login";
		}else{
			recommend("bad",idx);
		}
	});
	$('.commentGood').on("click",function(){
		var id = "${sessionId}";
		if(id==""){		
			alert("로그인을 하지 않았습니다.");
			location.href="${pageContext.request.contextPath}/member.login";
		}else{
			var comment_idx = $(this).children(':hidden').val();
			var goodLocation = $(this).next('.commentGoodValue');
			var badLocation = $(this).next('.commentBadValue');
			commentRecommend("good",comment_idx,goodLocation,badLocation);
		}
		
	});		

	$('.commentBad').on("click",function(){
		var id = "${sessionId}";
		if(id==""){		
			alert("로그인을 하지 않았습니다.");
			location.href="${pageContext.request.contextPath}/member.login";
		}else{		
			var comment_idx = $(this).children(':hidden').val();		
			var goodLocation = $(this).prev('.commentGoodValue');
			var badLocation = $(this).next('.commentBadValue');
			commentRecommend("bad",comment_idx,goodLocation,badLocation);
		}
	});
	
	$('#modify').on('click',function(){
		var id = "${sessionId}";
		var locationPath="${pageContext.request.contextPath}/teatime.storyBoardModify?idx=${param.idx}";
		if(id==""){		
			alert("로그인을 하지 않았습니다.");
			location.href="${pageContext.request.contextPath}/member.login";
		}else{		
			var idx = ${detail.idx };
			checkWriter(idx,locationPath);
		} 
	});
	
	$('#delete').on('click',function(){
		var id = "${sessionId}";
		var locationPath = "${pageContext.request.contextPath}/teatime.storyBoardDelet?idx=${param.idx}";
		if(id==""){		
			alert("로그인을 하지 않았습니다.");
			location.href="${pageContext.request.contextPath}/member.login";
		}else{		
			var idx = ${detail.idx };
			checkWriter(idx,locationPath);
		} 
	});
});
function recommend(recommend,idx){
	$.ajax({
		type:"post",
		data:{"recommend":recommend,"idx":idx},
		url:"<%= request.getContextPath()%>/teatime.storyBoardRecommend",
		success:function(result){			
			$('#goodValue').html(result.good);
			$('#badValue').html(result.bad);
		}
	});
}

function commentRecommend(recommend,idx,goodLocation,badLocation){
	$.ajax({
		type:"post",
		data:{"recommend":recommend,"idx":idx},
		url:"<%= request.getContextPath()%>/teatime.commentRecommend",
		success:function(result){
 			console.log(result); 			
 			goodLocation.html(result.good);
 			badLocation.html(result.bad); 			
		}
	});
}

function checkWriter(idx,locationPath){
	$.ajax({
		type:"post",
		data:{"idx":idx},
		url: "${pageContext.request.contextPath}/teatime.checkWriter",
		success:function(result){			
			if(result==1){				
				location.href=locationPath;
			}else{
				alert("해당글의 권한이 없습니다.")
			}
		}
	});
}

</script>

	
	
<%@ include file="battom.jsp" %>

</body>
</html>