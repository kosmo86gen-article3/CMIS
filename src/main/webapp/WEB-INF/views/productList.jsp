<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>물품 리스트</title>
</head>
<body>
<div class="loaderbase">
	<div class="loader"></div>
	<div class="loaderText"><h1 style="color: white;">상품 데이터를 분석중입니다</h4>
	
	</div>
</div>
	<div id="root">
		<!-- S: Index(Home).jsp 의 div 총괄 시작 -->
		<!-- S: 헤더 부분 시작 -->
		<header id="header">
			<div id="header_box">
				<jsp:include page="/WEB-INF/views/include/header.jsp" />
				<script src="./resources/js/productList.js"></script>
			</div>
		</header>
		<!-- E: 헤더 부분 끝 -->


		<!-- S: 본문 영역 시작 -->
		<section id="container">
			<div id="container_box">
				<main>
					<!--? Hero Area Start-->
					<div class="slider-area hero-bg2 hero-overly">
						<div
							class="single-slider hero-overly  slider-height2 d-flex align-items-center">
							<div class="container">
								<div class="row justify-content-center">
									<div class="col-xl-10 col-lg-10">
										<!-- Hero Caption -->
										<div class="hero__caption hero__caption2 pt-200">
											<h1>원하는 상품을 검색하세요</h1>
										</div>
										<!--Hero form -->
										<form name="form1" method="get" action="productList.do"
											class="search-box mb-100">
											<div class="input-form">
												<input name="keyword" value="${map.keyword }"
													placeholder="What are you finding?">
											</div>
											<div class="select-form">
												<div class="select-itms">
													<select name="select" id="select1">
														<option value="title"
															<c:if test="${map.search_option == 'title'}">selected</c:if>>상품명</option>
														<option value="">내용</option>
													</select>
												</div>
											</div>
											<div class="search-form">
												<input type="submit" value="search">
												<!-- 모달 버튼 -->
												<a href='#' id='imageSearch'><i class="ti-camera"></i>
													이미지 검색</a>
												<c:if test="${sessionScope.userId != null }">
													<input type="hidden" value="${sessionScope.userId}"
														id="memberName" />
												</c:if>

												<!--  <a href="#"><i class="ti-search"></i>Search</a> -->
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 모달 영역 -->
					<div class="modal fade" id="imageSearchModal" tabindex="-1"
						role="dialog" aria-labelledby="exampleModalLabel"
						aria-hidden="true" style="z-index: 1050;">
						<div class="modal-dialog" role="document">
							<div class="modal-content">

								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">이미지 검색</h5>
									<button class="close" type="button" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">X</span>
									</button>
								</div>
								<div class="modal-body">검색할 이미지를 첨부해주세요</div>
								<div class="modal-footer" style="justify-content: center;">

									<form id="imageSearchForm" action="imageSearch.do"
										method="post" enctype="multipart/form-data">
										<table style="width: 100%; box-sizing: border-box;">
											<tbody>
												<tr>
													<td id="okTable"><input type="file" id="imageUpload"
														name="imageUpload" style="width: 100%;" /></td>
													<td id="resetTable"><a class="btn" id="modalSubmit"
														href="#">이미지 업로드</a></td>
												</tr>
											</tbody>
										</table>
									</form>


								</div>

							</div>
						</div>
					</div>


					<!-- listing Area Start -->
					
					<div class="listing-area pt-120 pb-120">
						<div class="container">
							<div class="row">
								<!--? Left content -->
								<div class="col-xl-4 col-lg-4 col-md-6">
									<div class="row">
										<div class="col-12">
											<div class="small-section-tittle2 mb-45">
												<h4>Advanced Filter</h4>
											</div>
										</div>
									</div>
									<!-- Job Category Listing start -->
									<div class="category-listing mb-50">
										<!-- single one -->
										<div class="single-listing">
											<!-- Select City items start -->
											<div class="select-job-items2">
												<select name="select2">
													<option value="">City</option>
													<option value="">Dhaka</option>
													<option value="">india</option>
													<option value="">UK</option>
													<option value="">US</option>
													<option value="">Pakistan</option>
												</select>
											</div>
											<!--  Select City items End-->
											<!-- Select State items start -->
											<div class="select-job-items2">
												<select name="select2">
													<option value="">State</option>
													<option value="">Dhaka</option>
													<option value="">Mirpur</option>
													<option value="">Danmondi</option>
													<option value="">Rampura</option>
													<option value="">Htizill</option>
												</select>
											</div>
											<!--  Select State items End-->
											<!-- Select km items start -->
											<div class="select-job-items2">
												<select name="select2">
													<option value="">Near 1 km</option>
													<option value="">2 km</option>
													<option value="">3 km</option>
													<option value="">4 km</option>
													<option value="">5 km</option>
													<option value="">6 km</option>
												</select>
											</div>
											<!--  Select km items End-->
											<!-- select-Categories start -->
											<div class="select-Categories pt-80 pb-30">
												<div class="small-section-tittle2 mb-20">
													<h4>Price range</h4>
												</div>
												<label class="container">$50 - $150 <input
													type="checkbox"> <span class="checkmark"></span>
												</label> <label class="container">$150 - $300 <input
													type="checkbox" checked="checked active"> <span
													class="checkmark"></span>
												</label> <label class="container">$300 - $500 <input
													type="checkbox"> <span class="checkmark"></span>
												</label> <label class="container">$500 - $1000 <input
													type="checkbox"> <span class="checkmark"></span>
												</label> <label class="container">$1000 - Above <input
													type="checkbox"> <span class="checkmark"></span>
												</label>
											</div>
											<!-- select-Categories End -->
											<!-- select-Categories start -->
											<div class="select-Categories">
												<div class="small-section-tittle2 mb-20">
													<h4>Tags</h4>
												</div>
												<label class="container">Wireless Internet <input
													type="checkbox"> <span class="checkmark"></span>
												</label> <label class="container">Accepts Credit Cards <input
													type="checkbox" checked="checked active"> <span
													class="checkmark"></span>
												</label> <label class="container">Smoking Allowed <input
													type="checkbox"> <span class="checkmark"></span>
												</label> <label class="container">Parking Street <input
													type="checkbox"> <span class="checkmark"></span>
												</label> <label class="container">Coupons <input
													type="checkbox"> <span class="checkmark"></span>
												</label>
											</div>
											<!-- select-Categories End -->
										</div>
									</div>
									<!-- Job Category Listing End -->
								</div>
								<!--?  Right content -->
								<div class="col-xl-8 col-lg-8 col-md-6">
									<div class="row">
										<div class="col-lg-12">

											<div class="count mb-35">
												<span>${pageMap.maxNum }개의 상품목록이 존재합니다.</span>
											</div>

										</div>
									</div>
									<!--? Popular Directory Start -->

									<div class="popular-directorya-area fix">
										<div class="row">

											<c:forEach items="${productList}" var="proList"
												begin="${pageMap.min }" end="${pageMap.max }">

												<div class="col-lg-6">
													<!-- Single -->
													<div class="properties properties2 mb-30">
														<div class="properties__card">
															<div class="properties__img overlay1">
																<a
																	href="productdetails.do?product_code=${proList.product_code}"><img
																	src="resources/img/images/${proList.product_code }.jpg"
																	alt=""></a>
																<div class="img-text">
																	<!-- <span>$$$</span>
                                                <span>Closed</span> -->
																</div>
																<div class="icon">
																	<!-- <img src="resources/img/gallery/categori_icon1.png" alt=""> -->
																</div>
															</div>
															<div class="properties__caption">
																<h3>
																	<a
																		href="productdetails.do?product_code=${proList.product_code}">${proList.product_name}</a>
																</h3>
																<p>${proList.product_detail }</p>
															</div>
															<div
																class="properties__footer d-flex justify-content-between align-items-center">
																<div class="restaurant-name">

																	<!-- <img src="resources/img/images/${proList.product_code }.jpg" alt=""> -->

																	<h3>평균가 : ${proList.product_last_average_price }원</h3>
																</div>
																<div class="heart">
																	<img src="resources/img/gallery/heart1.png" alt="">
																</div>
															</div>
														</div>
													</div>
												</div>

											</c:forEach>

										</div>
									</div>
									<!--? Popular Directory End -->
									<!--Pagination Start  -->
									<div class="pagination-area text-center">
										<div class="container">
											<div class="row">
												<div class="col-xl-12">
													<div class="single-wrap d-flex justify-content-center">
														<nav aria-label="Page navigation example">
															<ul class="pagination justify-content-start " id="myDIV">

																<c:if test="${pageMap.minPage ne 1 }">
																	<!-- pageMap의 minpage가 1이 아닐때  -->
																	<li class="page-item"><a class="page-link"
																		href="productList.do?page=${pageMap.currentPage-5} ">
																			<span class="ti-angle-left"></span>
																	</a></li>
																</c:if>

																<c:forEach var="i" begin="${pageMap.minPage }"
																	end="${pageMap.maxPage }">

																	<c:if test="${pageMap.currentPage eq i }">
																		<li class="page-item active"><a class="page-link"
																			href="#">${i}</a></li>
																	</c:if>

																	<c:if test="${pageMap.currentPage ne i }">
																		<li class="page-item"><a class="page-link"
																			href="productList.do?page=${i}">${i}</a></li>
																	</c:if>

																</c:forEach>

																<c:if test="${pageMap.maxPage ne pageMap.totPage }">
																	<li class="page-item"><a class="page-link"
																		href="productList.do?page=${pageMap.currentPage+5}"><span
																			class="ti-angle-right"></span></a></li>
																</c:if>
															</ul>
														</nav>
													</div>
												</div>
											</div>
										</div>
									</div>
									<!--Pagination End  -->
								</div>
							</div>
						</div>
					</div>
					<!-- listing-area Area End -->

					<!--? Want To work 02-->
					<section class="wantToWork-area">
						<div class="container">
							<div class="wants-wrapper w-padding2">
								<div class="row justify-content-between">
									<div class="col-xl-8 col-lg-8 col-md-7">
										<div class="wantToWork-caption wantToWork-caption2">
											<img src="resources/img/logo/logo2_footer.png" alt=""
												class="mb-20">
											<p>Users and submit their own items. You can create
												different packages and by connecting with your PayPal or
												Stripe account charge users for registration to your
												directory portal.</p>
										</div>
									</div>
									<div class="col-xl-4 col-lg-4 col-md-5">
										<div class="footer-social f-right sm-left">
											<a href="#"><i class="fab fa-twitter"></i></a> <a
												href="https://bit.ly/sai4ull"><i
												class="fab fa-facebook-f"></i></a> <a href="#"><i
												class="fab fa-pinterest-p"></i></a> <a href="#"><i
												class="fab fa-instagram"></i></a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</section>
					<!-- Want To work End -->
					<!--? Want To work 01-->
					<section class="wantToWork-area">
						<div class="container">
							<div class="wants-wrapper">
								<div class="row align-items-center justify-content-between">
									<div class="col-xl-7 col-lg-9 col-md-8">
										<div class="wantToWork-caption wantToWork-caption2">
											<div class="main-menu2">
												<nav>
													<ul>
														<li><a href="index.html">Home</a></li>
														<li><a href="explore.html">Explore</a></li>
														<li><a href="pages.html">Pages</a></li>
														<li><a href="blog.html">Blog</a></li>
														<li><a href="contact.html">Contact</a></li>
													</ul>
												</nav>
											</div>
										</div>
									</div>
									<div class="col-xl-2 col-lg-3 col-md-4">
										<a href="#" class="btn f-right sm-left">Add Listing</a>
									</div>
								</div>
							</div>
						</div>
					</section>
					<!-- Want To work End -->
				</main>
			</div>
		</section>
		<!-- E: 본문 영역 끝 -->


		<!-- S: 푸터 영역 시작 -->
		<footer id="footer">
			<div id="footer_box">
				<jsp:include page="/WEB-INF/views/include/footer.jsp" />
			</div>
		</footer>
	</div>
	<!-- E: Index(Home).jsp 의 div 총괄 끝  -->
</body>
</html>