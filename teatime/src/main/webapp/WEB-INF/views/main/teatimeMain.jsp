<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>

<!-- 언어 반응형 -->
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
<!-- 언어 반응형 -->

	<title>Home 17 - MiniBlog</title>

	<!-- Standard Favicon -->
	<link rel="icon" type="image/x-icon" href="resources/assets/images/favicon.ico" />
	<link rel="apple-touch-icon-precomposed" href="resources/assets/images/apple-touch-icon-114x114-precomposed.png">
	<link rel="apple-touch-icon-precomposed" href="resources/assets/images/apple-touch-icon-72x72-precomposed.html">
	<link rel="apple-touch-icon-precomposed" href="resources/assets/images/apple-touch-icon-57x57-precomposed.png">	
	<link rel="stylesheet" type="text/css" href="resources/assets/revolution/css/settings.css">

    <link href="resources/assets/css/lib.css" rel="stylesheet">
	<link rel="stylesheet" href="resources/assets/css/rtl.css">
	<link rel="stylesheet" type="text/css" href="resources/style.css">

</head>

<body class="singletemplate" data-offset="200" data-spy="scroll" data-target=".ownavigation">
	<!-- Loader -->
	<div id="site-loader" class="load-complete">
		<div class="loader">
			<div class="line-scale"><div></div><div></div><div></div><div></div><div></div></div>
		</div>
	</div><!-- Loader /- -->
		
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
							<li><a class="nav-link" title="home" href="${pageContext.request.contextPath}/teatime.Main">home</a></li>
							<li><a class="nav-link" title="notices" href="#">notices</a></li>
							<li><a  class="nav-link" title="story" href="${pageContext.request.contextPath}/teatime.storyBoardList">story</a></li>
							<li><a class="nav-link" title="photo" href="#">photo</a></li>
							<li><a class="nav-link" title="media" href="#">media</a></li>
							<li><a class="nav-link" title="mypage" href="#">mypage</a></li>
							<li><a class="nav-link" title="Contact" href="#">Contact</a></li>
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

	<div class="main-container">
	
		<main class="site-main">

			<!-- Slider Section -->
			<div class="container-fluid no-left-padding no-right-padding slider-section slider-section2">
				<!-- Container -->
				<div class="container">
					<div id="slider-carousel-2" class="carousel slide" data-ride="carousel">
						<div class="carousel-inner" role="listbox">
							<div class="carousel-item active">
								<div class="row">
									<div class="col-lg-8 col-sm-12 post-block post-big">
										<div class="post-box">
											<img src="resources/assets/images/11.jpg" alt="Slide" />
											<div class="entry-content">
												<span class="post-category"><a href="#" title="Travel">Story OF MY LIFE</a></span>
												<h3><a href="#" title="Best Surfing Spots for Beginners and Advanced"></a></h3>
												<a href="#" title="Read More">Read More</a>
											</div>
										</div>
									</div>
									<div class="col-lg-4 col-sm-12 post-block post-thumb">
										<div class="post-box">
											<img src="resources/assets/images/13.jpg" alt="Slide" />
											<div class="entry-content">
												<span class="post-category"><a href="#" title="Sport">STORY OF ANIMAL</a></span>
												<h3><a href="#" title="High-Tech Prototype Bike Announced"></a></h3>
												<a href="#" title="Read More">Read More</a>
											</div>
										</div>
										<div class="post-box">
											<img src="resources/assets/images/12.PNG" alt="Slide" />
											<div class="entry-content">
												<span class="post-category"><a href="#" title="Nature">STORY OF Entertainment</a></span>
												<h3><a href="#" title="White Sand of The Desert Discovery"></a></h3>
												<a href="#" title="Read More">Read More</a>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="carousel-item">
								<div class="row">
									<div class="col-lg-8 post-block post-big">
										<div class="post-box">
											<img src="resources/assets/images/13.jpg" alt="Slide" />
											<div class="entry-content">
												<span class="post-category"><a href="#" title="Travel">STORY OF animal</a></span>
												<h3><a href="#" title="Best Surfing Spots for Beginners and Advanced"></a></h3>
												<a href="#" title="Read More">Read More</a>
											</div>
										</div>
									</div>
									<div class="col-lg-4 post-block post-thumb">
										<div class="post-box">
											<img src="resources/assets/images/11.jpg" alt="Slide" />
											<div class="entry-content">
												<span class="post-category"><a href="#" title="Sport">STORY OF mylife</a></span>
												<h3><a href="#" title="High-Tech Prototype Bike Announced"></a></h3>
												<a href="#" title="Read More">Read More</a>
											</div>
										</div>
										<div class="post-box">
											<img src="resources/assets/images/12.PNG"" alt="Slide" />
											<div class="entry-content">
												<span class="post-category"><a href="#" title="Nature">STORY OF Entertainment</a></span>
												<h3><a href="#" title="White Sand of The Desert Discovery"></a></h3>
												<a href="#" title="Read More">Read More</a>
											</div>
										</div>
									</div>
								</div>
							</div>
							
									<div class="carousel-item">
								<div class="row">
									<div class="col-lg-8 post-block post-big">
										<div class="post-box">
											<img src="resources/assets/images/12.PNG" alt="Slide" />
											<div class="entry-content">
												<span class="post-category"><a href="#" title="Travel">STORY OF Entertainment</a></span>
												<h3><a href="#" title="Best Surfing Spots for Beginners and Advanced"></a></h3>
												<a href="#" title="Read More">Read More</a>
											</div>
										</div>
									</div>
									<div class="col-lg-4 post-block post-thumb">
										<div class="post-box">
											<img src="resources/assets/images/11.jpg" alt="Slide" />
											<div class="entry-content">
												<span class="post-category"><a href="#" title="Sport">STORY OF mylife</a></span>
												<h3><a href="#" title="High-Tech Prototype Bike Announced"></a></h3>
												<a href="#" title="Read More">Read More</a>
											</div>
										</div>
										<div class="post-box">
											<img src="resources/assets/images/13.jpg" alt="Slide" />
											<div class="entry-content">
												<span class="post-category"><a href="#" title="Nature">STORY OF animal</a></span>
												<h3><a href="#" title="White Sand of The Desert Discovery"></a></h3>
												<a href="#" title="Read More">Read More</a>
											</div>
										</div>
									</div>
								</div>
							</div>
									
						</div>
					</div>
				</div><!-- Container /- -->
			</div><!-- Slider Section /- -->
			
			<!-- Trending Section -->
			<div class="container-fluid no-left-padding no-right-padding trending-section">
				<!-- Container -->
				<div class="container">
					<!-- Section Header -->
					<div class="section-header">
						<h4>실시간 베스트</h4>
					</div><!-- Section Header /- -->
					<div class="trending-carousel">
						<div class="type-post">
							<div class="entry-cover"><a href="#"><img src="http://via.placeholder.com/270x220" alt="Trending" /></a></div>
							<div class="entry-content">
								<div class="entry-header">
									<span><a href="#" title="Art">Art</a></span>
									<h3 class="entry-title"><a href="#">A penguin bicycled behind an escalator</a></h3>
								</div>
							</div>
						</div>
						<div class="type-post">
							<div class="entry-cover"><a href="#"><img src="http://via.placeholder.com/270x220" alt="Trending" /></a></div>
							<div class="entry-content">
								<div class="entry-header">
									<span><a href="#" title="Travel">TRAVEL</a></span>
									<h3 class="entry-title"><a href="#">There was a legend about the well in the garden</a></h3>
								</div>
							</div>
						</div>
						<div class="type-post">
							<div class="entry-cover"><a href="#"><img src="http://via.placeholder.com/270x220" alt="Trending" /></a></div>
							<div class="entry-content">
								<div class="entry-header">
									<span><a href="#" title="Nature">NATURE</a></span>
									<h3 class="entry-title"><a href="#">The entrance to the tunnel was his only way out</a></h3>
								</div>
							</div>
						</div>
						<div class="type-post">
							<div class="entry-cover"><a href="#"><img src="http://via.placeholder.com/270x220" alt="Trending" /></a></div>
							<div class="entry-content">
								<div class="entry-header">
									<span><a href="#" title="Nature">NATURE</a></span>
									<h3 class="entry-title"><a href="#">He was going back to a place he'd hoped</a></h3>
								</div>
							</div>
						</div>
					</div>
				</div><!-- Container /- -->
			</div><!-- Trending Section /- -->
			<!-- Page Content -->
			<div class="container-fluid no-left-padding no-right-padding page-content">
				<!-- Container -->
				<div class="container">
					<div class="row">
						<!-- Content Area -->
						<div class="col-lg-8 col-md-6 content-area">
							<!-- Row -->
							<div class="row">
								<div class="col-lg-6 col-md-12 col-sm-6">
									<div class="type-post">
										<div class="entry-cover">
											<div class="post-meta">
												
											</div>
											
										</div>
										<div class="entry-content">
											<div class="entry-header">	
												<span class="post-category"><a href="#" title="Technology">Technology</a></span>
												<h3 class="entry-title"><a href="#" title="Traffic Jams Solved">Traffic Jams Solved </a></h3>
											</div>								
											<p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings...</p>
											<a href="#" title="Read More">Read More</a>
										</div>
									</div>
								</div>
								<div class="col-lg-6 col-md-12 col-sm-6">
									<div class="type-post">
										<div class="entry-cover">
											<div class="post-meta">
												
											</div>
											
										</div>
										<div class="entry-content">
											<div class="entry-header">	
												<span class="post-category"><a href="#" title="Travel">Travel</a></span>
												<h3 class="entry-title"><a href="#" title="Charming Evening Field">Charming Evening Field</a></h3>
											</div>								
											<p>No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely...</p>
											<a href="#" title="Read More">Read More</a>
										</div>
									</div>
								</div>
								<div class="col-lg-6 col-md-12 col-sm-6">
									<div class="type-post">
										<div class="entry-cover">
											<div class="post-meta">
												
											</div>
											
										</div>
										<div class="entry-content">
											<div class="entry-header">	
												<span class="post-category"><a href="#" title="Travel">Travel</a></span>
												<h3 class="entry-title"><a href="#" title="Boat Trip to Mediterranean">Boat Trip to Mediterranean</a></h3>
											</div>								
											<p>These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best...</p>
											<a href="#" title="Read More">Read More</a>
										</div>
									</div>
								</div>
								<div class="col-lg-6 col-md-12 col-sm-6">
									<div class="type-post">
										<div class="entry-cover">
											<div class="post-meta">
											
											</div>
											
										</div>
										<div class="entry-content">
											<div class="entry-header">	
												<span class="post-category"><a href="#" title="Nature">Nature</a></span>
												<h3 class="entry-title"><a href="#" title="Cliff Sunset Sea View">Cliff Sunset Sea View</a></h3>
											</div>								
											<p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings...</p>
											<a href="#" title="Read More">Read More</a>
										</div>
									</div>
								</div>
								<div class="col-lg-6 col-md-12 col-sm-6">
									<div class="type-post">
										<div class="entry-cover">
											<div class="post-meta">
												
											</div>
											
										</div>
										<div class="entry-content">
											<div class="entry-header">	
												<span class="post-category"><a href="#" title="Lifestyle">Lifestyle</a></span>
												<h3 class="entry-title"><a href="#" title="Trendy Summer Fashion">Trendy Summer Fashion</a></h3>
											</div>								
											<p>To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses...</p>
											<a href="#" title="Read More">Read More</a>
										</div>
									</div>
								</div>
								<div class="col-lg-6 col-md-12 col-sm-6">
									<div class="type-post">
										<div class="entry-cover">
											<div class="post-meta">
										
											</div>
											
										</div>
										<div class="entry-content">
											<div class="entry-header">	
												<span class="post-category"><a href="#" title="Travel">Travel</a></span>
												<h3 class="entry-title"><a href="#" title="Hammock Camping Tips">Hammock Camping Tips</a></h3>
											</div>								
											<p>No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely...</p>
											<a href="#" title="Read More">Read More</a>
										</div>
									</div>
								</div>
								<div class="col-lg-6 col-md-12 col-sm-6">
									<div class="type-post">
										<div class="entry-cover">
											<div class="post-meta">
									
											</div>
									
										</div>
										<div class="entry-content">
											<div class="entry-header">	
												<span class="post-category"><a href="#" title="Travel">Travel</a></span>
												<h3 class="entry-title"><a href="#" title="Beautiful Rio de Janeiro">Beautiful Rio de Janeiro</a></h3>
											</div>								
											<p>No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely...</p>
											<a href="#" title="Read More">Read More</a>
										</div>
									</div>
								</div>
								<div class="col-lg-6 col-md-12 col-sm-6">
									<div class="type-post">
										<div class="entry-cover">
											<div class="post-meta">
											
											</div>
										
										</div>
										<div class="entry-content">
											<div class="entry-header">	
												<span class="post-category"><a href="#" title="Lifestyle">Lifestyle</a></span>
												<h3 class="entry-title"><a href="#" title="New Fashion Outfits">New Fashion Outfits</a></h3>
											</div>								
											<p>To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses...</p>
											<a href="#" title="Read More">Read More</a>
										</div>
									</div>
								</div>
							</div><!-- Row /- -->
							<!-- Pagination -->

						</div><!-- Content Area /- -->
						<!-- Widget Area -->
						<div class="col-lg-4 col-md-6 widget-area">
							<!-- Widget : Latest Post -->
							<aside class="widget widget_latestposts">
								<h3 class="widget-title">베스트 댓글</h3>
								
								
							<h5>1. <a title="Beautiful Landscape View of Rio de Janeiro" href="#">Landscape View of Rio de Janeiro....(100)</a></h5>
							<h5>2. <a title="Beautiful Landscape View of Rio de Janeiro" href="#">Landscape View of Rio de Janeiro....(100)</a></h5>
							<h5>3. <a title="Beautiful Landscape View of Rio de Janeiro" href="#">Landscape View of Rio de Janeiro....(100)</a></h5>
							<h5>4. <a title="Beautiful Landscape View of Rio de Janeiro" href="#">Landscape View of Rio de Janeiro....(100)</a></h5>
							<h5>5. <a title="Beautiful Landscape View of Rio de Janeiro" href="#">Landscape View of Rio de Janeiro....(100)</a></h5>
							<h5>6. <a title="Beautiful Landscape View of Rio de Janeiro" href="#">Landscape View of Rio de Janeiro....(100)</a></h5>
							<h5>7. <a title="Beautiful Landscape View of Rio de Janeiro" href="#">Landscape View of Rio de Janeiro....(100)</a></h5>
							<h5>8. <a title="Beautiful Landscape View of Rio de Janeiro" href="#">Landscape View of Rio de Janeiro....(100)</a></h5>
							<h5>9. <a title="Beautiful Landscape View of Rio de Janeiro" href="#">Landscape View of Rio de Janeiro....(100)</a></h5>
							<h5>10. <a title="Beautiful Landscape View of Rio de Janeiro" href="#">Landscape View of Rio de Janeiro....(100)</a></h5>
					
							</aside><!-- Widget : Latest Post /- -->
							<!-- Widget : Categories -->
							<aside class="widget widget_categories text-center">
								<h3 class="widget-title">카테고리</h3>
								<ul>
									<li><a href="#" title="Nature">엔터테인먼트</a></li>
									<li><a href="#" title="Technology">동물사랑</a></li>
									<li><a href="#" title="Travel">사건사고</a></li>
									<li><a href="#" title="Sport">공지사항</a></li>
									<li><a href="#" title="Lifestyle">내가쓴글보기</a></li>
								</ul>
							</aside><!-- Widget : Categories /- -->
							<!-- Widget : Tranding Post -->
							<aside class="widget widget_tranding_post">
								<h3 class="widget-title">인기 동영상</h3>
								<div id="trending-widget" class="carousel slide" data-ride="carousel">
									<div class="carousel-inner">
										<div class="carousel-item active">
											<div class="trnd-post-box">
												<div class="post-cover"><a href="#"><img src="http://via.placeholder.com/345x230" alt="Tranding Post" /></a></div>
												<span class="post-category"><a href="#" title="Lifestyle">Lifestyle</a></span>
												<h3 class="post-title"><a href="#">New Fashion Collection Show This Weekend in Boston </a></h3>
											</div>
										</div>
										<div class="carousel-item">
											<div class="trnd-post-box">
												<div class="post-cover"><a href="#"><img src="http://via.placeholder.com/345x230" alt="Tranding Post" /></a></div>
												<span class="post-category"><a href="#" title="Lifestyle">Lifestyle</a></span>
												<h3 class="post-title"><a href="#">New Fashion Collection Show This Weekend in Boston </a></h3>
											</div>
										</div>
										<div class="carousel-item">
											<div class="trnd-post-box">
												<div class="post-cover"><a href="#"><img src="http://via.placeholder.com/345x230" alt="Tranding Post" /></a></div>
												<span class="post-category"><a href="#" title="Lifestyle">Lifestyle</a></span>
												<h3 class="post-title"><a href="#">New Fashion Collection Show This Weekend in Boston </a></h3>
											</div>
										</div>
									</div>
									<ol class="carousel-indicators">
										<li data-target="#trending-widget" data-slide-to="0" class="active"></li>
										<li data-target="#trending-widget" data-slide-to="1"></li>
										<li data-target="#trending-widget" data-slide-to="2"></li>
									</ol>
								</div>
							</aside><!-- Widget : Tranding Post /- -->
							<!-- Widget : Follow Us -->
							<aside class="widget widget_social">
								<h3 class="widget-title">소셜커머스</h3>
								<ul>
									<li><a href="#" title=""><i class="ion-social-facebook-outline"></i></a></li>
									<li><a href="#" title=""><i class="ion-social-twitter-outline"></i></a></li>
									<li><a href="#" title=""><i class="ion-social-instagram-outline"></i></a></li>
									<li><a href="#" title=""><i class="ion-social-googleplus-outline"></i></a></li>
									<li><a href="#" title=""><i class="ion-social-pinterest-outline"></i></a></li>
									<li><a href="#" title=""><i class="ion-social-vimeo-outline"></i></a></li>
								</ul>
							</aside><!-- Widget : Follow Us /- -->
							
					
						</div><!-- Widget Area /- -->
					</div>
				</div><!-- Container /- -->
			</div><!-- Page Content /- -->
			
		</main>
		
	</div>
	
	<!-- Footer Main /- -->
