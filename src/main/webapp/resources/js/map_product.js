$(document).ready(function(){

 
    if (navigator.geolocation) {
        
        // GeoLocation을 이용해서 접속 위치를 얻어옵니다
        navigator.geolocation.getCurrentPosition(function(position) {
            
            lat = position.coords.latitude; // 위도
            lon = position.coords.longitude; // 경도
    	
            $('#lat').val(lat);
            $('#lon').val(lon);
            
     });
    }

    // 상품 검색 버튼 눌릴시 실행
    $('#searchProduct').click(function(){
    	// 유효성 검사
    	if($('#productName').val() == null || $('#productName').val() == ''){
			 alert("검색어를 입력해주세요")
		 }
    	else{
    		// 상품 이름 저장
    		var productName = $('#productName').val()
    		// 리스트 div 비움
    		$(".area").empty();
    		// 리스트 div에 검색중 텍스트 출력
    		var searchText = "<a class='box'><p class='subject'>상품을 검색 중입니다</p></a>"
    		$('.area').append(searchText);
    		// ajax 실행
    		$.ajax({
      		  url  : "getMapProductList.do",
      		  type : "POST",
      		  contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
      		  data : {productName:productName},
      		  success : function(data){
      			  // 리스트 div 비움
      			 $(".area").empty();
      			 
      			 var content = ""
      			 
      			// 검색결과 상품리스트 반복 입력
      			 for(var i = 0; i < data.length; i++){

      				var price = data[i].productLastAveragePrice.toString();
               	 
      				price = price.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
               	 
  				 	 content += "<a href='#' class='box' onclick='searchProductStoreList(\"" +data[i].productName+"\");return false;'><div style='height:100px;'>";
  				 	 content += "<div id='left' style='height: 150px;float:left;'><img src='resources/img/images/" + data[i].productCode +".jpg' alt='' style='max-width: 100px;max-height: 150px;'></div><div id='right' style='height:150px;'>"
  					 content += "<p class='subject'>"+data[i].productName+"</p>";
  					 content += "<p class='tel'> 평균 가격 - "+price+"원</p></div></div><hr/></a>";
  	
      			 }
      		    
      			 // 검색결과가 없으면 검색결과 없다고 입력
      		    if(data.length == 0){
  					 content = "<a class='box'><p class='subject'>검색 결과가 없습니다</p></a>"
  				 }
      		    // 리스트에 검색결과 출력
      		  $('.area').append(content);
      		  	},error:function(request,status,error){
   				 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
   			 }
    		})
    	}
    })
    
    
    
})

// 검색한 상품을 선택시 해당 상품 판매 매장 검색
function searchProductStoreList(productName){
	
	// 위도 경도 저장
	var lat = $('#lat').val()
	var lon = $('#lon').val()
	
	// json 방식으로 파라미터 저장
	var data = {"lat" : lat, "lon" : lon, "productName" : productName}
	
	// 리스트 비움
	$(".area").empty();
	
	// 리스트에 검색중 텍스트 출력
	var searchText = "<a class='box'><p class='subject'>매장을 검색 중입니다</p></a>";
	$('.area').append(searchText);
	
	// ajax 실행
	$.ajax({
		  url  : "getProductStoreList.do",
		  type : "POST",
		  data : data,
		  dataType: "json",
		  success : function(data){
			  
			  // 리스트 비움
			 $(".area").empty();
			 
			 var content = ""
			 
			// 매장 리스트 반복 입력
			 for(var i = 0; i < data.length; i++){

			 	 content += "<a href='#' class='box' onclick='storeMarker(" + data[i].lon +","+data[i].lng+");return false;'>";
				 content += "<p class='subject'>"+data[i].shopName+"</p>";
				 content += "<p class='add'>"+data[i].address+"</p>";
				 content += "<p class='tel'>"+data[i].productName+ " - "+data[i].salePrice+"원</p><hr/></a>";

			 }
		    
			 // 검색 상품 판매 매장 없을시 텍스트
		    if(data.length == 0){
				 content = "<a class='box'><p class='subject'>검색 결과가 없습니다</p></a>"
			 }
			 
		    // 입력된 매장 리스트 출력
			 $('.area').append(content);
		  }
		});
}