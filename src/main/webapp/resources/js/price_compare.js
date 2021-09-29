$(document).ready(function(){
	var idx = 1;
	var lat = $('#lat').val();
    var lon = $('#lon').val();
	
	// 상품 검색 눌렀을시 모달에 결과 전달
	$('#productSearch').click(function(e){
		
		e.preventDefault();
		
		// input태그에 입력한 상품명
	    var product_name = $('#product_name').val();
	    
	    if(product_name == '' || product_name == null){
	    	alert("검색할 상품명을 입력해주세요");
	    	return false;
	    }

	    $.ajax({
	        type: "POST",
	        url: "productCompareSearch.do",
	        type : "POST",
    		contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
    		data : {product_name:product_name},
	        success: function (data) {
	        	$(".modal-body").empty();

	        	var content = ""
	      			 
	      			// 검색결과 상품리스트 반복 입력
	      			 for(var i = 0; i < data.length; i++){

	      				var price = data[i].productLastAveragePrice.toString();
	               	 
	      				price = price.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	               	 
	  				 	 content += "<div style='height:150px;'>";
	  				 	 content += "<div id='left' style='height: 150px;float:left;'><img src='resources/img/images/" + data[i].productCode +".jpg' alt='' style='max-width: 150px;max-height: 150px;'></div><div id='right' style='height:150px;text-align:center;'>"
	  					 content += "<p class='subject'>"+data[i].productName+"</p>";
	  					 content += "<p class='tel'> 평균 가격 - "+price+"원</p>";
	  					 content += "<a class='btn' href='#' onclick='addProductCompare(\"" +data[i].productName+"\");'>상품 담기</a></div></div><hr/>";
	  	
	      			 }
	      		    
	      			 // 검색결과가 없으면 검색결과 없다고 입력
	      		    if(data.length == 0){
	  					 content = "<a class='box'><p class='subject'>검색 결과가 없습니다</p></a>"
	  				 }
	        		
	        	$(".modal-body").append(content);
	        	       	
	        	$('#productSearchModal').modal("show");
	        
	        	
	        },
	        error:function(request,status,error){
  				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	        }
	    });
	    
	    
	    
	});
	
	  $('.sum').each(function (index, item){
		  
          var cls = ".store" + idx;
          var sum = 0;
          $(cls).each(function(index,item){
        	  sum += Number($(this).text());
          })
          idx += 1;
          $(item).text(sum);
      })
	
});

function addProductCompare(product_name){
	 $.ajax({
	        type: "POST",
	        url: "addProductCompare.do",
 		contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
 		dataType:"text",
 		data : {product_name:product_name},
	        success: function(data) {
	        	alert(data);
	        	location.reload();
	        	},error:function(request,status,error){
	   				 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	   			 }
	        });
}

function removeAllProductCompare(){
	 $.ajax({
	        type: "POST",
	        url: "removeAllProductCompare.do",
		contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
		dataType:"text",
	        success: function() {
	        	alert("모두 삭제했습니다");
	        	location.reload();
	        	},error:function(request,status,error){
	   				 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	   			 }
	        });
}

function removeProductCompare(product_name){
	$.ajax({
        type: "POST",
        url: "removeProductCompare.do",
	contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
	dataType:"text",
		data : {product_name:product_name},
        success: function(data) {
        	alert(data);
        	location.reload();
        	},error:function(request,status,error){
   				 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
   			 }
        });
}