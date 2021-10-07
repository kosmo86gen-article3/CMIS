<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<link rel="shortcut icon" href="resources/img/favicon.png"
	type="image/png">
<link rel="icon" href="resources/img/favicon.png" type="image/png">
<title>상품 목록</title>
</head>

<body>
	<div class="loaderbase">
		<div class="loader"></div>
		<div class="loaderText">
			<h1 style="color: white;">상품 데이터를 분석중입니다</h1>

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
		<div
			class="position-relative overflow-hidden p-3 p-md-5 m-md-3 text-center bg-light"
			style="margin-bottom: 0px !important; height: 220px; background: #494343 !important">
			<div class="col-md-5 p-lg-5 mx-auto my-5">
				<h1 class="display-4 font-weight-normal" style="color: white">상품 목록</h1>
				<p class="lead font-weight-normal" style="color: white">다양한 상품의 정보를 확인해보세요</p>
			</div>
			<div class="product-device shadow-sm d-none d-md-block"></div>
			<div
				class="product-device product-device-2 shadow-sm d-none d-md-block"></div>
		</div>


		<!-- S: 본문 영역 시작 -->
		<section id="container">
			<div id="container_box">
				<main>
					<!--? Hero Area Start-->
					<%-- <div class="slider-area hero-bg2 hero-overly">
						<div
							class="single-slider hero-overly  slider-height2 d-flex align-items-center">
							<div class="container" style="max-height: 200px;">
								<div class="row justify-content-center">
									<div class="col-xl-10 col-lg-10">
										<!-- Hero Caption -->
										<div class="hero__caption hero__caption2">
											<h1>원하는 상품을 검색하세요</h1>
										</div>
										<!--Hero form -->
										<form name="form1" method="get" id="productSearchForm"
											action="productList.do" class="search-box mb-100">
											<div class="input-form" style="width: 50%;">
												<input name="keyword" value="${map.keyword }"
													placeholder="검색할 상품명을 입력해주세요">
											</div>
											<div class="search-form">
												<a href='#' id='productSearch'><i class="ti-search"></i>
													상품 검색</a>
											</div>
											<div class="search-form">

												<!-- 모달 버튼 -->
												<a href='#' id='imageSearch'><i class="ti-camera"></i>
													이미지 검색</a>
												<c:if test="${sessionScope.userId != null }">
													<input type="hidden" value="${sessionScope.userId}"
														id="memberName" />
												</c:if>


											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div> --%>
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
								<div class="modal-body" style="color: #ff8d1e;">검색할 이미지를
									첨부해주세요</div>
								<div class="modal-footer"
									style="justify-content: center; color: #ff8d1e;">

									<form id="imageSearchForm" action="imageSearch.do"
										method="post" enctype="multipart/form-data">
										<table style="width: 100%; box-sizing: border-box;">
											<tbody>
												<tr>
													<td id="okTable"><input type="file" id="imageUpload"
														name="imageUpload" style="width: 100%;" /></td>
													<td id="compareTable"
														style="padding-left: 10px; padding-right: 10px;"></td>
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
								<div class="col-xl-4 col-lg-4 col-md-6">
									<div class="row">
										<div class="col-12">
											<div class="small-section-tittle2 mb-45"></div>
										</div>
									</div>
									<!-- Job Category Listing start -->
									<div class="category-listing mb-50">
										<!-- single one -->
										<div class="single-listing">
											<form name="form1" method="get" id="productSearchForm"
												action="productList.do" class="search-box mb-100">
												<div class="input-form">
													<input name="keyword" value="${map.keyword }"
														placeholder="상품명 입력">
												</div>
												<div class="search-form"
													style="margin-bottom: 20px; text-align: center">
													<a href='#' id='productSearch'
														class="genric-btn orange radius"><i class="ti-search"></i>
														상품 검색</a>
												</div>
												<div class="search-form" style="text-align: center;">

													<!-- 모달 버튼 -->
													<a href='#' id='imageSearch'
														class="genric-btn orange radius"><i class="ti-camera"></i>
														이미지 검색</a>
													<c:if test="${sessionScope.userId != null }">
														<input type="hidden" value="${sessionScope.userId}"
															id="memberName" />
													</c:if>


												</div>
											</form>

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

												<div class="col-lg-3">
													<!-- Single -->
													<div class="properties properties2 mb-30">
														<div class="properties__card">
															<div class="properties__img overlay1"
																style="height: 120px; line-height: 120px; text-align: center;">
																<a
																	href="productdetails.do?product_code=${proList.product_code}"><img
																	src="resources/img/images/${proList.product_code }.jpg"
																	alt=""
																	style="vertical-align: middle; max-width: 280px; max-height: 280px; margin-bottom: 20px;"></a>
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
																<c:if test="${proList.product_detail == null}">
																	<p>&nbsp;</p>
																</c:if>
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
<style type="text/css">
.overlay1::before {
	background-color: white;
}
</style>
</html>