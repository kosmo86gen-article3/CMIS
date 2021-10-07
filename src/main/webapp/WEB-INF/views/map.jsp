<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>매장별 최저가</title>
<link rel="shortcut icon" href="resources/img/favicon.png"
	type="image/png">
<link rel="icon" href="resources/img/favicon.png" type="image/png">
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
				<link rel="stylesheet" href="resources/css/map.css">
				<link rel="stylesheet"
					href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />
				<link rel="stylesheet" href="resources/css/slider.css">
				<link rel="stylesheet"
					href="resources/css/material-design-iconic-font.min.css">
			</div>
		</header>
		<!-- E: 헤더 부분 끝 -->
		<div
			class="position-relative overflow-hidden p-3 p-md-5 m-md-3 text-center bg-light"
			style="margin-bottom: 50px !important; height: 220px; background: #494343 !important">
			<div class="col-md-5 p-lg-5 mx-auto my-5">
				<h1 class="display-4 font-weight-normal" style="color: white">매장별
					최저가</h1>
				<p class="lead font-weight-normal" style="color: white">내 주변 최저가
					매장을 찾아보세요</p>
			</div>
			<div class="product-device shadow-sm d-none d-md-block"></div>
			<div
				class="product-device product-device-2 shadow-sm d-none d-md-block"></div>
		</div>

		<!-- S: 본문 영역 시작 -->
		<div class="container">
			<!-- 전체 Container -->

			<div class="row">
				<div class="col-sm-3 col-md-6 col-lg-4">
					<!-- 왼쪽 컨테이너 구조 -->
					<div class="category-listing">
						<form name="search_form" id="search_form" class="form"
							onsubmit="return false">
							<input type="hidden" name="lat" id="lat" value=""> <input
								type="hidden" name="lng" id="lng" value="">
							<h2 style="color: black; text-align: center">매장찾기</h2>
							<div class="input-group mb-3">
								<input type="text" class="form-control" id="search_text"
									placeholder="매장명" style="height: 50px">
								<div class="input-group-append">
									<button class="btn btn-outline-secondary" type="button"
										onclick="textSearch(); return false;" id="button-addon2">Search</button>
								</div>
							</div>
							<p class="ex">- 롯데마트, 이마트, GS</p>
						</form>
						<div class="shop_sort" style="overflow: hidden; outline: none;">
							<div class="area on" id="shopArea1"
								style="outline: none; overflow: scroll; height: 231.4px;"
								tabindex="1">
								<c:forEach items="${storeList}" var="storeList">
									<a href="#" class="box"
										onclick="storeMarker(${storeList.lon},${storeList.lat },&#39${storeList.shopName}&#39);return false;">
										<input type="hidden" class="storeLon" value="${storeList.lon}" />
										<input type="hidden" class="storeLat" value="${storeList.lat}" />
										<input type="hidden" class="storeName"
										value="${storeList.shopName}" />
										<p class="subject">${storeList.shopName }</p>
										<p class="add">${storeList.address }</p> <c:if
											test="${not empty storeList.shopTelnum}">
											<p class="tel">${storeList.shopTelnum }</p>
										</c:if>
										<hr style="border-bottom: 1px solid #f15d30" />
									</a>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-9 col-md-6 col-lg-8">
					<!-- 오른쪽 컨테이너 -->
					<div id="map" class="category-listing" style="width: 100%; height: 100%;"></div>

				</div>
				<!-- 상품 목록 출력 컨테이너 -->
				<div class="col-sm-12" style="margin-top: 15px">
					<hr style="border-bottom: 1px solid #f15d30" />
					<div class="col-sm-12"
						style="text-align: center; margin-bottom: 15px">
						<h1>상품 목록</h1>
					</div>
					<div class="container productlist"></div>
				</div>

			</div>
		</div>
		<!-- E: 본문 영역 끝 -->
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
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

//지도를 표시하는 div 크기를 변경하는 함수입니다
function resizeMap() {
    var mapContainer = document.getElementById('map');
    mapContainer.style.width = '650px';
    mapContainer.style.height = '650px'; 
}

function relayout() {    
    
    // 지도를 표시하는 div 크기를 변경한 이후 지도가 정상적으로 표출되지 않을 수도 있습니다
    // 크기를 변경한 이후에는 반드시  map.relayout 함수를 호출해야 합니다 
    // window의 resize 이벤트에 의한 크기변경은 map.relayout 함수가 자동으로 호출됩니다
    map.relayout();
}


//HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
if (navigator.geolocation) {
    
    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
    navigator.geolocation.getCurrentPosition(function(position) {
        
        var lat = position.coords.latitude; // 위도 저장
        var lon = position.coords.longitude; // 위도
        
        var locPosition = new kakao.maps.LatLng(lat, lon); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다

        // 마커와 인포윈도우를 표시합니다
        displayMarker(locPosition);     
        
        
        var storeLons = document.getElementsByClassName("storeLon");
      var storeLats = document.getElementsByClassName("storeLat");
      var storeNames = document.getElementsByClassName("storeName");

      for( var i = 0; i < storeLons.length; i++ ){
         var storeLon = storeLons.item(i).value;
         var storeLat = storeLats.item(i).value;
         var storeName = storeNames.item(i).value;
         storeMarkers(storeLon, storeLat, storeName);  
      }
        
        
      });
    
} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
    
    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
        message = 'geolocation을 사용할수 없어요..'
        
    displayMarker(locPosition, message);
}

