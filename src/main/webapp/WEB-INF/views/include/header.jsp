<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>DirectoryListing</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon" href="resources/images/favicon.ico">
<link rel="icon" type="image/png" href="resources/images/favicon.png">
<link rel="manifest" href="site.webmanifest">


<!-- CSS here -->
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="resources/css/slicknav.css">
<link rel="stylesheet" href="resources/css/flaticon.css">
<link rel="stylesheet" href="resources/css/progressbar_barfiller.css">
<link rel="stylesheet" href="resources/css/gijgo.css">
<link rel="stylesheet" href="resources/css/animate.min.css">
<link rel="stylesheet" href="resources/css/animated-headline.css">
<link rel="stylesheet" href="resources/css/magnific-popup.css">
<link rel="stylesheet" href="resources/css/fontawesome-all.min.css">
<link rel="stylesheet" href="resources/css/themify-icons.css">
<link rel="stylesheet" href="resources/css/slick.css">
<link rel="stylesheet" href="resources/css/nice-select.css">
<link rel="stylesheet" href="resources/css/style.css">

<style media="(min-width:512px)">
.hideDesk{display:none;}
</style>
</head>
<body>

   <!-- ? Preloader Start -->
   <div id="preloader-active">
      <div
         class="preloader d-flex align-items-center justify-content-center">
         <div class="preloader-inner position-relative">
            <div class="preloader-circle"></div>
            <div class="preloader-img pere-text">
               <img src="resources/img/logo/loder.png" alt="">
            </div>
         </div>
      </div>
   </div>
   <!-- Preloader Start -->
   <header>
      <!-- Header Start -->
      <div class="header-area header">
         <div class="main-header header-sticky">
            <div class="container-fluid">
               <div
                  class="menu-wrapper d-flex align-items-center justify-content-between">
                  <!-- Logo -->
                  <div class="logo">
                     <a href="index.jsp"><img src="resources/img/logo/logo.png" style="height: 36px;"
                        alt=""></a>
                  </div>
                  <!-- Main-menu -->
                  <div class="main-menu f-right d-none d-lg-block">
                     <nav>
                        <ul id="navigation">
                           <li><a href="#">최저가 매장 찾기</a>
                              <ul class="submenu">
                                 <li><a href="mapProduct.do">상품별 최저가</a></li>
                                 <li><a href="map.do" id="mapdo">매장별 최저가</a></li> 
                              </ul></li>
                           <li><a href="productList.do">데이터 센터</a>
                              <ul class="submenu">
                                 <li><a href="productList.do">상품 목록</a></li>
                                 <li><a href="price_compare.do">상품 가격 비교</a></li>
                                 <li><a href="shopList.do">전국 매장 정보</a></li>
                              </ul></li>
                           <li><a href="#">커뮤니티</a>
                              <ul class="submenu">
                                 <li><a href="board.do">자유 게시판</a></li>
                                 <li><a href="newsBoard.do">뉴스 / Hot issue</a></li>
                                 <li><a href="chat.do">실시간 채팅</a></li>
                                 <li><a href="qna_board.do">Q/A</a></li>
                              </ul></li>
                          <!--  <li><a href="myPage.do">마이페이지</a>
                              <ul class="submenu">
                                 <li><a href="modifyMember.do">회원 정보 수정</a></li>
                                 <li><a href="showBoard.do">등록글 조회</a></li>
                                 <li><a href="showReply.do">등록댓글 조회</a></li>
                                 <li><a href="elements.html">관심물품 조회</a></li>
                              </ul></li> -->
                           <li><a href="error.do">Contact</a></li>
                           
                           <li class="hideDesk">
                           <c:if test="${sessionScope.userId != null && sessionScope.memberLv == 1}">
                           <a href="myPage.do" class="mr-40"><i class="ti-user"></i>${sessionScope.memberName } 님</a>
                           <a href="logout.do" class="mr-40"><i class="ti-shift-right"></i>로그아웃</a>   
                           <a href="wishList.do" class="btn">관심 물품</a>
                           
                           </c:if>
                           </li>
                           
                           <li class="hideDesk">
                           <c:if test="${sessionScope.userId == null }">
                           <a href="loginPage.do" class="mr-40"><i class="ti-user"></i>로그인</a>
                           </c:if>
                           </li>
                           
                           <%-- <li class="hideDesk">
                           <c:if test="${sessionScope.userId != null }">
                              <a href="logout.do" class="mr-40"><i class="ti-shift-right"></i>로그아웃</a>   
                              </c:if>
                           </li> --%>
                           
                           
                        </ul>
                     </nav>
                  </div>
                  <!-- Header-btn -->
                  <div class="header-btns d-none d-lg-block f-right">
                           <c:choose> 
                        <c:when test="${sessionScope.userId == null }"> <!-- 로그인 세션이 없을 때 (비 회원) -->
                           <a href="loginPage.do" class="mr-40"><i class="ti-user"></i></a>
                                  <a href="wishList.do" class="btn">관심 물품</a>
                        </c:when>
                      
                        <c:when test="${sessionScope.userId != null && sessionScope.memberLv == 1}"> <!-- 회원 세션이 있으면서 일반 회원인 경우 -->
                           <a href="myPage.do" class="mr-40"><i class="ti-user"></i>${sessionScope.memberName } 님</a>
                           <a href="logout.do" class="mr-40"><i class="ti-shift-right"></i>로그아웃</a>   
                           <a href="wishList.do" class="btn">관심 물품</a>
                        </c:when>
                     
                        <c:when test="${sessionScope.userId != null && sessionScope.memberLv == 9 }"> <!-- 회원 세션이 있으면서 관리자인 경우  -->
                           <a href="adminMemberList.do" class="mr-40"><i class="ti-crown"></i>${sessionScope.memberName } 님</a>
                           <a href="logout.do" class="mr-40"><i class="ti-shift-right"></i>로그아웃</a>   
                           <a href="wishList.do" class="btn">관심 물품</a>
                        </c:when>
                        
                     </c:choose>
                     
                        </div>
                        
                  <!-- Mobile Menu -->
                  <div class="col-12">
                     <div class="mobile_menu d-block d-lg-none">
                     
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <!-- Header End -->
   </header>


   <!-- JS here -->

   <script src="./resources/js/vendor/modernizr-3.5.0.min.js"></script>
   <!-- Jquery, Popper, Bootstrap -->
   <script src="./resources/js/vendor/jquery-1.12.4.min.js"></script>
   <script src="./resources/js/popper.min.js"></script>
   <script src="./resources/js/bootstrap.min.js"></script>
   <!-- Jquery Mobile Menu -->
   <script src="./resources/js/jquery.slicknav.min.js"></script>

   <!-- Jquery Slick , Owl-Carousel Plugins -->
   <script src="./resources/js/owl.carousel.min.js"></script>
   <script src="./resources/js/slick.min.js"></script>
   <!-- One Page, Animated-HeadLin -->
   <script src="./resources/js/wow.min.js"></script>
   <script src="./resources/js/animated.headline.js"></script>
   <script src="./resources/js/jquery.magnific-popup.js"></script>

   <!-- Date Picker -->
   <script src="./resources/js/gijgo.min.js"></script>
   <!-- Nice-select, sticky -->
   <script src="./resources/js/jquery.nice-select.min.js"></script>
   <script src="./resources/js/jquery.sticky.js"></script>
   <!-- Progress -->
   <script src="./resources/js/jquery.barfiller.js"></script>

   <!-- counter , waypoint,Hover Direction -->
   <script src="./resources/js/jquery.counterup.min.js"></script>
   <script src="./resources/js/waypoints.min.js"></script>
   <script src="./resources/js/jquery.countdown.min.js"></script>
   <script src="./resources/js/hover-direction-snake.min.js"></script>

   <!-- contact js -->
   <script src="./resources/js/contact.js"></script>
   <script src="./resources/js/jquery.form.js"></script>
   <script src="./resources/js/jquery.validate.min.js"></script>
   <script src="./resources/js/mail-script.js"></script>
   <script src="./resources/js/jquery.ajaxchimp.min.js"></script>

   <!-- Jquery Plugins, main Jquery -->
   <script src="./resources/js/plugins.js"></script>
   <script src="./resources/js/main.js"></script>
   <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f8a16e73608a4a6a4fe93cd542e3eb76&libraries=services"></script>
   <script src="./resources/js/map.js"></script>
   	<script src="./resources/js/wish.js"></script>
   
