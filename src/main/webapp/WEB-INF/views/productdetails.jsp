<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<link rel="shortcut icon" href="resources/img/favicon.png" type="image/png">
<link rel="icon" href="resources/img/favicon.png" type="image/png">
<title>${productDetail.product_name }</title>
</head>
<body>
	<div class="loaderbase">
		<div class="loader"></div>
		<div class="loaderText">
			<h1 style="color: white;">
				상품 데이터를 분석중입니다
				</h4>
		</div>
	</div>
	<div id="root">
		<!-- S: Index(Home).jsp 의 div 총괄 시작 -->
		<!-- S: 헤더 부분 시작 -->
		<header id="header">
			<div id="header_box">
				<jsp:include page="/WEB-INF/views/include/header.jsp" />
				<link rel="stylesheet"
					href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />
				<link rel="stylesheet" href="resources/css/slider.css">
				<link rel="stylesheet"
					href="resources/css/material-design-iconic-font.min.css">
				<script type="text/javascript"
					src="https://www.gstatic.com/charts/loader.js"></script>
				<script src="./resources/js/productDetail.js"></script>
				<script type="text/javascript">
				
				var colors = ['#007bff',	'#dc3545','#fd7e14','#28a745','#6f42c1','#e83e8c'];
				
      google.charts.load('current', {'packages':['line']});
      google.charts.setOnLoadCallback(drawChart);

      // 가격 예측 그래프
    function drawChart() {

      var data = new google.visualization.DataTable();
      data.addColumn('date');
      data.addColumn('number', '${productDetail.product_name }');
      data.addColumn('number','${productDetail.product_name }');

    	  <c:forEach items="${productPrices}" var="prices" varStatus="status">
    	  <c:if test="${!status.last}">
    	  data.addRow([new Date(${prices.researchDate}),${prices.salePrice},null]);
    	   </c:if>
    	   <c:if test="${status.last}">
    		 data.addRow([new Date(${prices.researchDate}),${prices.salePrice},${prices.salePrice}]);
    		</c:if>
    	</c:forEach>
    	data.addRow([new Date(2021,08,03),null,${productFuturePrices[0] }]);
    	data.addRow([new Date(2021,08,10),null,${productFuturePrices[1] }]);
    	data.addRow([new Date(2021,08,17),null,${productFuturePrices[2] }]);
    	data.addRow([new Date(2021,08,24),null,${productFuturePrices[3] }]);
    	data.addRow([new Date(2021,08,30),null,${productFuturePrices[4] }]);

      var options = {
    	title: '시세 변동 추이 및 예측',
    	titleTextStyle: {
            color : 'black',    // any HTML string color ('red', '#cc00cc')
            fontSize: 18, // 12, 18 whatever you want (don't specify px)
            bold: true    // true or false
        },
    	width:'100%',
    	vAxis: {
    		format: '#원',
    		minValue: 0
            /* viewWindow: {min: 0} */
        },
    	legend: {position: 'none'},
        animation: {"startup": true},
        hAxis: {
            format: 'M월 d일',
            ticks : [new Date(2020,08,01), new Date(2020,09,01), new Date(2020,10,01), new Date(2020,11,01), new Date(2021,00,01), new Date(2021,01,01), new Date(2021,02,01), new Date(2021,03,01), new Date(2021,04,01), new Date(2021,05,01), new Date(2021,06,01), new Date(2021,07,01), new Date(2021,08,01)],
            gridlines : {color: '#EEEEEE', count:13}
          }
      };

      var chart = new google.charts.Line(document.getElementById('chart'));

      chart.draw(data, google.charts.Line.convertOptions(options));
    }
    
    google.load("visualization", "1", {packages:["corechart"]});
    google.setOnLoadCallback(drawChart1);
    function drawChart1() {
      var data = google.visualization.arrayToDataTable([
        ['업태', '평균가',{ role: 'style' }],
        ['전체', <fmt:formatNumber type="number" pattern="0" value="${productDetail.product_last_average_price }"/>,colors[0]],
        <c:forEach items="${productStorePrice}" var="storePriceList" varStatus="status">
  	  		<c:if test="${!status.last}">
  	  			['${storePriceList.shopKindName}', <fmt:formatNumber type="number" pattern="0" value="${storePriceList.avgPrice }" />, colors[${status.count}]],
  	   		</c:if>
  	   <c:if test="${status.last}">
  	 			['${storePriceList.shopKindName}', <fmt:formatNumber type="number" pattern="0" value="${storePriceList.avgPrice }" />, colors[${status.count}]]
  		</c:if>
  	</c:forEach>
      ]);

      var options = {
        title: '업태별 판매가 평균',
        
        legend: {position: 'none'},
        is3D: true
        /* vAxis: {minValue: 0} */
     };

    var chart = new google.visualization.ColumnChart(document.getElementById('chart_div1'));
      chart.draw(data, options);
    }

    google.load("visualization", "1", {packages:["corechart"]});
    google.setOnLoadCallback(drawChart2);
    function drawChart2() {
      var data = google.visualization.arrayToDataTable([
    	['지역', '평균가',{ role: 'style' }],
        ['전체', <fmt:formatNumber type="number" pattern="0" value="${productDetail.product_last_average_price }"/>,colors[5]],
        <c:forEach items="${productLocationPrice}" var="locationPriceList" varStatus="status">
	  		<c:if test="${!status.last}">
	  			['${locationPriceList.locationName }', <fmt:formatNumber type="number" pattern="0" value="${locationPriceList.locationAvgPrice }" />, colors[${status.index}%6]],
	   		</c:if>
	   <c:if test="${status.last}">
	 			['${locationPriceList.locationName }', <fmt:formatNumber type="number" pattern="0" value="${locationPriceList.locationAvgPrice }" />, colors[${status.index}%6]]
		</c:if>
	</c:forEach>
      ]);

      var options = {
        title: '전국 판매가 평균',
        
        legend: {position: 'none'},
        colors:['#f15d30']
        /* vAxis: {minValue: 0} */
      };

      var chart = new google.visualization.BarChart(document.getElementById('chart_div2'));
      chart.draw(data, options);
    }

    
  </script>
			</div>
		</header>
		<!-- E: 헤더 부분 끝 -->
