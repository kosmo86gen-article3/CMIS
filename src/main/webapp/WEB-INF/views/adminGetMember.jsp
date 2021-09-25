<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>adminGetMember</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script type="text/javascript">
	$(function() {
		$('.nav-link active').hover(function() {
			$(this).css("color", "gray");
		}, function() {
			$(this).css("color", "white");
		});
	})
</script>
<style type="text/css">
@import
	url(https://fonts.googleapis.com/css?family=Raleway:300,400,500,600,800)
	;

body {
	font-size: 16px;
	line-height: 22px;
	color: #555;
	font-family: 'Raleway', sans-serif;
	font-weight: 300;
	text-shadow: rgba(0, 0, 0, .01) 0 0 1px;
}

#myPageAtag {
	color: black;
	font-size: 150%;
	display: flex;
}

#navList{
	margin-bottom : 10px;
	background-color : #050d15;
}


</style>


</head>
<body>
	<div id="root">
		<!-- S: Index(Home).jsp 의 div 총괄 시작 -->
		<!-- S: 헤더 부분 시작 -->
		<header id="header">
			<div id="header_box">
				<jsp:include page="/WEB-INF/views/include/header.jsp" />
			</div>
		</header>
		<!-- E: 헤더 부분 끝 -->


		<!-- S: 본문 영역 시작 -->
		<section id="section-feature" class="container">
			<div id="container">
				<h1 class="display-1" style="text-align: center;">관리자 페이지</h1>
				<h2 style="text-align: center;">${sessionScope.memberName}님
					안녕하세요</h2>
				<hr />

				<div class="container" style="margin-top: 30px">
					<div class="row">
						<div class="col-sm-4">
							<h3 style="text-align:center">Menu</h3>
							<ul class="nav nav-pills flex-column">
								<li class="nav-item"><a class="nav-link active" id="navList"
									href="adminMemberList.do">회원 목록</a></li>
								<li class="nav-item"><a class="nav-link active" id="navList" href="showBoard.do">전체 글 목록
										조회</a></li>
								<li class="nav-item"><a class="nav-link active" id="navList" href="showReply.do">전체 댓글 목록</a>
								</li>
								<li class="nav-item"><a class="nav-link active" id="navList" href="wishList.do">관심 물품</a>
								</li>
							</ul>
							<hr class="d-sm-none">
						</div>
						<div class="col-sm-8">
							<div id="container_box">
				<!-- S :회원 수정 폼  -->
				<div class="InputArea" id="memberUpdateform" style="margin: auto;">
					<form method="post" action="adminMemberUpdate.do">
						<input name ="user_id" class="hidden" type="hidden" value="${member.user_id }"/>
						<div class = "inputArea">
							<label for ="user_id">회원 ID</label>
							<label>${member.user_id }</label>
						</div>
						<div class = "inputArea">
							<label for ="member_name">회원 이름 </label>
							<input type="text" id="member_name" name="member_name"
							value = "${member.member_name }"/>
						</div>
						<div class = "inputArea">
							<label for ="member_age">회원 나이</label>
							<input type="text" id="member_age" name="member_age"
							value = "${member.member_age }"/>
						</div>
						<div class = "inputArea">
							<label for ="member_phone">회원 연락처</label>
							<input type="text" id="member_phone" name="member_phone"
							value = "${member.member_phone }"/>
						</div>
						<div class = "inputArea">
							<label for ="regdate">회원 가입일</label>
							<label>${member.regdate }</label>
						</div>	
							<input type="submit"class="btn btn-warning" value="수정">
							
					</form>
					<!-- E :회원 수정 폼 -->
				</div>
				</div>
							
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- E :본문 목록  -->

		<!-- E: 본문 영역 끝 -->

		<!-- S: 푸터 영역 시작 -->
		<footer id="footer">
			<div id="footer_box">
				<jsp:include page="/WEB-INF/views/include/footer.jsp" />
			</div>
		</footer>
		
		<!-- S: 파이어 베이스 스크립트 -->

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
</script>;

<!--  E : 파이어 베이스 스크립트 -->
		
		
		
		
	</div>
	<!-- E: Index(Home).jsp 의 div 총괄 끝  -->
</body>
</html>