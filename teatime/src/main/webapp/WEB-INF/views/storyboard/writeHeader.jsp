<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>상단 영역</title>
	
	
<!-- 언어 반응형 -->
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
<!-- 언어 반응형 -->
	
	<link rel="icon" type="image/x-icon" href="resources/assets/images/favicon.ico" />
	<link rel="apple-touch-icon-precomposed" href="resources/assets/images/apple-touch-icon-114x114-precomposed.png">
	<link rel="apple-touch-icon-precomposed" href="resources/assets/images/apple-touch-icon-72x72-precomposed.html">
	<link rel="apple-touch-icon-precomposed" href="resources/assets/images/apple-touch-icon-57x57-precomposed.png">	
    <link href="resources/assets/css/lib.css" rel="stylesheet">
	<link rel="stylesheet" href="resources/assets/css/rtl.css">
		<link rel="stylesheet" href="resources/css/nam.css">
	<link rel="stylesheet" type="text/css" href="resources/style.css">
	<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
	   <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="resources/bootstrap/js/bootstrap.min.js"></script>
    <script src="resources/bootstrap/css/bootstrap.min.css"></script>
    
    	<!-- JQuery v1.12.4 -->
	<script src="resources/assets/js/jquery-1.12.4.min.js"></script>

	<!-- Library - Js -->
	<script src="resources/assets/js/popper.min.js"></script>
	<script src="resources/assets/js/lib.js"></script>
	
	<!-- Library - Theme JS -->
	<script src="resources/assets/js/functions.js"></script>
	
	<script type="text/javascript">
/* UI Pattern Script */
/* //UI Pattern Script */
</script>
	
</head>
<body class="singletemplate" data-offset="200" data-spy="scroll" data-target=".ownavigation">
	<!-- Loader -->

		
	<!-- Header Section -->
	<header class="container-fluid no-left-padding no-right-padding header_s header-fix header_s1">
	
		<!-- SidePanel -->
		<div id="slidepanel-1" class="slidepanel">
			<!-- Top Header -->
			<div class="container-fluid no-right-padding no-left-padding top-header">
				<!-- Container -->
				<div class="container">	
					<div class="row">
						<div class="col-lg-4 col-6">
						</div>
						<div class="col-lg-4 logo-block">
							<a href="index.html" title="Logo">TEA :: TIME</a>
						</div>
						<div class="col-lg-4 col-6">
							<ul class="top-right user-info">
								<li><a href="#search-box" data-toggle="collapse" class="search collapsed" title="Search"><i class="pe-7s-search sr-ic-open"></i><i class="pe-7s-close sr-ic-close"></i></a></li>
								<li class="dropdown">
									<a class="dropdown-toggle" href="#"><i class="pe-7s-user"></i></a>
									<ul class="dropdown-menu">
									<c:choose>
										<c:when test="${sessionScope.sessionPermission == null}">
											<li><a class="dropdown-item" href="${pageContext.request.contextPath}/member.regist" title="회원가입">회원가입</a></li>
											<li><a class="dropdown-item" href="${pageContext.request.contextPath}/member.login" title="로그인">로그인</a></li>
										</c:when>
										<c:when test="${sessionScope.sessionPermission != null}">
											<li><a class="dropdown-item" href="${pageContext.request.contextPath}/member.checkModifyUserInfo" title="회원정보수정">회원정보수정</a></li>
											<li><a class="dropdown-item" href="${pageContext.request.contextPath}/member.logout" title="로그아웃">로그아웃</a></li>
										</c:when>
										</c:choose>
									</ul>
								</li>
							</ul>
						</div>
					</div>
				</div><!-- Container /- -->
			</div><!-- Top Header /- -->				
		</div><!-- SidePanel /- -->
		
		<!-- Menu Block -->
		<div class="container-fluid no-left-padding no-right-padding menu-block">
			<!-- Container -->
			<div class="container">				
				<nav class="navbar ownavigation navbar-expand-lg">
					<a class="navbar-brand" href="index.html">TEA :: TIME</a>
					<button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbar1" aria-controls="navbar1" aria-expanded="false" aria-label="Toggle navigation">
						<i class="fa fa-bars"></i>
					</button>
					<div class="collapse navbar-collapse" id="navbar1">
						<ul class="navbar-nav">							
						<li>&emsp;<a class="nav-link" title="home" href="#">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;home</a></li>
							<li>&emsp;<a class="nav-link" title="notices" href="#">notices</a></li>
							<li>&emsp;<a class="nav-link" title="story" href="#">story</a></li>
							<li>&emsp;<a class="nav-link" title="photo" href="#">photo</a></li>
							<li>&emsp;<a class="nav-link" title="media" href="#">media</a></li>
							<li>&emsp;<a class="nav-link" title="mypage" href="#">mypage</a></li>
							<li>&emsp;<a class="nav-link" title="Contact" href="#">Contact</a></li>
						</ul>
					</div>
					<div id="loginpanel-1" class="desktop-hide">
						<div class="right toggle" id="toggle-1">
							<a id="slideit-1" class="slideit" href="#slidepanel"><i class="fo-icons fa fa-inbox"></i></a>
							<a id="closeit-1" class="closeit" href="#slidepanel"><i class="fo-icons fa fa-close"></i></a>
						</div>
					</div>
				</nav>
			</div><!-- Container /- -->
		</div><!-- Menu Block /- -->
		<!-- Search Box -->
		<div class="search-box collapse" id="search-box">
			<div class="container">
			<form>
				<div class="input-group">
					<input type="text" class="form-control" placeholder="Search..." required>
					<span class="input-group-btn">
						<button class="btn btn-secondary" type="submit"><i class="pe-7s-search"></i></button>
					</span>
				</div>
			</form>
			</div>
		</div><!-- Search Box /- -->
	</header><!-- Header Section /- -->
	<br>
</body>
</html>