//현재 위치 찍는 마커 함수
//지도에 마커와 인포윈도우를 표시하는 함수입니다
function displayMarker(locPosition) {

    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({  
        map: map, 
        position: locPosition
    }); 
    
    // 지도 중심좌표를 접속위치로 변경합니다
    map.setCenter(locPosition);
    map.setLevel(7)
    
    var infowindow = new kakao.maps.InfoWindow({
        content : "<div style='text-align:center;min-width:150px;max-width:100%;'>현재 위치</div>"
    });
    
 // 마커에 마우스오버 이벤트를 등록합니다
    kakao.maps.event.addListener(marker, 'mouseover', function() {
      // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
        infowindow.open(map, marker);
    });

    // 마커에 마우스아웃 이벤트를 등록합니다
    kakao.maps.event.addListener(marker, 'mouseout', function() {
        // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
        infowindow.close();
    });
    
}    

function storeMarkers(lat,lng,storeName) {        
    
   
    // 기본 위도 경도 설정
    var latlng = new kakao.maps.LatLng(lat, lng);
    
    // 매장명으로 DB검색하여 위도 경도 받아올 예정
    // DB에 위도 경도가 없으면 주소값으로 위도 경도 찾는 함수 사용하면 됨
    var locPosition = new kakao.maps.LatLng(latlng.getLat(), latlng.getLng());
      
    displayStoreMarkers(locPosition, storeName)
    
};

// 모든 매장 위치 마커를 생성하는 함수
function displayStoreMarkers(locPosition, storeName) {
   
   var imageSrc = 'resources/img/map/map-marker-icon-red.png';
   var imageSize = new kakao.maps.Size(42, 42); // 마커이미지의 크기입니다
   var imageOption = {offset: new kakao.maps.Point(27, 69)};

   // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
   var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
   
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({  
        map: map, 
        position: locPosition,
        image: markerImage
        
    }); 
    
    var infowindow = new kakao.maps.InfoWindow({
        content : "<div style='text-align:center;min-width:150px;max-width:100%;'>" + storeName + "</div>"
    });
    
 // 마커에 마우스오버 이벤트를 등록합니다
    kakao.maps.event.addListener(marker, 'mouseover', function() {
      // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
        infowindow.open(map, marker);
    });

    // 마커에 마우스아웃 이벤트를 등록합니다
    kakao.maps.event.addListener(marker, 'mouseout', function() {
        // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
        infowindow.close();
    });
    
    
}    

// 새로 찍는 마커와 인포윈도우를 받을 배열 선언
// 기존 매장 마커 제거를 위해 배열 선언
var markers = [];
var infowindows = [];

//매장 위치 마커를 생성하는 함수
function displayStoreMarker(locPosition,shopName) {
   
   
   function setMarkers(map) {
       for (var i = 0; i < markers.length; i++) {
           markers[i].setMap(map);
       }            
   }
   
   // setMarkers에 null을 입력하여 기존 마커 삭제
   setMarkers(null);
   
   function setInfowindows(map) {
       for (var i = 0; i < infowindows.length; i++) {
          infowindows[i].setMap(map);
       }            
   }
   
   // setMarkers에 null을 입력하여 기존 마커 삭제
   setInfowindows(null);   
   
   var imageSrc = 'resources/img/map/map-marker-icon-green.png';
   var imageSize = new kakao.maps.Size(42, 42); // 마커이미지의 크기입니다
   var imageOption = {offset: new kakao.maps.Point(27, 69)};

   // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
   var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
   
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({  
        map: map, 
        position: locPosition,
        image: markerImage
        
    }); 
    
    var infowindow = new kakao.maps.InfoWindow({
        content : "<div style='text-align:center;min-width:150px;max-width:100%;'>" + shopName + "</div>"
    });
    
 // 마커에 마우스오버 이벤트를 등록합니다
    kakao.maps.event.addListener(marker, 'mouseover', function() {
      // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
        infowindow.open(map, marker);
    });

    // 마커에 마우스아웃 이벤트를 등록합니다
    kakao.maps.event.addListener(marker, 'mouseout', function() {
        // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
        infowindow.close();
    });
    
    // 지도 중심좌표를 매장위치로 변경합니다
    map.setCenter(locPosition);
    map.setLevel(7);
 
    // 생성된 마커를 배열에 추가합니다
    markers.push(marker);
    infowindows.push(infowindow);
    
}    
// 지도에 클릭 이벤트를 등록합니다
// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
function storeMarker(lat,lng,shopName) {        
    
   
    // 기본 위도 경도 설정
    var latlng = new kakao.maps.LatLng(lat, lng);
    
    // 매장명으로 DB검색하여 위도 경도 받아올 예정
    // DB에 위도 경도가 없으면 주소값으로 위도 경도 찾는 함수 사용하면 됨
    var locPosition = new kakao.maps.LatLng(latlng.getLat(), latlng.getLng());
      
    displayStoreMarker(locPosition,shopName);
    
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