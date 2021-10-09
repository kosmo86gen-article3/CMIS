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
<title>상품별 최저가</title>
</head>
<body>
	<div id="root">
		<!-- S: Index(Home).jsp 의 div 총괄 시작 -->
		<!-- S: 헤더 부분 시작 -->
		<header id="header">
			<div id="header_box">
				<jsp:include page="/WEB-INF/views/include/header.jsp" />
				<link rel="stylesheet" href="resources/css/map.css">
				<link rel="stylesheet"
					href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />
				<link rel="stylesheet" href="resources/css/slider.css">
				<link rel="stylesheet"
					href="resources/css/material-design-iconic-font.min.css">
				<script src="./resources/js/map_product.js"></script>
			</div>
		</header>
		<!-- E: 헤더 부분 끝 -->


		<!-- S: 본문 영역 시작 -->
		<div
			class="position-relative overflow-hidden p-3 p-md-5 m-md-3 text-center bg-light"
			style="margin-bottom: 50px !important; height: 220px; background: #494343 !important">
			<div class="col-md-5 p-lg-5 mx-auto my-5">
				<h1 class="display-4 font-weight-normal" style="color: white">상품별
					최저가</h1>
				<p class="lead font-weight-normal" style="color: white">내 주변 최저가
					상품을 찾아보세요</p>
			</div>
			<div class="product-device shadow-sm d-none d-md-block"></div>
			<div
				class="product-device product-device-2 shadow-sm d-none d-md-block"></div>
		</div>


		<!-- 전체 Container -->
		<div class="container">
         <div class="our-services  border-bottom" style="margin:20px">
         
            <div class="row">
               <div class=" col-lg-4 col-md-4 col-sm-4">
                  <div class="single-services mb-30" style="background: #fd7e1475;border-radius: 20px;">
                     <div class="services-ion">
                        <span>01</span>
                     </div>
                     <div class="services-cap">
                        <h5>
                           <a href="#">원하는 상품을 검색합니다.</a>
                        </h5>
                     </div>
                  </div>
               </div>
               <div class=" col-lg-4 col-md-4 col-sm-4">
                  <div class="single-services mb-30" style="background: #fd7e1475;border-radius: 20px;">
                     <div class="services-ion">
                        <span>02</span>
                     </div>
                     <div class="services-cap">
                        <h5>
                           <a href="#">상품과 매장을 확인합니다.</a>
                        </h5>
                     </div>
                  </div>
               </div>
               <div class=" col-lg-4 col-md-4 col-sm-4">
                  <div class="single-services mb-30" style="background: #fd7e1475;border-radius: 20px;">
                     <div class="services-ion">
                        <span>03</span>
                     </div>
                     <div class="services-cap">
                        <h5>
                           <a href="#">최저가 기준 매장을 정렬합니다.</a>
                        </h5>
                     </div>
                  </div>
               </div>
            </div>
            </div>
         </div>
	</div>
	<div class="container">
	<div class="row" style="margin-bottom: 100px;">
		<div class="col-sm-3 col-md-6 col-lg-4">
			<!-- 왼쪽 컨테이너 구조 -->
			<div class="category-listing">
				<form name="search_form" id="search_form" class="form"
					onsubmit="return false">
					<input type="hidden" name="lat" id="lat" value=""> <input
						type="hidden" name="lon" id="lon" value="">
					<h2 style="color: black; text-align: center;">
						상품검색
						</h3>
						<div class="input-group mb-3">
							<input type="text" name="productName" id="productName" value=""
								placeholder="상품명" style="height: 50px;" class="form-control">
							<div class="input-group-append">
								<button type="button" id="searchProduct" onclick="return false;"
									class="btn btn-outline-secondary">Search</button>
							</div>
						</div>
						<p class="ex">- 새우깡, 왕뚜껑, 참이슬</p>
				</form>
				<div class="shop_sort" style="overflow: hidden; outline: none;">

					<div class="area on" id="shopArea1"
						style="outline: none; overflow: scroll; height: 231.4px;"
						tabindex="1">
						<a class='box'><p class='subject'>조회할 상품을 검색해주세요</p></a>
					</div>

				</div>
			</div>
		</div>
		<div class="col-sm-9 col-md-6 col-lg-8">
			<!-- 지도를 출력할 div 선언 -->
			<div id="map" class="category-listing" style="width: 100%; height: 100%;"></div>
		</div>

		<!-- E: 본문 영역 끝 -->


		<br /> <br />
	</div>
	</div>
	<!-- E: Index(Home).jsp 의 div 총괄 끝  -->

	<footer id="footer">
		<div id="footer_box">
			<jsp:include page="/WEB-INF/views/include/footer.jsp" />
		</div>
	</footer>
