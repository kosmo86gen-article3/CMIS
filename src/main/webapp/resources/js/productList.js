// url 파라미터값 가져오는 함수
var getUrlParameter = function getUrlParameter(sParam) {
    var sPageURL = decodeURIComponent(window.location.search.substring(1)),
        sURLVariables = sPageURL.split('&'),
        sParameterName,
        i;
 
    for (i = 0; i < sURLVariables.length; i++) {
        sParameterName = sURLVariables[i].split('=');
 
        if (sParameterName[0] === sParam) {
            return sParameterName[1] === undefined ? true : sParameterName[1];
        }
    }
};

$(document).ready(function(){
	
	var loader = $("div.loaderbase");
	loader.hide();
	
	$('.properties__card a').click(function(){
		loader.show();
	});
	
	$('#productSearch').click(function(){
		$('#productSearchForm').submit();
	});
	
	// 파라미터값 가져와서 변수로 저장
	var keyword = getUrlParameter('keyword');
	
	
	// 파라미터값이 있으면
	if(keyword){
		
		// url에 포함할 parameter 값 저장
		var href = "&keyword=" + keyword
		
		// page-link 클래스 전부 각각 함수 실행
		$('.page-link').each(function (index, item){
		
			// a태그 기존 url 가져옴
			var url = $(item).prop('href');
		
			// 기존 url에 파라미터 추가
			$(item).prop('href', url+href);
		});
	}
	
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
	    $(".modal-body").empty();
	    $(".modal-body").append("<img src='resources/img/elements/loading-buffering.gif' style='width: 100px;height: 100px; display: block; margin: 0px auto;'>");
		
	    $.ajax({
	        type: "POST",
	        url: "imageSearch.do",
	        data: form,
	        processData: false,
	        contentType: false,
	        success: function (data) {
	        	// alert(data.result);
	        	$(".modal-body").empty();
	        	
	        	sleep(3000);
	        	
	        	var time = new Date().getTime();
	        	
	        	var src = data.userId + ".jpg?time=" + time 

	        	var content = "<img src='resources/img/searchImage/" + src +" alt='' style='max-width: 100%;max-height: 100%;'>"
	        		content += "<p/><p class='subject'> 검색 결과는 "+data.keyword +" 입니다</p>"
	        		
	        	$(".modal-body").append(content);

	        	$("#modalSubmit").hide();
	        	$("#imageUpload").hide();
	        	       	
	        	
	        	if (navigator.geolocation) {
	        			        	
		        	navigator.geolocation.getCurrentPosition(function(position) {
		                
		                lat = position.coords.latitude; // 위도
		                lon = position.coords.longitude; // 경도
		        	})
	        	}
	        	
	        	var okTable = "<a class='btn' id='modalOk' href='productdetails.do?product_code=" + data.product_code + "&lat=" + lat +"&lon=" + lon + "' onclick='loader()'>네</a>";
	        	var compareTable = "<a class='btn' id='modalCompare' href='#' onclick='addProductCompare(&#39;"+ data.product_db_name +"&#39;)'>견적 담기</a>";
	        	var	resetTable = "<a class='btn' id='modalNo' href='#' onclick='resetModal();'>아니요</a>";
	        			
	        	$('#okTable').append(okTable);
	        	$('#compareTable').append(compareTable);
	        	$('#resetTable').append(resetTable);
	        },
	        error:function(request,status,error){
  				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
  				$('#modalSubmit').text("이미지 업로드");
	        }
	    });
	    
	    }
	    
	});
	
});

function sleep(ms) {
	  const wakeUpTime = Date.now() + ms;
	  while (Date.now() < wakeUpTime) {}
	}

function loader(){
	$("div.loaderbase").show();
}

function resetModal(){
	
	$('#modalOk').remove();
	$('#modalNo').remove();
	$('#compareTable').empty();
	$('.modal-body').empty();
		
	var	modalBody = "검색할 이미지를 첨부해주세요";
	
	$(".modal-body").append(modalBody);
	
	$("#modalSubmit").show();
	$("#imageUpload").show();
	$('#modalSubmit').text("이미지 업로드");
};

function addProductCompare(product_name){
	 $.ajax({
	        type: "POST",
	        url: "addProductCompare.do",
		contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
		dataType:"text",
		data : {product_name:product_name},
	        success: function(data) {
	        	alert(data);
	        	},error:function(request,status,error){
	   				 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	   			 }
	        });
}