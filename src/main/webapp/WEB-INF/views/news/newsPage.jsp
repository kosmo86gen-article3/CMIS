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
                        <div class="blog_left_sidebar">
                        
                          <c:forEach items="${newsBoardList }" var="board">
                            <article class="blog_item">
                                <div class="blog_item_img rounded" style="border-radius: 10px !important; background: gainsboro;">
                                <c:if test="${board.news_img != null}">
                                    <img class="card-img rounded" src="${board.news_img }" alt="" style="width:35%; margin-left:35%;
                                    border-radius:10px !important">
                                    </c:if>

                                </div>
                                <div class="blog_details">
                                   <input type="hidden" id="nwsNmValue" value="${board.news_num }">
                                    <a class="d-inline-block nwsSrchBtn" href="${board.news_link }" target='_blank'>
                                        <h2 class="blog-head" style="color: #2d2d2d;">${board.news_title }</h2>
                                    </a>
                                    <p>${board.news_content }</p>
                                    <ul class="blog-info-link">
                                        <li>${board.news_press }</li>
                                        <li>조회수 : ${board.news_hits }</li>
                                        <li>키워드 : ${board.news_keyword }</li>
                                    </ul>
                                </div>
                            </article>
                          </c:forEach>
                            
                            <nav class="blog-pagination justify-content-center d-flex">
                                <ul class="pagination">
                                    <li class="page-item">
                                        <a href="#" class="page-link" aria-label="Previous">
                                            <i class="ti-angle-left"></i>
                                        </a>
                                    </li>
                                    <li class="page-item">
                                        <a href="#" class="page-link">1</a>
                                    </li>
                                    <li class="page-item active">
                                        <a href="#" class="page-link">2</a>
                                    </li>
                                    <li class="page-item">
                                        <a href="#" class="page-link" aria-label="Next">
                                            <i class="ti-angle-right"></i>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                        </div>
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
                                
                                <div class="media post_item">
                                    <img src="resources/img/post/post_1.png" alt="post">
                                    <div class="media-body">
                                        <a href="blog_details.html">
                                            <h3 style="color: #2d2d2d;">From life was you fish...</h3>
                                        </a>
                                        <p>January 12, 2019</p>
                                    </div>
                                </div>
                                
                            </aside>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Blog Area End -->
        
        
</main>

<script type="text/javascript">
$(function(){
   // 키워드별 기사 갯수 출력 시작
   var newsKeyword = ["물가", "소비자", "인상"];
   
   for (let i=1; i < 4; i++) {
      
      let temp = $(".blog_item > .blog_details > ul > li:nth-child(3):contains('"+newsKeyword[i-1]+"')");
      
      $('#newsKeywordUl > li:nth-child('+i+') > a > p').append("("+temp.length+")")
   }
   // 키워드별 기사 갯수 출력 끝
   
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
   
   // 뉴스 키워드별 조회 시작
   $('#newsKeywordUl > li > a').on('click', function(e){
      e.preventDefault();
      var keyword = $(this).children().text();
      /* alert(keyword); */
      
      $('.blog_item').hide();
      
      var temp = $(".blog_item > .blog_details > ul > li:nth-child(3):contains('"+keyword+"')");
      /* alert(temp.length); */
      
      $(temp).parent().parent().parent().show();
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
</body>
</html>