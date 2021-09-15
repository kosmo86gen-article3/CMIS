<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!doctype html>
<html>
<head>
    <meta charset="utf-8">
<title>제목</title>
</head>
<body>
<div id = "root"> <!-- S: Index(Home).jsp 의 div 총괄 시작 -->
<!-- S: 헤더 부분 시작 -->
   <header id= "header">
      <div id = "header_box">
         <jsp:include page="/WEB-INF/views/include/header.jsp"/>
         <link rel="stylesheet" href="resources/css/map.css">
      </div>
   </header>
   <!-- E: 헤더 부분 끝 -->
   
   
   <!-- S: 본문 영역 시작 -->
   
   <section id = "container">
      <div id = "container_box">
     <main>
    <!--? Hero Area Start-->
    <div class="slider-area hero-bg2 hero-overly">
        <div class="single-slider hero-overly  slider-height4 d-flex align-items-center">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-xl-10 col-lg-10">
                        <!-- Hero Caption -->
                        <div class="hero__caption hero__caption2 pt-200">
                            <h1>주변 매장 정보</h1>
                        </div>
                        <!--Hero form -->
                    </div>
                </div>
            </div>
        </div>
    </div>
   


  <!-- listing Area Start -->
  
        
                <!--? Popular Directory Start -->
              <!-- 지도를 출력할 div 선언 -->
              <section class="section section-shop">
<div id="map" style="height: 564px; position: relative; overflow: hidden;"></div>
<!-- 매장 위도 경도 찍는 임시 버튼 -->
<div class="float">
<form name="search_form" id="search_form" class="form">
					<input type="hidden" name="lat" id="lat" value="37.4730836">
					<input type="hidden" name="lng" id="lng" value="126.8788276">
					<h3>매장찾기</h3>
					<div class="shop_search">
						<input type="text" name="search_text" id="search_text" value="">
						<button type="button" onclick="textSearch()" style="display: block;
    position: absolute; right: 0; top: 0; overflow: visible; padding: 0px; border: 0px; font-weight: normal;
    cursor: pointer;
    outline: none;
    background-color: transparent;"><img src="resources/img/map/btn_shop_search.gif" alt="검색" style="border: none;
    vertical-align: middle;"></button>
					</div>
					<p class="ex">- 서초동, 대치, 판교</p>
				</form>
<div class="shop_sort">
					<div class="area on" id="shopArea1" style="overflow: hidden; outline: none;" tabindex="1">
					<a href="#" class="box" onclick="loadTabList(7202301,37.472723,126.868675);">
					<p class="subject">광명철산푸르지오</p>
					<p class="add">경기도 광명시 디지털로 24 (철산동, 철산푸르지오하늘채아파트) 113동B125호</p><p class="tel">02-2619-9288</p></a>
					</div>

</div>
</div>
</section>
   <!-- E: 본문 영역 끝 -->
   
   
   <!-- S: 푸터 영역 시작 -->
   <footer id = "footer">
      <div id = "footer_box">
         <jsp:include page="/WEB-INF/views/include/footer.jsp"/>
      </div>
   </footer>
</div> <!-- E: Index(Home).jsp 의 div 총괄 끝  -->
</body>
</html>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f8a16e73608a4a6a4fe93cd542e3eb76"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

//HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
if (navigator.geolocation) {
    
    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
    navigator.geolocation.getCurrentPosition(function(position) {
        
        var lat = sessionStorage.getItem("lat"); // 위도 저장
        var lon = sessionStorage.getItem("lon"); // 위도
        
        var locPosition = new kakao.maps.LatLng(lat, lon); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다

        // 마커와 인포윈도우를 표시합니다
        displayMarker(locPosition);     
        
      });
    
} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
    
    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
        message = 'geolocation을 사용할수 없어요..'
        
    displayMarker(locPosition, message);
}

//지도에 마커와 인포윈도우를 표시하는 함수입니다
function displayMarker(locPosition) {

    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({  
        map: map, 
        position: locPosition
    }); 

    var message = '<div style="padding:5px;">현재 위치</div>'	// 인포 윈도우에 표시할 메시지 입력
    var iwContent = message; // 인포윈도우에 표시할 내용

    // 인포윈도우를 생성합니다
    var infowindow = new kakao.maps.InfoWindow({
        content : iwContent
    });
    
    // 인포윈도우를 마커위에 표시합니다 
    infowindow.open(map, marker);
    
    // 지도 중심좌표를 접속위치로 변경합니다
    map.setCenter(locPosition);
    map.setLevel(7)
 // 마커에 마우스클릭 이벤트를 등록합니다
    kakao.maps.event.addListener(marker, 'click', function() {
      // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
        infowindow.open(map, marker);
    });
    
    
}    

