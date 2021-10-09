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
<title>전국 매장 정보</title>
<style>
	::-webkit-scrollbar-thumb {
                background-color: #f15d30; /*스크롤바의 색상*/
            }
</style>
</head>
<body>
<div class="loaderbase">
	<div class="loader"></div>
	<div class="loaderText"><h1 style="color: white;">매장 목록을 불러오는 중입니다</h4>
	
	</div>
</div>
	<div id="root">
		<!-- S: Index(Home).jsp 의 div 총괄 시작 -->
		<!-- S: 헤더 부분 시작 -->
		<header id="header">
			<div id="header_box">
				<jsp:include page="/WEB-INF/views/include/header.jsp" />
				<script src="./resources/js/shopList.js"></script>
			</div>
		</header>
		<!-- E: 헤더 부분 끝 -->


		<!-- S: 본문 영역 시작 -->
		<section id="container">
			<div id="container_box">
				<main>
					<!--? Hero Area Start-->
					<div
			class="position-relative overflow-hidden p-3 p-md-5 m-md-3 text-center bg-light"
			style="margin-bottom: 0px !important; height: 220px; background: #494343 !important">
			<div class="col-md-5 p-lg-5 mx-auto my-5">
				<h1 class="display-4 font-weight-normal" style="color: white">매장 목록</h1>
				<p class="lead font-weight-normal" style="color: white">전국의 매장 정보를 확인해보세요</p>
			</div>
			<div class="product-device shadow-sm d-none d-md-block"></div>
			<div
				class="product-device product-device-2 shadow-sm d-none d-md-block"></div>
		</div>

					<!-- listing Area Start -->
					
					<div class="listing-area pt-120 pb-120">
						<div class="container">
							<div class="row">
								<!--? Left content -->
								<div class="col-xl-4 col-lg-4 col-md-6">

									<!-- Job Category Listing start -->
									<div class="category-listing mb-50" style='border:solid 2px #f15d30;'>
									<div class="row">
										<div class="col-12 pt-5" >
											<div class="small-section-tittle2 mb-45">
												<h2 class="text-center">카테고리를 선택하세요.</h2>
											</div>
										</div>
									</div>
										<!-- single one -->
										<div class="single-listing">
											<!-- Select City items start -->
										
											<div class="select-job-items2">
												<select class = "distric_code" name="distric_code">
													<option value="*">지역</option>
													<option value="020100000">서울</option>
													<option value="020900000">경기도</option>
													<option value="020800000">강원도</option>											
													<option value="021500000">충청북도</option>
													<option value="021400000">충청남도</option>
													<option value="021100000">경상북도</option>
													<option value="021000000">경상남도</option>
													<option value="021200000">전라남도</option>
													<option value="021300000">전라북도</option>
													<option value="020700000">인천</option>
													<option value="020400000">대전</option>
													<option value="020300000">대구</option>
													<option value="020600000">울산</option>
													<option value="020200000">광주</option>
													<option value="020500000">부산</option>
													<option value="021600000">제주</option>
												</select>
											</div>
											<!--  Select City items End-->
											<!-- Select State items start -->
											 <div class="select-job-items2">
												<select class = "shop_kind_name" name="shop_kind_name">
													<option value="*">업종</option>
													<option value="LM">대형마트</option>
													<option value="DP">백화점</option>
													<option value="SM">슈퍼마켓</option>
													<option value="TR">전통시장</option>
													<option value="CS">편의점</option>
												</select>
											</div> 
											
											<!--  Select State items End-->
										
											<!--  Select km items End-->
											<!-- select-Categories start -->
											<div class="select-Categories pt-80 pb-30">
												<div class="small-section-tittle2 mb-20">
													
													<h2 class="text-center" style="text-align:center">매장 목록 출력</h2>
												<div style="overflow: auto; max-height: 350px" class="shopList"></div>
												</div>
												
												
												
												<!-- <label class="container">매장 목록 출력 <input
													type="checkbox"> <span class="checkmark"></span>
												</label>
											</div>
											select-Categories End
											select-Categories start
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
												</label>-->
											</div>
											<!-- select-Categories End -->
										</div>
									</div>
									<!-- Job Category Listing End -->
								</div>
								<!--?  Right content -->
								
								<div class="col-xl-8 col-lg-8 col-md-6">
									
										<div id="map" style="width: 100%; height: 720px;"></div>
									
									<div class="row">
										<div class="col-lg-12">
											<div class="count mb-35 countShopList" >
												
											</div>
										</div>
									</div>
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
    map.setLevel(14);
    
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
    
 	// 생성된 마커를 배열에 추가합니다
    markers.push(marker);
    infowindows.push(infowindow);
    
    map.setCenter(locPosition);
    map.setLevel(10);
    
}    

// 새로 찍는 마커와 인포윈도우를 받을 배열 선언
// 기존 매장 마커 제거를 위해 배열 선언
var markers = [];
var infowindows = [];

function setMarkers(map) {
    for (var i = 0; i < markers.length; i++) {
        markers[i].setMap(map);
    }            
}



function setInfowindows(map) {
    for (var i = 0; i < infowindows.length; i++) {
    	infowindows[i].setMap(map);
    }            
}

//매장 위치 마커를 생성하는 함수
function displayStoreMarker(locPosition,shopName) {
	
	
		
	
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
