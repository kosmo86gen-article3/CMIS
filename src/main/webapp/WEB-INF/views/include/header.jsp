<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>DirectoryListing</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="manifest" href="site.webmanifest">
    <link rel="shortcut icon" type="image/x-icon" href="resources/img/favicon.ico">

	<!-- CSS here -->
	<link rel="stylesheet" href="resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="resources/css/owl.carousel.min.css">
	<link rel="stylesheet" href="resources/css/slicknav.css">
    <link rel="stylesheet" href="resources/css/flaticon.css">
    <link rel="stylesheet" href="resources/css/progressbar_barfiller.css">
    <link rel="stylesheet" href="resources/css/gijgo.css">
    <link rel="stylesheet" href="resources/css/animate.min.css">
    <link rel="stylesheet" href="resources/css/animated-headline.css">
	<link rel="stylesheet" href="resources/css/magnific-popup.css">
	<link rel="stylesheet" href="resources/css/fontawesome-all.min.css">
	<link rel="stylesheet" href="resources/css/themify-icons.css">
	<link rel="stylesheet" href="resources/css/slick.css">
	<link rel="stylesheet" href="resources/css/nice-select.css">
	<link rel="stylesheet" href="resources/css/style.css">
</head>
<body>

    <!-- ? Preloader Start -->
    <div id="preloader-active">
        <div class="preloader d-flex align-items-center justify-content-center">
            <div class="preloader-inner position-relative">
                <div class="preloader-circle"></div>
                <div class="preloader-img pere-text">
                    <img src="resources/img/logo/loder.png" alt="">
                </div>
            </div>
        </div>
    </div>
    <!-- Preloader Start -->
    <header>
        <!-- Header Start -->
        <div class="header-area header">
            <div class="main-header header-sticky">
                <div class="container-fluid">
                    <div class="menu-wrapper d-flex align-items-center justify-content-between">
                        <!-- Logo -->
                        <div class="logo">
                            <a href="index.jsp"><img src="resources/img/logo/logo.png" alt=""></a>
                        </div>
                        <!-- Main-menu -->
                        <div class="main-menu f-right d-none d-lg-block">
                            <nav>
                                <ul id="navigation">
                                    <li><a href="#">최저가 매장 찾기</a>
                                        <ul class="submenu">
                                            <li><a href="directory_details.html">상품별 최저가</a></li>
                                            <li><a href="listing.html">매장별 최저가</a></li> 
                                        </ul>
                                    </li>
                                    <li><a href="productList.do">데이터 센터</a>
                                        <ul class="submenu">
                                            <li><a href="productList.do">상품 목록</a></li>
                                            <li><a href="listing.html">상품 상세 정보 </a></li> 
                                        </ul>
                                    </li>
                                    <li><a href="#">커뮤니티</a>
                                        <ul class="submenu">
                                            <li><a href="board.do">자유 게시판</a></li>
                                            <li><a href="listing.html">뉴스 / Hot issue</a></li>
                                            <li><a href="listing.html">실시간 채팅</a></li> 
                                            <li><a href="listing.html">Q/A</a></li> 
                                        </ul>
                                    </li>
                                    <li><a href="blog.html">마이페이지</a>
                                        <ul class="submenu">
                                            <li><a href="blog.html">회원 정보 수정</a></li>
                                            <li><a href="blog_details.html">등록글 조회</a></li>
                                            <li><a href="elements.html">관심물품 조회</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="contact.html">Contact</a></li>
                                </ul>
                            </nav>
                        </div>          
                        <!-- Header-btn -->
                        <div class="header-btns d-none d-lg-block f-right">
                        	<c:choose> 
								<c:when test="${sessionScope.userId == null }">
									<a href="loginPage.do" class="mr-40"><i class="ti-user"> Sign in / Sign up</i></a>
                            		<a href="map.do" class="btn">Add Listing</a>
								</c:when> 
								<c:when test="${sessionScope.userId != null }">
									<a href="#" class="mr-40"><i class="ti-user">${sessionScope.memberName } 님</i></a>
									<a href="logout.do" class="mr-40"><i class="fas fa-sign-out-alt"></i></a>	
									<a href="map.do" class="btn">Add Listing</a>
								</c:when> 
							</c:choose>
                        </div>
                        <!-- Mobile Menu -->
                        <div class="col-12">
                            <div class="mobile_menu d-block d-lg-none"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Header End -->
    </header>
    

 <!-- JS here -->

    <script src="./resources/js/vendor/modernizr-3.5.0.min.js"></script>
    <!-- Jquery, Popper, Bootstrap -->
    <script src="./resources/js/vendor/jquery-1.12.4.min.js"></script>
    <script src="./resources/js/popper.min.js"></script>
    <script src="./resources/js/bootstrap.min.js"></script>
    <!-- Jquery Mobile Menu -->
    <script src="./resources/js/jquery.slicknav.min.js"></script>

    <!-- Jquery Slick , Owl-Carousel Plugins -->
    <script src="./resources/js/owl.carousel.min.js"></script>
    <script src="./resources/js/slick.min.js"></script>
    <!-- One Page, Animated-HeadLin -->
    <script src="./resources/js/wow.min.js"></script>
    <script src="./resources/js/animated.headline.js"></script>
    <script src="./resources/js/jquery.magnific-popup.js"></script>

    <!-- Date Picker -->
    <script src="./resources/js/gijgo.min.js"></script>
    <!-- Nice-select, sticky -->
    <script src="./resources/js/jquery.nice-select.min.js"></script>
    <script src="./resources/js/jquery.sticky.js"></script>
    <!-- Progress -->
    <script src="./resources/js/jquery.barfiller.js"></script>
    
    <!-- counter , waypoint,Hover Direction -->
    <script src="./resources/js/jquery.counterup.min.js"></script>
    <script src="./resources/js/waypoints.min.js"></script>
    <script src="./resources/js/jquery.countdown.min.js"></script>
    <script src="./resources/js/hover-direction-snake.min.js"></script>

    <!-- contact js -->
    <script src="./resources/js/contact.js"></script>
    <script src="./resources/js/jquery.form.js"></script>
    <script src="./resources/js/jquery.validate.min.js"></script>
    <script src="./resources/js/mail-script.js"></script>
    <script src="./resources/js/jquery.ajaxchimp.min.js"></script>
    
    <!-- Jquery Plugins, main Jquery -->	
    <script src="./resources/js/plugins.js"></script>
    <script src="./resources/js/main.js"></script>
</body>
</html>