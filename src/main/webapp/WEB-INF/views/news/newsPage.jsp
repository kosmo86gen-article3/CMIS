<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<link rel="shortcut icon" href="resources/img/favicon.png"
	type="image/png">
<link rel="icon" href="resources/img/favicon.png" type="image/png">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.css"/> <!-- 21-10-09 문경식 추가 -->
<title>뉴스 / Hot Issue</title>
</head>
<body>
<div id = "root"> <!-- S: Index(Home).jsp 의 div 총괄 시작 -->
<!-- S: 헤더 부분 시작 -->
   <header id= "header">
      <div id = "header_box">
         <jsp:include page="/WEB-INF/views/include/header.jsp"/>
         
      </div>
   </header>
<!-- E: 헤더 부분 끝 -->
<main>
      <!--? Hero Start -->

      <!-- Hero End -->
      <div
         class="position-relative overflow-hidden p-3 p-md-5 m-md-3 text-center bg-light"
         style="margin-bottom: 0px !important;height: 220px;background: #c0d4f7 !important;">
         <div class="col-md-5 p-lg-5 mx-auto my-5">
            <h1 class="display-4 font-weight-normal" style="color: black">NEWS</h1>
            <p class="lead font-weight-normal" style="color: black;">일주일 단위로 업데이트 되는 최신 뉴스입니다.</p>
         </div>
         <div class="product-device shadow-sm d-none d-md-block"></div>
         <div
            class="product-device product-device-2 shadow-sm d-none d-md-block"></div>
      </div>
      
<!--? Blog Area Start-->
        <section class="blog_area section-padding">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 mb-5 mb-lg-0">
                        <h1 style="text-align:center">카드뉴스</h1>
                        <div class="blog_left_sidebar" id="data-container"></div>
                        <div id="pagination"></div>
                    </div>
                    <div class="col-lg-4">
                        <div class="blog_right_sidebar">
                            <aside class="single_sidebar_widget search_widget" style="border-radius: 20px;background: #9ebdf2a6;">
                                <form action="#">
                                    <div class="form-group">
                                        <div class="input-group mb-3">
                                            <input type="text" class="form-control" id="newsSearchVal" placeholder='제목을 검색합니다'
                                                onfocus="this.placeholder = ''"
                                                onblur="this.placeholder = '제목을 검색합니다'">
                                            <div class="input-group-append">
                                                <button id="newsSearchBtn" class="btns" type="button" style="background:var(--gray-dark) !important"><i class="ti-search"></i></button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </aside>
                            <aside class="single_sidebar_widget post_category_widget" style="border-radius: 20px;background: #9ebdf2a6;">
                                <h4 class="widget_title" style="color: #2d2d2d;">키워드</h4>
                                <ul class="list cat-list" id="newsKeywordUl">
                                    <li>
                                        <a href="#" class="d-flex">
                                            <p>물가</p>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#" class="d-flex">
                                            <p>소비자</p>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#" class="d-flex">
                                            <p>인상</p>
                                        </a>
                                    </li>
                                </ul>
                            </aside>
                            <aside class="single_sidebar_widget popular_post_widget" style="border-radius: 20px;background: #9ebdf2a6;">
                                <h3 class="widget_title" style="color: #2d2d2d;">많이 본 뉴스</h3>
                                <c:forEach items="${miniNewsBoardList }" var="miniboard">
                                  <div class="media post_item">
                                   <c:if test="${miniboard.news_img != null}">
                                    <img src="${miniboard.news_img }" alt="" style="width:26%;">
                                   </c:if>
                                    <div class="media-body">
                                        <a href="${miniboard.news_link }">
                                            <h3 style="color: #2d2d2d;">${fn:substring(miniboard.news_title,0,15) }...</h3>
                                        </a>
                                        <p>키워드 : ${miniboard.news_keyword }</p>
                                    </div>
                                  </div>
                                </c:forEach>
                            </aside>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Blog Area End -->
        
        
</main>

<script type="text/javascript">
// 뉴스 페이징 하기 위한 데이터 불러오기
var arr = new Array();
<c:forEach items="${newsBoardList }" var="board">
	arr.push({news_img:"${board.news_img}", news_num:"${board.news_num}", news_link:"${board.news_link}", news_title:"${board.news_title}", news_content:"${board.news_content}"
		, news_press:"${board.news_press}", news_hits:"${board.news_hits}", news_keyword:"${board.news_keyword}"});
</c:forEach>