<!-- S: Google FireBase & Analytics -->
   <script type="module">
  // Import the functions you need from the SDKs you need
  import { initializeApp } from "https://www.gstatic.com/firebasejs/9.0.2/firebase-app.js";
  import { getAnalytics } from "https://www.gstatic.com/firebasejs/9.0.2/firebase-analytics.js";
  // TODO: Add SDKs for Firebase products that you want to use
  // https://firebase.google.com/docs/web/setup#available-libraries

  // Your web app's Firebase configuration
  // For Firebase JS SDK v7.20.0 and later, measurementId is optional
  const firebaseConfig = {
    apiKey: "AIzaSyDzY2mBhNbIggaoDccNblTUQodHLRWVOUE",
    authDomain: "cmis-430ec.firebaseapp.com",
    projectId: "cmis-430ec",
    storageBucket: "cmis-430ec.appspot.com",
    messagingSenderId: "636226969812",
    appId: "1:636226969812:web:608e8311e0ff2754781b41",
    measurementId: "G-BFS844XTQ1"
  };
 
  // Initialize Firebase
  const app = initializeApp(firebaseConfig);
  const analytics = getAnalytics(app);
</script>
<!-- E: Google FireBase & Analytics -->


<!-- Google Tag Manager -->
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-N9JKC4D');</script>
<!-- End Google Tag Manager -->
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-BFS844XTQ1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-BFS844XTQ1');
</script>

</body>
</html>