<div class="padding-100"></div>
		<div class="padding-50"></div>
		
		<!-- Footer Main -->
		<footer class="container-fluid no-left-padding no-right-padding footer-main footer-section1">
			<!-- Container -->
			<div class="container">
				<ul class="ftr-social">
					<li><a href="#" title="Facebook"><i class="fa fa-facebook"></i>Facebook</a></li>
					<li><a href="#" title="Twitter"><i class="fa fa-twitter"></i>twitter</a></li>
					<li><a href="#" title="Instagram"><i class="fa fa-instagram"></i>Instagram</a></li>
					<li><a href="#" title="Google Plus"><i class="fa fa-google-plus"></i>Google plus</a></li>
					<li><a href="#" title="Pinterest"><i class="fa fa-pinterest-p"></i>pinterest</a></li>
					<li><a href="#" title="Youtube"><i class="fa fa-youtube"></i>youtube</a></li>
				</ul>
				<div class="copyright">
					<p>Copyright @ 2017 MINIBLOG</p>
				</div>
			</div><!-- Container /- -->
		</footer><!-- Footer Main /- -->
	
	<!-- JQuery v1.12.4 -->
	<script src="resources/assets/js/jquery-1.12.4.min.js"></script>

	<!-- Library - Js -->
	<script src="resources/assets/js/popper.min.js"></script>
	<script src="resources/assets/js/lib.js"></script>
	
	<!-- REVOLUTION JS FILES -->
	<script type="text/javascript" src="resources/assets/revolution/js/jquery.themepunch.tools.min.js"></script>
	<script type="text/javascript" src="resources/assets/revolution/js/jquery.themepunch.revolution.min.js"></script>

	<!-- SLIDER REVOLUTION 5.0 EXTENSIONS  (Load Extensions only on Local File Systems !  The following part can be removed on Server for On Demand Loading) -->	
	<script type="text/javascript" src="resources/assets/revolution/js/extensions/revolution.extension.actions.min.js"></script>
	<script type="text/javascript" src="resources/assets/revolution/js/extensions/revolution.extension.carousel.min.js"></script>
	<script type="text/javascript" src="resources/assets/revolution/js/extensions/revolution.extension.kenburn.min.js"></script>
	<script type="text/javascript" src="resources/assets/revolution/js/extensions/revolution.extension.layeranimation.min.js"></script>
	<script type="text/javascript" src="resources/assets/revolution/js/extensions/revolution.extension.migration.min.js"></script>
	<script type="text/javascript" src="resources/assets/revolution/js/extensions/revolution.extension.navigation.min.js"></script>
	<script type="text/javascript" src="resources/assets/revolution/js/extensions/revolution.extension.parallax.min.js"></script>
	<script type="text/javascript" src="resources/assets/revolution/js/extensions/revolution.extension.slideanims.min.js"></script>
	<script type="text/javascript" src="resources/assets/revolution/js/extensions/revolution.extension.video.min.js"></script>
		
	<!-- Library - Theme JS -->
	<script src="resources/assets/js/functions.js"></script>
	
</body>
</html>