// 새로 찍는 마커와 인포윈도우를 받을 배열 선언
var markers = [];
var infowindows = [];

//매장 위치 마커를 생성하는 함수
function displayStoreMarker(locPosition, val) {
	
	
	function setMarkers(map) {
	    for (var i = 0; i < markers.length; i++) {
	        markers[i].setMap(map);
	    }            
	}
	
	// setMarkers에 null을 입력하여 기존 마커 삭제
	setMarkers(null);
	
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({  
        map: map, 
        position: locPosition
    }); 

    
    // 지도 중심좌표를 매장위치로 변경합니다
    map.setCenter(locPosition);
    map.setLevel(7)
 
 	// 생성된 마커를 배열에 추가합니다
    markers.push(marker);
    
}    
// 지도에 클릭 이벤트를 등록합니다
// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
function storeMarker(objButton) {        
    
    // 클릭한 위도, 경도 정보를 가져옵니다 
    // var latlng = mouseEvent.latLng;
    var val = objButton.value;
    
    // 기본 위도 경도 설정
    var latlng = new kakao.maps.LatLng(37, 127);
    
    // 매장명으로 DB검색하여 위도 경도 받아올 예정
    // DB에 위도 경도가 없으면 주소값으로 위도 경도 찾는 함수 사용하면 됨
    if (val == "이마트신도림점") {
    	latlng = new kakao.maps.LatLng(37.5068200867115, 126.89048765825154);
    } else if(val == "롯데마트구로점") {
    	latlng = new kakao.maps.LatLng(37.4982780, 126.8727020);
    } else if(val == "이마트구로점") {
    	latlng = new kakao.maps.LatLng(37.484470223469614, 126.89791326885032);
    }
    
    var locPosition = new kakao.maps.LatLng(latlng.getLat(), latlng.getLng());
      
    displayStoreMarker(locPosition, val)
    
};

// 현재 위치와 매장 위치 거리 계산하는 함수
function getDistanceFromLatLonInKm(lat1,lng1,lat2,lng2) {
    function deg2rad(deg) {
        return deg * (Math.PI/180)
    }

    var R = 6371; // Radius of the earth in km
    var dLat = deg2rad(lat2-lat1);  // deg2rad below
    var dLon = deg2rad(lng2-lng1);
    var a = Math.sin(dLat/2) * Math.sin(dLat/2) + Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.sin(dLon/2) * Math.sin(dLon/2);
    var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
    var d = R * c; // Distance in km
    return d;
}
</script>
                <!--? Popular Directory End -->
                <!--Pagination Start  -->
                <!--Pagination End  -->
            

</div>
<!-- listing-area Area End -->
	
    <!--? Want To work 02-->
    <section class="wantToWork-area">
        <div class="container">
            <div class="wants-wrapper w-padding2">
                <div class="row justify-content-between">
                    <div class="col-xl-8 col-lg-8 col-md-7">
                        <div class="wantToWork-caption wantToWork-caption2">
                            <img src="resources/img/logo/logo2_footer.png" alt="" class="mb-20">
                            <p>Users and submit their own items. You can create different packages and by connecting with your
                                PayPal or Stripe account charge users for registration to your directory portal.</p>
                        </div>
                    </div>
                    <div class="col-xl-4 col-lg-4 col-md-5">
                        <div class="footer-social f-right sm-left">
                            <a href="#"><i class="fab fa-twitter"></i></a>
                            <a href="https://bit.ly/sai4ull"><i class="fab fa-facebook-f"></i></a>
                            <a href="#"><i class="fab fa-pinterest-p"></i></a>
                            <a href="#"><i class="fab fa-instagram"></i></a>
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
   <footer id = "footer">
      <div id = "footer_box">
         <jsp:include page="/WEB-INF/views/include/footer.jsp"/>
      </div>
   </footer>
</div> <!-- E: Index(Home).jsp 의 div 총괄 끝  -->
</body>
</html>