</body>
</html>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f8a16e73608a4a6a4fe93cd542e3eb76"></script>
<script>
   var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
   mapOption = {
      center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
      level : 3
   // 지도의 확대 레벨
   };

   var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

   //HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
   if (navigator.geolocation) {

      // GeoLocation을 이용해서 접속 위치를 얻어옵니다
      navigator.geolocation.getCurrentPosition(function(position) {

         var lat = position.coords.latitude; // 위도 저장
         var lon = position.coords.longitude; // 위도

         var locPosition = new kakao.maps.LatLng(lat, lon); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다

         // 마커와 인포윈도우를 표시합니다
         displayMarker(locPosition);

      });

   } else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

      var locPosition = new kakao.maps.LatLng(33.450701, 126.570667), message = 'geolocation을 사용할수 없어요..'

      displayMarker(locPosition, message);
   }

   //지도에 마커와 인포윈도우를 표시하는 함수입니다
   function displayMarker(locPosition) {

      // 마커를 생성합니다
      var marker = new kakao.maps.Marker({
         map : map,
         position : locPosition
      });

      // 지도 중심좌표를 접속위치로 변경합니다
      map.setCenter(locPosition);
      map.setLevel(7)

   }

   // 새로 찍는 마커와 인포윈도우를 받을 배열 선언
   var markers = [];
   var infowindows = [];
   //매장 위치 마커를 생성하는 함수
   function displayStoreMarker(locPosition) {

      function setMarkers(map) {
         for (var i = 0; i < markers.length; i++) {
            markers[i].setMap(map);
         }
      }

      // setMarkers에 null을 입력하여 기존 마커 삭제
      setMarkers(null);

      var imageSrc = 'resources/img/map/map-marker-icon-red.png';
      var imageSize = new kakao.maps.Size(42, 42); // 마커이미지의 크기입니다
      var imageOption = {
         offset : new kakao.maps.Point(27, 69)
      };

      // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
      var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,
            imageOption);

      // 마커를 생성합니다
      var marker = new kakao.maps.Marker({
         map : map,
         position : locPosition,
         image : markerImage

      });

      // 지도 중심좌표를 매장위치로 변경합니다
      map.setCenter(locPosition);
      map.setLevel(7);

      // 생성된 마커를 배열에 추가합니다
      markers.push(marker);

   }
   // 지도에 클릭 이벤트를 등록합니다
   // 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
   function storeMarker(lat, lng) {

      // 기본 위도 경도 설정
      var latlng = new kakao.maps.LatLng(lat, lng);

      // 매장명으로 DB검색하여 위도 경도 받아올 예정
      // DB에 위도 경도가 없으면 주소값으로 위도 경도 찾는 함수 사용하면 됨
      var locPosition = new kakao.maps.LatLng(latlng.getLat(), latlng
            .getLng());

      displayStoreMarker(locPosition)

   };
</script>

<!--? Popular Directory End -->
<!--Pagination Start  -->
<!--Pagination End  -->

</div>
<!-- listing-area Area End -->

<!--? Want To work 02-->

<!-- Want To work End -->
<!--? Want To work 01-->
<!-- E: 본문 영역 끝 -->


<!-- S: 푸터 영역 시작 -->
</div>
<!-- E: Index(Home).jsp 의 div 총괄 끝  -->






</body>
</html>