$(function(){
   // 뉴스 조회수 증가 시작
   $('.nwsSrchBtn').click(cntUp);
     function cntUp() {
      $.ajax({
      url:"newsBoardCnt.do", 
      type:"post", 
      contentType:"application/x-www-form-urlencoded;charset=UTF-8",
      data:{news_num:$(this).prev().val()}, 
      success:function(){
         /* alert("카운트 성공"); */
      }, 
      error: function(request, status, error) {
         alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
      }
     })
   }
   // 뉴스 조회수 증가 끝
   
   // 뉴스 검색 jquery 시작
   $('#newsSearchVal').keyup(function(){
      var keyword = $('#newsSearchVal').val();
      
      $('.blog_item').hide();
      
      var temp = $(".blog_item > .blog_details > a > h2:contains('"+keyword+"')");
      
      $(temp).parent().parent().parent().show();
   });
   // 뉴스 검색 jquery 끝
   
   // 뉴스 페이징 처리 시작
   var container = $('#pagination');
        container.pagination({
            dataSource: arr,
            callback: function (data, pagination) {
                var dataHtml = '';

                $.each(data, function (index, item) {
                    dataHtml += '<article class="blog_item">';
                    dataHtml += '<div class="blog_item_img rounded" style="border-radius: 10px !important; background: gainsboro;">';
                    if(item.news_img != null){
                    	dataHtml += '<img class="card-img rounded" src="'+item.news_img+'" alt="" style="width:35%; margin-left:35%; border-radius:10px !important">';
                    }
                    dataHtml += '</div>';
                    dataHtml += '<div class="blog_details">';
                    dataHtml += '<input type="hidden" id="nwsNmValue" value="'+item.news_num+'">';
                    dataHtml += '<a class="d-inline-block nwsSrchBtn" href="'+item.news_link+'" target=_blank">';
                    dataHtml += '<h2 class="blog-head" style="color: #2d2d2d;">'+item.news_title+'</h2>';
                    dataHtml += '</a>';
                    dataHtml += '<p>'+item.news_content+'</p>';
                    dataHtml += '<ul class="blog-info-link">';
                    dataHtml += '<li>'+item.news_press+'</li>';
                    dataHtml += '<li>조회수 : '+item.news_hits+'</li>';
                    dataHtml += '<li>키워드 : '+item.news_keyword+'</li>';
                    dataHtml += '</ul>';
                    dataHtml += '</div>';
                    dataHtml += '</article>';
                });

                $("#data-container").html(dataHtml);
            }
    })
    // 뉴스 페이징 처리 끝
    
    // 키워드별 기사 갯수 출력 시작
    var newsKeyword1 = 0;
    var newsKeyword2 = 0;
    var newsKeyword3 = 0;
    
   	for( let z=0; z<arr.length; z++){
   		if(arr[z].news_keyword == "물가"){
   			newsKeyword1 += 1;
   		}else if(arr[z].news_keyword == "소비자"){
   			newsKeyword2 += 1;
   		}else if(arr[z].news_keyword == "인상"){
   			newsKeyword3 += 1;
   		}
   	}
    
    $('#newsKeywordUl > li:nth-child(1) > a > p').append("("+newsKeyword1+")")
    $('#newsKeywordUl > li:nth-child(2) > a > p').append("("+newsKeyword2+")")
    $('#newsKeywordUl > li:nth-child(3) > a > p').append("("+newsKeyword3+")")
	// 키워드별 기사 갯수 출력 끝
	
	//뉴스 키워드별 조회 시작
	var arr2 = new Array();
	
   $('#newsKeywordUl > li > a').on('click', function(e){
      e.preventDefault();
      var keyword = $(this).children().text().split("(")[0];
      /* alert(keyword); */
   
      $('.blog_item').remove();
      $('#pagination').empty();
      
      arr2 = [];
      
      for(let y=0; y<arr.length; y++){
     		if(arr[y].news_keyword == keyword){
     			arr2.push(arr[y])
     		}
      }
   
      container.pagination({
          dataSource: arr2,
          callback: function (data, pagination) {
              var dataHtml = '';

              $.each(data, function (index, item) {
                  dataHtml += '<article class="blog_item">';
                  dataHtml += '<div class="blog_item_img rounded" style="border-radius: 10px !important; background: gainsboro;">';
                  if(item.news_img != null){
                  	dataHtml += '<img class="card-img rounded" src="'+item.news_img+'" alt="" style="width:35%; margin-left:35%; border-radius:10px !important">';
                  }
                  dataHtml += '</div>';
                  dataHtml += '<div class="blog_details">';
                  dataHtml += '<input type="hidden" id="nwsNmValue" value="'+item.news_num+'">';
                  dataHtml += '<a class="d-inline-block nwsSrchBtn" href="'+item.news_link+'" target=_blank">';
                  dataHtml += '<h2 class="blog-head" style="color: #2d2d2d;">'+item.news_title+'</h2>';
                  dataHtml += '</a>';
                  dataHtml += '<p>'+item.news_content+'</p>';
                  dataHtml += '<ul class="blog-info-link">';
                  dataHtml += '<li>'+item.news_press+'</li>';
                  dataHtml += '<li>조회수 : '+item.news_hits+'</li>';
                  dataHtml += '<li>키워드 : '+item.news_keyword+'</li>';
                  dataHtml += '</ul>';
                  dataHtml += '</div>';
                  dataHtml += '</article>';
              });

              $("#data-container").html(dataHtml);
          }
  })
      
   })
   // 뉴스 키워드별 조회 끝
   
}); // document ready 끝
</script>

<!-- S: 푸터 영역 시작 -->
<footer id = "footer">
  <div id = "footer_box">
    <jsp:include page="/WEB-INF/views/include/footer.jsp"/>
  </div>
</footer>
<!-- E: 푸터 영역 끝 -->
</div> <!-- E: Index(Home).jsp 의 div 총괄 끝  -->
<script src="./resources/js/pagination.min.js"></script>
</body>
</html>