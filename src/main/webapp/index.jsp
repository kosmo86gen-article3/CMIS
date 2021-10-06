<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>CMIS</title>
<!-- only index page style -->
<link rel="stylesheet" href="resources/css/indexstyle.css">
</head>
<body>
	<div id="root">
		<!-- S: Index(Home).jsp 의 div 총괄 시작 -->
		<!-- S: 헤더 부분 시작 -->
		<header id="header">
			<div id="header_box">
				<jsp:include page="/WEB-INF/views/include/header.jsp" />
			</div>
		</header>
		<!-- E: 헤더 부분 끝 -->


		<!-- S: 본문 영역 시작 -->
		<section class="index_main">
			<div class="container-fluid" style="padding: initial;">
				<!-- S: 1.메인 소개 -->
				<div class="hero-wrap js-fullheight"
					style="background-image: url(resources/img/index/blackorange.jpg); height: 722px;">
					<div class="overlay"></div>
					<div class="container">
						<div
							class="row no-gutters slider-text js-fullheight align-items-center"
							data-scrollax-parent="true" style="height: 722px;">
							<div class="col-md-7 ftco-animate fadeInUp ftco-animated">
								<span class="subheading">Welcome to CMIS</span>
								<h1 class="mb-4">최저가 매장을 확인하고 상품별 데이터도 챙겨가세요!</h1>
								<p class="caps">소비자를 위한 마트 플랫폼!</p>
							</div>
							<a href="#"
								class="icon-video popup-vimeo d-flex align-items-center justify-content-center mb-4">
								<span class="fa fa-play"></span>
							</a>
						</div>
					</div>
				</div>
			</div>
			<!-- E: 1.메인 소개 -->
			<hr />
			<h1 class="display-1" style="text-align: center; margin: 15px;">Introduce</h1>
			<!-- S: 2.메인 소개 -->
			<div class="container">
				<div class="row">
				
					<div class="row featurette">
						<div class="col-md-7 ftco-animate fadeInUp ftco-animated">
							<div class="main2_text">
								<span class="subheading">Welcome to CMIS</span>
								<h1 class="mb-4">최저가 매장을 확인하고 상품별 데이터도 챙겨가세요!</h1>
								<p class="caps">소비자를 위한 마트 플랫폼!</p>
								<a href="#" class="btn" style="text-align:left">
								최저가 매장 바로 찾기</a>
							</div>
						</div>
						<div class="col-md-5">
							<img src="resources/img/index/map2.png" class="img-thumbnail" 
							style="width:-webkit-fill-available; height:-webkit-fill-available; border:none">
						</div>
					</div>
				</div>
			</div>
			<!-- E: 2.메인 소개 -->

			<hr />

			<!-- S: 3.메인 소개 -->
			<div class="container">
				<div class="row">
					<div class="row featurette">
						<div class="col-md-7 order-md-2">
							<div class="main2_text">
								<span class="subheading">Welcome to CMIS</span>
								<h1 class="mb-4">최저가 매장을 확인하고 상품별 데이터도 챙겨가세요!</h1>
								<p class="caps">소비자를 위한 마트 플랫폼!</p>
								<a href="#" class="btn" style="text-align:right">
								최저가 매장 바로 찾기</a>
							</div>
						</div>
						<div class="col-md-5 order-md-1">
							<img src="resources/img/index/sale1.png" class="img-thumbnail" 
							style="width:-webkit-fill-available; height:-webkit-fill-available; border:none">
						</div>
					</div>
				</div>
			</div>
			<!-- E: 2.메인 소개 -->





			<div class="container">
				<div class="row">
					<div class="col-sm-6">
						<div class="services services-1 color-2 d-block img"
							style="background-image: url(images/services-2.jpg);">
							<div
								class="icon d-flex align-items-center justify-content-center">
								<span class="flaticon-route"></span>
							</div>
							<div class="media-body">
								<h3 class="heading mb-3">Travel Arrangements</h3>
								<p>A small river named Duden flows by their place and
									supplies it with the necessary</p>
							</div>
						</div>
					</div>
					<div class="col-sm-6">col-sm-8</div>
				</div>
			</div>
			<div class="row">
				<div class="col">1 of 3</div>
				<div class="col-6">2 of 3 (wider)</div>
				<div class="col">3 of 3</div>
			</div>


			<div class="container">
				<div class="wants-wrapper w-padding2">
					<div class="row align-items-center justify-content-between">
						<div class="col-xl-7 col-lg-9 col-md-8">
							<div class="wantToWork-caption wantToWork-caption2">
								<h2>How it works</h2>
								<p>Let's uncover the best places to eat, drink, and shop
									nearest to you.</p>
							</div>
						</div>
						<div class="col-xl-2 col-lg-3 col-md-4">
							<a href="#" class="btn f-right sm-left">Explore Listing</a>
						</div>
					</div>
				</div>
			</div>

			<div class="our-services  border-bottom">
				<div class="container">
					<div class="row">
						<div class=" col-lg-4 col-md-6 col-sm-6">
							<div class="single-services mb-30">
								<div class="services-ion">
									<span>01</span>
								</div>
								<div class="services-cap">
									<h5>
										<a href="#">Find Businesses</a>
									</h5>
									<p>Discover & connect with great local businesses in your
										local neighborhood like dentists, hair stylists and more.</p>
								</div>
							</div>
						</div>
						<div class=" col-lg-4 col-md-6 col-sm-6">
							<div class="single-services mb-30">
								<div class="services-ion">
									<span>02</span>
								</div>
								<div class="services-cap">
									<h5>
										<a href="#">Review Listings</a>
									</h5>
									<p>Discover & connect with great local businesses in your
										local neighborhood like dentists, hair stylists and more.</p>
								</div>
							</div>
						</div>
						<div class=" col-lg-4 col-md-6 col-sm-6">
							<div class="single-services mb-30">
								<div class="services-ion">
									<span>03</span>
								</div>
								<div class="services-cap">
									<h5>
										<a href="#">Make a Reservation</a>
									</h5>
									<p>Discover & connect with great local businesses in your
										local neighborhood like dentists, hair stylists and more.</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
	</div>
	</section>

	<!-- E: 본문 영역 끝 -->


	<!-- S: 푸터 영역 시작 -->
	<footer id="footer">
		<div id="footer_box">
			<jsp:include page="/WEB-INF/views/include/footer.jsp" />

		</div>
	</footer>
	<script type="module">
  // Import the functions you need from the SDKs you need
  import { initializeApp } from "https://www.gstatic.com/firebasejs/9.0.2/firebase-app.js";
  import { getAnalytics } from "https://www.gstatic.com/firebasejs/9.0.2/firebase-analytics.js";
  // TODO: Add SDKs for Firebase products that you want to use
  // https://firebase.google.com/docs/web/setup#available-libraries

  // Your web app's Firebase configuration
  // For Firebase JS SDK v7.20.0 and later, measurementId is optional
  const firebaseConfig = {
    apiKey: "AIzaSyDzY2mBhNbIggaoDccNblTUQodHLRWVOUE",
    authDomain: "cmis-430ec.firebaseapp.com",
    projectId: "cmis-430ec",
    storageBucket: "cmis-430ec.appspot.com",
    messagingSenderId: "636226969812",
    appId: "1:636226969812:web:608e8311e0ff2754781b41",
    measurementId: "G-BFS844XTQ1"
  };

  // Initialize Firebase
  const app = initializeApp(firebaseConfig);
  const analytics = getAnalytics(app);
</script>
	;
	</div>
	<!-- E: Index(Home).jsp 의 div 총괄 끝  -->
</body>
</html>