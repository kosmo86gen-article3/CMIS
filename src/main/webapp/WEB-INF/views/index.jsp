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
							<h1 class="mb-4">위치 기반으로 주변 매장 MAP정보를 쉽게 제공합니다.</h1>
							<p class="caps" style="color: gray; margin: 10px">주변 5km이내
								매장을 기본적으로 표시하며 간단한 검색으로 매장별 검색이 가능합니다.
							<p class="caps" style="color: gray; margin: 10px">해당 매장 클릭시
								평균가 이하 상품이 있을시 데이터 목록을 제공합니다.</p>
							<div class="col-sm-7" style="margin: 10px; padding: 0">
								<a href="map.do" id="mapdo" class="btn">내 주변 매장 검색!</a>
							</div>
						</div>
					</div>
					<div class="col-md-5">
						<img src="resources/img/index/map2.png" class="img-thumbnail"
							style="width: -webkit-fill-available; height: -webkit-fill-available; border: none">
					</div>
				</div>
			</div>
		</div>
		<!-- E: 2.메인 소개 -->

		<hr />
		<br /> <br />

		<!-- S: 3.메인 소개 -->
		<div class="container">
			<div class="row">
				<div class="row featurette">
					<div class="col-md-7 order-md-2">
						<div class="main2_text">
							<h1 class="mb-4">원하는 상품을 확인하고 소비 효율을 극대화 시켜줄 데이터도 챙겨가세요!</h1>
							<p class="caps" style="color: gray; margin: 10px">ML을 통한 가격예측
								데이터부터 업태별,주간별 통계를 확인 가능합니다.</p>
							<p class="caps" style="color: gray; margin: 10px">해당 상품의 실시간
								뉴스 확인과 매장 확인이 가능합니다.</p>
							<div class="d-flex flex-row-reverse bd-highlight">
								<div class="p-2 bd-highlight">
									<div class="col-sm-7" style="margin: 10px; padding: 0">
										<a href="productList.do" class="btn">상품 탐색!</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-5 order-md-1">
						<img src="resources/img/index/sale1.png" class="img-thumbnail"
							style="width: -webkit-fill-available; height: -webkit-fill-available; border: none">
					</div>
				</div>
			</div>
		</div>
		<!-- E: 3.메인 소개 -->

		<!-- S: 4:다양한 접근성 소개 -->

		<div class="container-fluid"
			style="padding: initial; background-color: black;">
			<div class="popular-location border-bottom section-padding40">
			<div class="container">
				<div class="row">
					<div class="col-sm-12">
						<div class="d-flex justify-content-center">
							<h1 class="display-1" style="text-align: center; margin-bottom: 65px; color:white">다양한 접근성</h1>
						</div>
					</div>
				</div>
				<div class="row">
					 <div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="single-location mb-30">
                            <div class="location-img">
                                <img src="resources/img/index/man.png" alt="">
                            </div>
                            <div class="location-details">
                                <p>실시간 채팅</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="single-location mb-30">
                            <div class="location-img">
                                <img src="resources/img/index/wishlist.png" alt="">
                            </div>
                            <div class="location-details">
                                <p style="color:black">찜 목록</p>
                                
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="single-location mb-30">
                            <div class="location-img">
                                <img src="resources/img/index/comparison.png" alt="">
                            </div>
                            <div class="location-details">
                                <p>상품 견적 비교</p>
                            </div>
                        </div>
                    </div>
				</div>
			</div>
		</div>
	</div>

		<!-- E 4:다양한 접근성 소개 -->

		<!-- S 5:사이트 가치 소개 -->
		
		<div class="our-services  border-bottom" style="margin:20px">
			<div class="container">
				<div class="row">
					<div class=" col-lg-3 col-md-3 col-sm-3">
						<div class="single-services mb-30">
							<div class="services-ion">
								<span>01</span>
							</div>
							<div class="services-cap">
								<h5>
									<a href="#">한국 소비자원 데이터</a>
								</h5>
								<p>한국 소비자원 1년치 데이터를 DB로 활용하여 소비자에게 제공 해 드립니다.</p>
							</div>
						</div>
					</div>
					<div class=" col-lg-3 col-md-3 col-sm-3">
						<div class="single-services mb-30">
							<div class="services-ion">
								<span>02</span>
							</div>
							<div class="services-cap">
								<h5>
									<a href="#">machine learning</a>
								</h5>
								<p>머신러닝을 적용해 학습된 이미지 결과값을 제공합니다. 또한
								가격 예측을 그래프로 표시합니다.</p>
							</div>
						</div>
					</div>
					<div class=" col-lg-3 col-md-3 col-sm-3">
						<div class="single-services mb-30">
							<div class="services-ion">
								<span>03</span>
							</div>
							<div class="services-cap">
								<h5>
									<a href="#">실시간 뉴스</a>
								</h5>
								<p>상품 상세 페이지에서 해당 상품의 실시간 뉴스기사를 제공합니다.</p>
							</div>
						</div>
					</div>
					<div class=" col-lg-3 col-md-3 col-sm-3">
						<div class="single-services mb-30">
							<div class="services-ion">
								<span>04</span>
							</div>
							<div class="services-cap">
								<h5>
									<a href="#">이미지 검색이 가능합니다!</a>
								</h5>
								<p>원하는 상품의 사진을 업로드 하여 상품을 검색해보세요!</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!--E: 5.사이트 가치 소개 끝  -->
		
		<!--S: 6.Q/A 연결 시작 -->
		<div class="container">
			<div class="position-relative overflow-hidden p-3 p-md-5 m-md-3 text-center bg-light">
  <div class="col-md-5 p-lg-5 mx-auto my-5">
    <h1 class="display-4 font-weight-normal">궁금한 사항이 있으신가요 ? </h1>
    <p class="lead font-weight-normal">저희 FAQ를 확인하시고 방명록도 남겨주세요 :)</p>
    <a class="btn btn-outline-secondary" href="qnaBoard.do">방명록 남기러 가기</a>
  </div>
  <div class="product-device shadow-sm d-none d-md-block"></div>
  <div class="product-device product-device-2 shadow-sm d-none d-md-block"></div>
</div>
			</div>
		
		<!--E: 6.Q/A 연결 시작 -->
		
		
		
</div>
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
	
	</div>
	<!-- E: Index(Home).jsp 의 div 총괄 끝  -->
</body>
</html>