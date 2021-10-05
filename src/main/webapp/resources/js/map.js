$(document).ready(function(){

	$("div.loaderbase").hide();
 
    if (navigator.geolocation) {
        
        // GeoLocation을 이용해서 접속 위치를 얻어옵니다
        navigator.geolocation.getCurrentPosition(function(position) {
            
            lat = position.coords.latitude; // 위도
            lon = position.coords.longitude; // 경도
       
            var map = $('[href="map.do"]')
            var mapdo = "map.do?lat=" + lat +"&lon=" +lon;
            map.prop('href', mapdo);
            
            $('#lat').val(lat);
            $('#lon').val(lon);
            
            var price = $('[href="price_compare.do"]')
            var pricedo = "price_compare.do?lat=" + lat +"&lon=" +lon;
            price.prop('href', pricedo);
            
            $('[href^="productdetails.do"]').each(function (index, item){
                // 상품 상세 링크 가져오기
                var details = $(item).prop('href')
                $(item).prop('href',details + '&lat=' + lat + '&lon=' + lon);
            })
            

         // 주소-좌표 변환 객체를 생성합니다
         var geocoder = new kakao.maps.services.Geocoder();

         var callback = function(result, status){
        	    if(status === daum.maps.services.Status.OK){
        	    	
        	        var addr = result[0].address.address_name
        	        
        	        var url = "https://google.com/maps/dir/" + addr
        	        
        	        $('a.route_map').each(function (index, item){
                        // 상품 상세 링크 가져오기
                        var shopName = $(item).attr('id');
                        $(item).prop('href', url + "/" + shopName + "/");
                    })
                    
        	    }
        	};

        	geocoder.coord2Address(lon, lat, callback);


            
     });
    }
    
    // 매장명 클릭 했을시 함수 실행
    $('a.box').click(function(){
       
    	if (navigator.geolocation) {
        	
        	navigator.geolocation.getCurrentPosition(function(position) {
                
                lat = position.coords.latitude; // 위도
                lon = position.coords.longitude; // 경도
        	})
    	}
    	
       // 매장명
       var shopName = $(this).children('.storeName').val();
       
       // 상품 리스트 출력하는 div 내용 삭제
       $(".productlist").empty();
       
       // 상품 리스트 출력하는 div에 검색중 텍스트 출력
       var searchText = "<h1>상품을 검색중입니다</h1>"
       $('.productlist').append(searchText);
       
       // ajax
        $.ajax({
          type : "post",
          url : "getStoreProductList.do",
          contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
          data : {shopName : shopName},
          success:function(data){
            // 상품 리스트 출력하는 div 내용 삭제
             $(".productlist").empty();
             
             // 슬라이드 선언
             var content = "<div class='popular-directorya-area fix' style='justify-content: center;display: flex;'><div class='row owl-carousel owl-theme'>";
             
             // 해당 매장 상품 반복하여 입력
             for(var i = 0; i < data.length; i++){
                 
            	 var price = data[i].salePrice.toString();
            	 
            	 price = price.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
            	 
                   content += "<div class='col-lg-6 item'>";
                   content += "<div class='properties properties2 mb-30'>";
                   content += "<div class='properties__card'>";
                   content += "<div class='properties__img overlay1'>";
                   content += "<a href='productdetails.do?product_code=" + data[i].productCode + "&lat=" + lat +"&lon=" + lon + "' onclick='showLoader();'><img src='resources/img/images/"+ data[i].productCode + ".jpg' alt='' style='background-color: white'></a>";
                   content += "<div class='img-text'></div>";
                   content += "<div class='icon'></div></div>";
                   content += "<div class='properties__caption'>";
                   content += "<h3><a href='productdetails.do?product_code=" + data[i].productCode + "&lat=" + lat +"&lon=" + lon + "'' onclick='showLoader();'>" + data[i].productName + "</a></h3>";
                   content += "<p>" + data[i].productDetail + "</p></div>";
                   content += "<div class='properties__footer d-flex justify-content-between align-items-center'>";
                   content += "<div class='restaurant-name'>";
                   content += "<h3>매장가격 : " + price + "원</h3>";
                   content += "</div><div class='heart'><img src='resources/img/gallery/heart1.png' alt=''>";
                   content += "</div></div></div></div></div>";

               
            
             }
             content += "</div></div>";
             
             // 상품이 없을시에는 상품없음 입력
             if(data.length == 0){
                content = "<h1>핫딜 상품이 없습니다</h1>"
             }
             
             // 입력 받은 상품 리스트를 div에 출력
             $('.productlist').append(content);
             
             // 슬라이드 스크립트 선언
             $('.owl-carousel').owlCarousel({
                   loop:true, // 슬라이드 반복 여부
                   margin:10, // 슬라이드 사이 간격
                   nav:true,  // 네비게이션 버튼 유무
                   // 네비게이션 버튼 텍스트
                   navText: [ '<i class="zmdi zmdi-chevron-left"></i>', '<i class="zmdi zmdi-chevron-right"></i>' ],
                   // 반응형 옵션
                   responsive:{
                       0:{
                           items:1
                       },
                       600:{
                           items:3
                       },
                       1000:{
                           items:5
                       }
                   }
               })
               
          },error:function(request,status,error){
             alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
          }
          
       });
    })
    
})

// 검색 버튼 누를시 실행
function textSearch(){
   
   // 모든 매장 리스트 숨김
   $('div.shopList').css("display","none")
   
   // 검색 텍스트 가져오기
   var text = $('input#search_text').val()
   
   // 매장 리스트를 하나씩 확인
   $('div.shopList').each(function (index, item){
      // 매장명 가져오기
      var shopName = $(item).children().children("p.subject").text();
      // 매장명에 검색 텍스트가 포함되어있으면 매장명 출력
      if(shopName.indexOf(text) != -1){
         $(item).css("display","block")
      }
   })
   
   
}

function showLoader(){
	$("div.loaderbase").show();
};

