<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>showBoard</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script type="text/javascript">
	$(function() {
		$('#navList').hover(function() {
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
				<h1 class="display-1" style="text-align: center;">마이페이지</h1>
				<h2 style="text-align: center;">${sessionScope.memberName}님
					안녕하세요</h2>
				<hr />

				<div class="container" style="margin-top: 30px">
					<div class="row">
						<div class="col-sm-4">
							<h3 style="text-align:center">Menu</h3>
							<ul class="nav nav-pills flex-column">
								<li class="nav-item"><a class="nav-link active" id="navList"
									href="modifyMember.do">회원 정보 수정</a></li>
								<li class="nav-item"><a class="nav-link active" id="navList" href="showBoard.do">등록글
										조회</a></li>
								<li class="nav-item"><a class="nav-link active" id="navList" href="showReply.do">등록 댓글 보기</a>
								</li>
								<li class="nav-item"><a class="nav-link active" id="navList" href="wishList.do">관심 물품</a>
								</li>
							</ul>
							<hr class="d-sm-none">
						</div>
						<div class="col-sm-8">
							<h2>등록글 조회</h2>
							<h5>Title description, Dec 7, 2017</h5>
							<div class="fakeimg">Fake Image</div>
							<p>Some text..</p>
							<p>Sunt in culpa qui officia deserunt mollit anim id est
								laborum consectetur adipiscing elit, sed do eiusmod tempor
								incididunt ut labore et dolore magna aliqua. Ut enim ad minim
								veniam, quis nostrud exercitation ullamco.</p>
							<br>
							<h2>TITLE HEADING</h2>
							<h5>Title description, Sep 2, 2017</h5>
							<div class="fakeimg">Fake Image</div>
							<p>Some text..</p>
							<p>Sunt in culpa qui officia deserunt mollit anim id est
								laborum consectetur adipiscing elit, sed do eiusmod tempor
								incididunt ut labore et dolore magna aliqua. Ut enim ad minim
								veniam, quis nostrud exercitation ullamco.</p>
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
	</div>
	<!-- E: Index(Home).jsp 의 div 총괄 끝  -->
</body>
</html>