<div
			class="position-relative overflow-hidden p-3 p-md-5 m-md-3 text-center bg-light"
			style="margin-bottom: 0px !important; height: 220px; background: #494343 !important">
			<div class="col-md-5 p-lg-5 mx-auto my-5">
				<h1 class="display-4 font-weight-normal" style="color: white">상품 상세 정보</h1>
				<p class="lead font-weight-normal" style="color: white">최적의 가격 정보와 가격 예측값, 시각화 자료를 제공하며 그래프를 통해 추이를 확인 할 수 있습니다</p>
			</div>
			<div class="product-device shadow-sm d-none d-md-block"></div>
			<div
				class="product-device product-device-2 shadow-sm d-none d-md-block"></div>
		</div>

		<!-- S: 본문 영역 시작 -->

		<section id="container">
			<div id="container_box">
				<!--? Popular Locations Start 01-->
				<div class="popular-location border-bottom section-padding40"
					style="padding-bottom: 10px;border-bottom: 1px solid #f15d30!important;">
					<div class="container">
						<div class="row">
							<div class="col-lg-4"
								style="margin-left: auto; margin-right: auto;">
								<div class="feature-img"
									style="margin: 0px auto; text-align: center">
									<img
										src="resources/img/images/${productDetail.product_code }.jpg"
										style="width: 100%; height: 100%;border: 2px solid #f15d30;margin-bottom: 20px">
								</div>
								<div class="heart" style="text-align: center;">
									<span class="widget_title"
										style="color: #f15d30; margin-left: 10px; margin-right: 10px;">${productDetail.product_name }</span>
									<img src="resources/img/gallery/heart1.png" alt="">
								</div>
							</div>

							<div class="col-lg-8" style="text-align: center;">
								<div class="btn-group btn-group-toggle" data-toggle="buttons"
									style="padding-bottom: 10px;">
									<label class="btn btn-secondary active"> <input
										type="radio" name="options" id="option1" autocomplete="off"
										checked> 업태별 판매가
									</label> <label class="btn btn-secondary"> <input type="radio"
										name="options" id="option2" autocomplete="off"> 지역별
										판매가
									</label>
								</div>
								<table id="storePriceList"
									class="table table-hover table-striped">
									<thead>
										<tr>
											<th class="table-orange" scope="col" colspan="7"
												style="text-align: center">업태별 판매가 평균</th>
										</tr>
										<tr>
											<th scope="col">구분</th>
											<th scope="col">최저가격</th>
											<th scope="col">평균가격</th>
											<th scope="col">최대가격</th>
										</tr>
									</thead>
									<tbody class="text_center">
										<tr>
											<th scope="row">전체</th>
											<td><fmt:formatNumber type="number" pattern="0"
													value="${productDetail.product_last_min_price }" /></td>
											<td><fmt:formatNumber type="number" pattern="0"
													value="${productDetail.product_last_average_price }" /></td>
											<td><fmt:formatNumber type="number" pattern="0"
													value="${productDetail.product_last_max_price }" /></td>
										</tr>
										<c:forEach items="${productStorePrice}" var="storePriceList">
											<tr>
												<th scope="row">${storePriceList.shopKindName }</th>
												<td><fmt:formatNumber type="number" pattern="0"
														value="${storePriceList.minPrice }" /></td>
												<td><fmt:formatNumber type="number" pattern="0"
														value="${storePriceList.avgPrice }" /></td>
												<td><fmt:formatNumber type="number" pattern="0"
														value="${storePriceList.maxPrice }" /></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<table id="locationPriceList"
									class="table table-hover table-striped">
									<thead>
										<tr>
											<th class="table-orange" scope="col" colspan="4"
												style="text-align: center">전국 판매가 평균</th>
										</tr>
										<tr>
											<th scope="col">구분</th>
											<th scope="col">최저가격</th>
											<th scope="col">평균가격</th>
											<th scope="col">최대가격</th>
										</tr>
									</thead>
									<tbody class="text_center">
										<tr>
											<th scope="row">전체</th>
											<td><fmt:formatNumber type="number" pattern="0"
													value="${productDetail.product_last_min_price }" /></td>
											<td><fmt:formatNumber type="number" pattern="0"
													value="${productDetail.product_last_average_price }" /></td>
											<td><fmt:formatNumber type="number" pattern="0"
													value="${productDetail.product_last_max_price }" /></td>
										</tr>
										<c:forEach items="${productLocationPrice}"
											var="locationPriceList">
											<tr>
												<th scope="row">${locationPriceList.locationName }</th>
												<td><fmt:formatNumber type="number" pattern="0"
														value="${locationPriceList.locationMinPrice }" /></td>
												<td><fmt:formatNumber type="number" pattern="0"
														value="${locationPriceList.locationAvgPrice }" /></td>
												<td><fmt:formatNumber type="number" pattern="0"
														value="${locationPriceList.locationMaxPrice }" /></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<div class="col-lg-12">
								<div id="chart"
									style="width: 100%; min-height: 450px; padding: 20px; margin-bottom: 20px; margin-top: 20px;"></div>
							</div>
							<div class="col-md-6">
								<div id="chart_div1" class="chart"
									style="width: 100%; min-height: 450px;"></div>
							</div>
							<div class="col-md-6">
								<div id="chart_div2" class="chart"
									style="width: 100%; min-height: 450px;"></div>
							</div>
							<div class="col-lg-6">
								<div class="blog_right_sidebar">
									<aside class="single_sidebar_widget popular_post_widget" style="background: #fdece7 !important">
										<h1 class="widget_title" style="color: #f15d30;border-bottom: 1px solid #f15d30;">관련 상품</h1>

										<c:forEach items="${productCateList}" var="cateList">
											<div class="media post_item">
												<img
													src="resources/img/images/${cateList.product_code }.jpg"
													alt="post" style="max-width: 80px; max-height: 80px;">
												<div class="media-body">
													<a
														href="productdetails.do?product_code=${cateList.product_code }">
														<h3>${cateList.product_name }</h3>
													</a>
													<p>
														평균가격 :
														<fmt:formatNumber type="number" pattern="0"
															value="${cateList.product_last_average_price }" />
														원
													</p>
												</div>
											</div>
										</c:forEach>

									</aside>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="blog_right_sidebar" >
									<aside class="single_sidebar_widget popular_post_widget" style="background: #fdece7 !important">
										<h1 class="widget_title" style="color: #f15d30;border-bottom: 1px solid #f15d30;">관련 뉴스</h1>

										<c:forEach items="${productNewsList}" var="newsList">
											<ul class="list cat-list">
												<li><a href="${newsList.newsLink }" class="d-flex"
													target="_blank">
														<p>${newsList.newsTitle }</p>
												</a></li>
										</c:forEach>

									</aside>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Popular Locations End -->
		</section>
		<!-- E: 본문 영역 끝 -->
		<main>
			<div class="whole-wrap">
				<div class="container box_1170">
					<div class="section-top-border">
						<h1 class="mb-30" style="color:#f15d30">내 주변 할인 매장</h1>
						<div class="row">
							<c:forEach items="${lowestPriceStore}" var="lowestPriceStoreList">
							
								<div class="col-md-4" style="background: #fdece7 !important;border: 5px solid white;">
								<div class="blog_right_sidebar">
									<aside class="single_sidebar_widget popular_post_widget" style="background: #fdece7 !important">
									<div class="single-defination">
										<h2 class="mb-20"><a href="https://www.google.com/maps/search/${lowestPriceStoreList.shopName }" target="_blank">${lowestPriceStoreList.shopName }</a></h2>
											<p>주소 : ${lowestPriceStoreList.address }</p>
											<div style="float: left;">
											<p>가격 : ${lowestPriceStoreList.salePrice }원</p>
											<p>
												거리 :
												<fmt:formatNumber type="number" pattern="0"
													value="${lowestPriceStoreList.distance }" />
												m
											</p>
											</div>
											<div style="float: right;margin-right: 50px;">
											<a href="#" id="${lowestPriceStoreList.shopName }" class="route_map" target="_blank">
										<img src="resources/img/elements/route_map_icon.png" style="max-width: 50px;">
										</a>
										</div>
									</div>
									</aside>
									</div>
								</div>
								
							</c:forEach>
							<c:if test="${lowestPriceStore == null }">
							<div class="col-md-4">
									<div class="single-defination">
										<h2 class="mb-20">주변 할인 매장이 없습니다</h4>
									</div>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</main>

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