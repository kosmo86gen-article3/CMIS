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
	
	// 파라미터값 가져와서 변수로 저장
	var keyword = getUrlParameter('keyword');
	var select = getUrlParameter('select');
	
	// 파라미터값이 있으면
	if(keyword != '' || keyword != null){
		
		// url에 포함할 parameter 값 저장
		var href = "&keyword=" + keyword + "&select=" + select
		
		// page-link 클래스 전부 각각 함수 실행
		$('.page-link').each(function (index, item){
		
			// a태그 기존 url 가져옴
			var url = $(item).prop('href');
		
			// 기존 url에 파라미터 추가
			$(item).prop('href', url+href);
		});
	}
	
	$('#imageSearch').click(function(e){
		e.preventDefault();
		$('#imageSearchModal').modal("show");
	});
	
	$('#modalSubmit').on('click',function (event) {
		
		event.preventDefault();
		
	    var memberName = $('#memberName').val()
	    var imageUpload = $('#imageUpload').val();
	    
	    if(memberName == null || memberName == ''){
	    	alert("로그인 후 이미지 검색이 가능합니다")
	    	return false;
	    }
	    else if(imageUpload == null || imageUpload == ''){
	        alert("파일을 선택해주세요");
	        return false;
	      }
	    else{
	    		    
	    var form = new FormData(document.getElementById('imageSearchForm'));
	    $('#modalSubmit').text("이미지 검색중입니다");
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
	        		content += "<p/><p class='subject'> 검색 결과는 "+data.result +" 입니다</p>"
	        		
	        	$(".modal-body").append(content);

	        	$("#modalSubmit").hide();
	        	$("#imageUpload").hide();
	        	       	
	        	var okTable = "<a class='btn' id='modalOk' href='productList.do?keyword=" + data.result + "&select=title'>네</a>";
	        	var	resetTable = "<a class='btn' id='modalNo' href='#' onclick='resetModal();'>아니요</a>";
	        			
	        	$('#okTable').append(okTable);
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


function resetModal(){
	
	$('#modalOk').remove();
	$('#modalNo').remove();
	
	$('.modal-body').empty();
		
	var	modalBody = "검색할 이미지를 첨부해주세요";
	
	$(".modal-body").append(modalBody);
	
	$("#modalSubmit").show();
	$("#imageUpload").show();
	$('#modalSubmit').text("이미지 업로드");
};