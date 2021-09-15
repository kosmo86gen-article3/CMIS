<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
<title>productdetails</title>
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
   
   
   <!-- S: 본문 영역 시작 -->
   
   <section id = "container">
      <div id = "container_box">
		<!--? Popular Locations Start 01-->
    <div class="popular-location border-bottom section-padding40">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <!-- Section Tittle -->
                    <div class="section-tittle text-center mb-80">
                        <h2>상품 상세 정보</h2>
                        <p>최적의 가격 정보와 가격 예측값, 시각화 자료를 제공하며  그래프를 통해 추이를 확인 할 수 있습니다.</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-12">
                    <div class="single-location mb-30">
                        <div class="location-img">
                            <img src="resources/img/gallery/home-blog1.png" alt="">
                        </div>
                        <div class="location-details">
                            <a href="#" class="location-btn">Tips</a>
                            <ul>
                                <li>12 March   I   by Alan</li>
                            </ul>
                            <p><a href="blog_details.html">The Best SPA Salons For Your Relaxation</a></p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-12">
                    <div class="single-location mb-30">
                        <div class="location-img">
                            <img src="resources/img/gallery/home-blog2.png" alt="">
                        </div>
                        <div class="location-details">
                            <a href="#" class="location-btn">Tips</a>
                            <ul>
                                <li>12 March   I   by Alan</li>
                            </ul>
                            <p><a href="blog_details.html">The Best SPA Salons For Your Relaxation</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Popular Locations End -->
    <section class="sample-text-area">
			<div class="container box_1170">
				<h3 class="text-heading">Text Sample</h3>
				<p class="sample-text">
					Every avid independent filmmaker has <b>Bold</b> about making that <i>Italic</i> interest documentary,
					or short
					film to show off their creative prowess. Many have great ideas and want to “wow”
					the<sup>Superscript</sup> scene,
					or video renters with their big project. But once you have the<sub>Subscript</sub> “in the can” (no easy
					feat), how
					do you move from a <del>Strike</del> through of master DVDs with the <u>“Underline”</u> marked
					hand-written title
					inside a secondhand CD case, to a pile of cardboard boxes full of shiny new, retail-ready DVDs, with UPC
					barcodes
					and polywrap sitting on your doorstep? You need to create eye-popping artwork and have your project
					replicated.
					Using a reputable full service DVD Replication company like PacificDisc, Inc. to partner with is
					certainly a
					helpful option to ensure a professional end result, but to help with your DVD replication project, here
					are 4 easy
					steps to follow for good DVD replication results:
	
				</p>
			</div>
		</section>
     </div>
   </section>
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