<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
<title>테스트</title>
</head>
<body>
<div id = "root">
<!-- S: Index(Home).jsp 의 div 총괄 시작 -->
<!-- S: 헤더 부분 시작 -->
   <header id= "header">
      <div id = "header_box">
         <jsp:include page="/WEB-INF/views/include/header.jsp"/>
      </div>
   </header>
   <!-- E: 헤더 부분 끝 -->
   <!-- S: 본문 영역 시작 -->
<body>
<!-- 지도를 출력할 div 선언 -->
<div id="map" style="width:800px;height:500px;"></div>
<p id="current"><p>
<p id="result"></p>
<p id="distance"></p>

<input type="text" id="lat1"><input type="text" id="lon1">
<input type="text" id="lat2"><input type="text" id="lon2">
<br>
<!-- 매장 위도 경도 찍는 임시 버튼 -->
<input type="button" value="이마트신도림점" onclick="storeMarker(this)"/>
<input type="button" value="롯데마트구로점" onclick="storeMarker(this)"/>
<input type="button" value="이마트구로점" onclick="storeMarker(this)"/>
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
        
        var lat = position.coords.latitude, // 위도
            lon = position.coords.longitude; // 경도
        
        var locPosition = new kakao.maps.LatLng(lat, lon); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다

        // 마커와 인포윈도우를 표시합니다
        displayMarker(locPosition);
            
        var message = '접속한 위치의 위도는 ' + lat + ' 이고, ';
        message += '경도는 ' + lon + ' 입니다';
        
        var currentDiv = document.getElementById('current'); 
        currentDiv.innerHTML = message;
        
        document.getElementById('lat1').value = lat;
        document.getElementById('lon1').value = lon;
        
        
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
	
	function setInfowindows(map) {
	    for (var i = 0; i < infowindows.length; i++) {
	    	infowindows[i].setMap(map);
	    }            
	}
	
	// setInfowindows에 null을 입력하여 기존 인포 윈도우 삭제
	setInfowindows(null);
	
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({  
        map: map, 
        position: locPosition
    }); 

    var message = '<div style="padding:5px;">' + val +'</div>'	// 인포 윈도우에 표시할 메시지 입력
    var iwContent = message, // 인포윈도우에 표시할 내용
        iwRemoveable = true;
     
    var infowindow = new kakao.maps.InfoWindow({
        content : val,
        removable : iwRemoveable
    });
    
    
    // 인포윈도우를 마커위에 표시합니다 
    infowindow.open(map, marker);
    
    // 지도 중심좌표를 매장위치로 변경합니다
    map.setCenter(locPosition);
    map.setLevel(7)
 // 마커에 마우스클릭 이벤트를 등록합니다
    kakao.maps.event.addListener(marker, 'click', function() {
      // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
        infowindow.open(map, marker);
    });
 
 	// 생성된 마커를 배열에 추가합니다
    markers.push(marker);
    infowindows.push(infowindow);
    
    
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
    
    var message = val + '의 위도는 ' + latlng.getLat() + ' 이고, ';
    message += '경도는 ' + latlng.getLng() + ' 입니다';
    
    var resultDiv = document.getElementById('result'); 
    resultDiv.innerHTML = message;
    
    document.getElementById('lat2').value = latlng.getLat();
    document.getElementById('lon2').value = latlng.getLng();
    
    var distance = getDistanceFromLatLonInKm(document.getElementById('lat1').value, document.getElementById('lon1').value, latlng.getLat(), latlng.getLng())
    
    var distanceMessage = '두 위치의 거리는 ' + Math.round(distance) + 'Km 입니다'
     
    document.getElementById('distance').innerHTML = distanceMessage;
      
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
</body>
</html>