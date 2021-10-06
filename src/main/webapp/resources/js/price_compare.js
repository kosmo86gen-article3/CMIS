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
	        	$("#productSearchModal .modal-body").empty();

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
	        		
	        	$("#productSearchModal .modal-body").append(content);
	        	       	
	        	$('#productSearchModal').modal("show");
	        
	        	
	        },
	        error:function(request,status,error){
  				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	        }
	    });
	    
	    
	    
	});
	
	// 이미지 검색 클릭시 모달 호출
	$('#imageSearch').click(function(e){
		e.preventDefault();
		$('#imageSearchModal').modal("show");
	});
	
	// 이미지 업로드 버튼 클릭시 이벤트
	$('#modalSubmit').on('click',function (event) {
		
		event.preventDefault();
		
		// 회원 아이디
	    var memberName = $('#memberName').val()
	    // 이미지
	    var imageUpload = $('#imageUpload').val();
	    // 로그인 유효성
	    if(memberName == null || memberName == ''){
	    	alert("로그인 후 이미지 검색이 가능합니다")
	    	return false;
	    }// 이미지 유효성
	    else if(imageUpload == null || imageUpload == ''){
	        alert("파일을 선택해주세요");
	        return false;
	      }
	    else{
	    // 폼 데이터를 json 형식으로 저장 		    
	    var form = new FormData(document.getElementById('imageSearchForm'));
	    // 이미지 검색중 출력
	    $('#modalSubmit').text("이미지 검색중입니다");
	    // 검색 이미지랑 텍스트 출력
	    $("#imageSearchModal .modal-body").empty();
	    $("#imageSearchModal .modal-body").append("<img src='resources/img/elements/loading-buffering.gif' style='width: 100px;height: 100px; display: block; margin: 0px auto;'>");
		
	    $.ajax({
	        type: "POST",
	        url: "imageSearch.do",
	        data: form,
	        processData: false,
	        contentType: false,
	        success: function (data) {
	        	// alert(data.result);
	        	$("#imageSearchModal .modal-body").empty();
	        	
	        	sleep(3000);
	        	
	        	var time = new Date().getTime();
	        	
	        	var src = data.userId + ".jpg?time=" + time 

	        	var content = "<img src='resources/img/searchImage/" + src +" alt='' style='max-width: 100%;max-height: 100%;'>"
	        		content += "<p/><p class='subject'> 검색 결과는 "+data.keyword +" 입니다</p>"
	        		
	        	$("#imageSearchModal .modal-body").append(content);

	        	$("#imageSearchModal #modalSubmit").hide();
	        	$("#imageSearchModal #imageUpload").hide();
	        	       	
	        	
	        	if (navigator.geolocation) {
	        			        	
		        	navigator.geolocation.getCurrentPosition(function(position) {
		                
		                lat = position.coords.latitude; // 위도
		                lon = position.coords.longitude; // 경도
		        	})
	        	}
	        	
	        	var compareTable = "<a class='btn' id='modalCompare' href='#' onclick='addProductCompare(&#39;"+ data.product_db_name +"&#39;)'>견적 담기</a>";
	        	var	resetTable = "<a class='btn' id='modalNo' href='#' onclick='resetModal();'>아니요</a>";
	        	
	        	$('#imageSearchModal #compareTable').append(compareTable);
	        	$('#imageSearchModal #resetTable').append(resetTable);
	        },
	        error:function(request,status,error){
  				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
  				$('#imageSearchModal #modalSubmit').text("이미지 업로드");
	        }
	    });
	    
	    }
	    
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
		        	if(data=="상품을 견적서에 추가했습니다"){
		        	$('#productSearchModal').modal("hide");
		        	$('#imageSearchModal').modal("hide");
		        	alert(data);
		        	location.reload();
	        	}else{
	        		alert(data);
	        	}
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

function resetModal(){
	
	$('#imageSearchModal #modalOk').remove();
	$('#imageSearchModal #modalNo').remove();
	$('#imageSearchModal #compareTable').empty();
	$('#imageSearchModal .modal-body').empty();
		
	var	modalBody = "검색할 이미지를 첨부해주세요";
	
	$("#imageSearchModal .modal-body").append(modalBody);
	
	$("#imageSearchModal #modalSubmit").show();
	$("#imageSearchModal #imageUpload").show();
	$('#imageSearchModal #modalSubmit').text("이미지 업로드");
};

function sleep(ms) {
	  const wakeUpTime = Date.now() + ms;
	  while (Date.now() < wakeUpTime) {}
	}