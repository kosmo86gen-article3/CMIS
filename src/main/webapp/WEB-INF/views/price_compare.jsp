<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>상품 가격 비교</title>
</head>
<body>
	<div id="root">
		<!-- S: Index(Home).jsp 의 div 총괄 시작 -->
		<!-- S: 헤더 부분 시작 -->
		<header id="header">
			<div id="header_box">
				<jsp:include page="/WEB-INF/views/include/header.jsp" />
				<script src="./resources/js/price_compare.js"></script>

			</div>
		</header>
		<style type="text/css">
::-webkit-scrollbar {
	width: 5.2px;
} /* 스크롤 바 */
::-webkit-scrollbar-thumb {
	background: #303030;
} /* 실질적 스크롤 바 */
::-webkit-scrollbar-thumb:hover {
	background: #404040;
} /* 실질적 스크롤 바 위에 마우스를 올려다 둘 때 */
::-webkit-scrollbar-thumb:active {
	background: #808080;
} /* 실질적 스크롤 바를 클릭할 때 */
::-webkit-scrollbar-button {
	display: none;
} /* 스크롤 바 상 하단 버튼 */
table > tbody > tr{
height: 75px;
}
</style>
		<!-- E: 헤더 부분 끝 -->


		<!-- S: 본문 영역 시작 -->
		<section id="container">
			<div id="container_box">
				<main>
					<!--? Hero Area Start-->
					<div class="slider-area hero-bg2 hero-overly">
						<div
							class="single-slider hero-overly  slider-height2 d-flex align-items-center"
							style="min-height: 200px;">
							<div class="container">
								<div class="row justify-content-center">
									<div class="col-xl-10 col-lg-10">
										<!-- Hero Caption -->
										<div class="hero__caption hero__caption2 pt-200">
											<h1>견적 비교할 상품을 검색하세요</h1>
										</div>
										<!--Hero form -->
										<form onsubmit="return false" name="form1" method="get"
											action="priceList.do" class="search-box mb-100">
											<input type="hidden" name="lat" id="lat" value=""> <input
												type="hidden" name="lon" id="lon" value="">
											<div class="input-form" style="width: 50%%;">
												<input name="keyword" id="product_name" placeholder="검색할 상품명을 입력해주세요">
											</div>
											<div class="search-form">
												<!-- 모달 버튼 -->
												<a href='#' id='productSearch'><i class="ti-search"></i>상품 검색</a>
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
					</div>

					<!-- 모달 영역 -->
					<div class="modal fade" id="productSearchModal" tabindex="-1"
						role="dialog" aria-labelledby="exampleModalLabel"
						aria-hidden="true" style="z-index: 1050;">
						<div class="modal-dialog" role="document">
							<div class="modal-content">

								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">검색 결과</h5>
									<button class="close" type="button" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">X</span>
									</button>
								</div>
								<div class="modal-body"
									style="max-height: 500px; overflow: auto;"></div>
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
														<td id="compareTable" style="padding-left: 10px;padding-right: 10px;"></td>
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


					<!--? Start Align Area -->
					<div class="whole-wrap">
						<div class="container box_1170">

							<div class="section-top-border">
								<h3 class="mb-30">최저가 비교 결과</h3>
								<div class="progress-table">
									<table style="width: 100%; text-align: center;">
									<c:if test="${empty compareList && not empty productList}">
									<h3 class="text-heading">담은 상품을 전부 판매하는 매장이 없습니다</h3>
									<a href='#' class="genric-btn orange radius" onclick='removeAllProductCompare();'>목록 비우기</a>
									</c:if>
									<c:if test="${empty compareList }">
									<h3 class="text-heading">비교할 상품을 담아주세요</h3>
									</c:if>
									<c:if test="${not empty compareList }">
										<tr>
											<th bgcolor="#f15d30">상품 정보/수량</th>
											<c:forEach items="${storeList}" var="store">
											<th style= "background-color:#f36f46; color:white; border:1px solid; border-top:none;">${store }</th>
											</c:forEach>
											<th bgcolor="#f15d30">삭제</th>
										</tr>
										
										<c:forEach items="${productList}" var="proList">
										<tr>
											<th style="background-color:#f36f46; color:white">${proList }</th>
											<c:set var="i" value="1"/>
											<c:forEach items="${compareList }" var="comList">
											
											<c:forEach items="${comList }" var="com" varStatus="status">
											<c:if test="${com.product_name == proList }">
											<td style="border:1px solid; border-top:none; border-bottom:none" class="store${i }">${com.sale_price }</td>
											</c:if>
											
											</c:forEach>
											<c:set var="i" value="${i+1}"/>
											</c:forEach>
											<td><a href='#' class="genric-btn orange radius" onclick='removeProductCompare(&#39${proList}&#39);'>삭제</a></td>
										</tr>
										</c:forEach>
										<tr>
											<th bgcolor="#f15d30">합계</th>
											<c:forEach items="${storeList}" var="store">
											<td style="border:1px solid; border-top:double; border-bottom:none" class="sum"></td>
											</c:forEach>
											<td style="border:1px solid; border-top:double; border-bottom:none; border-right:none"><a href='#' class="genric-btn orange radius" onclick='removeAllProductCompare();'>전체 삭제</a></td>
										</tr>
										</c:if>
									</table>
									
								</div>

									<div>
									 <h1> 나열된 매장은 회원님의 위치 기반 근거리 순서 입니다.</h1>
									</div>
								
							</div>
						</div>

						<!-- End Align Area -->
						<!--? Popular Directory End -->

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
</html>
