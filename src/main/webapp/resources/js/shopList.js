$(document).ready(function(){
	
	var distric_code = "*";
	var shop_kind_code= "*";
	    
    $('div.distric_code li.option').on('click', function(){
    	
    		distric_code = $(this).attr("data-value");
    	
    	$.ajax({
    	    	type:"post",
    	    	url:"getShopList.do",
    	    	contentType: "application/x-www-form-urlencoded;charset=UTF-8",
    	    	data:{distric_code : distric_code,
    	    		shop_kind_code : shop_kind_code
    	    	},
    	    	success: function(data){
    	    		//alert(data.length);
    	    		$(".shopList").empty();
    	    		$('.countShopList').empty();

    	    		//setMarkers에 null을 입력하여 기존 마커 삭제
    	    		setMarkers(null);
    	    		// setMarkers에 null을 입력하여 기존 마커 삭제
    	    		setInfowindows(null);  
    	    		var content ="";   	    		
    	    		for(var i =0; i< data.length; i++){
    	    			content += "<div>"
   	    				content += "<hr class='listLine'/>"
    	    			content += "<div>[" + data[i].shop_name +"]</div>";
    	    			content += "<div>" + data[i].location_name +"</div>";
    	    			content += "<div>" + data[i].shop_kind_name +"</div>";
    	    			content += "<div>" + data[i].address +"</div>";
    	    			content += "</div>";	
    	    			
    	    			
    	    			storeMarkers(data[i].lng, data[i].lat, data[i].shop_name);
    	    		}
    	    		$('.shopList').append(content);
    	    		$('.countShopList').append(data.length+"개의 매장이 존재합니다.");
    	    	},error:function(request,status,error){
    	             alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    	        }
    	 })//ajax 종료
    })   //on.click 종료
    
    
    $('div.shop_kind_name li.option').on('click', function(){
    	
    		shop_kind_code = $(this).attr("data-value");
    		
    		$.ajax({
    	    	type:"post",
    	    	url:"getShopList.do",
    	    	contentType: "application/x-www-form-urlencoded;charset=UTF-8",
    	    	data:{distric_code : distric_code,
    	    		shop_kind_code : shop_kind_code
    	    	},
    	    	success: function(data){
    	    		//alert(data.length);
    	    		$(".shopList").empty();
    	    		$('.countShopList').empty();
    	    		//setMarkers에 null을 입력하여 기존 마커 삭제
    	    		setMarkers(null);
    	    		// setMarkers에 null을 입력하여 기존 마커 삭제
    	    		setInfowindows(null);  
    	    		var content ="";   	    		
    	    		for(var i =0; i< data.length; i++){
    	    			
    	    			content += "<div>"
    	    			content += "<hr style='border:solid 1px #f15d30;'/>"
    	    			content += "<div>[" + data[i].shop_name +"]</div>";
    	    			content += "<div>" + data[i].location_name +"</div>";
    	    			content += "<div>" + data[i].shop_kind_name +"</div>";
    	    			content += "<div>" + data[i].address +"</div>";
    	    			content += "</div>"	
    	    				
    	    			storeMarkers(data[i].lng, data[i].lat, data[i].shop_name);
    	    		}
    	    		$('.shopList').append(content);
    	    		$('.countShopList').append(data.length+"개의 매장이 존재합니다.");
    	    	},error:function(request,status,error){
    	             alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    	        }
    	 })//ajax 종료
    })   //on.click 종료


})//ready function 종료
