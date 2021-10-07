<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<link rel="shortcut icon" href="resources/img/favicon.png"
	type="image/png">
<link rel="icon" href="resources/img/favicon.png" type="image/png">
<title>채팅</title>
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

		<main>
			<!--? Hero Start -->
			<div class="slider-area2">
				<div
					class="slider-height3  hero-overly hero-bg4 d-flex align-items-center">
					<div class="container">
						<div class="row">
							<div class="col-xl-12">
								<div class="hero-cap2 pt-20 text-center">
									<h2>채팅 게시판</h2>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!--? Start Align Area -->
			<div class="whole-wrap">
				<div class="container box_1170">

					<div id="connectUserCnt"></div>

					<div class="comment-form">
						<h4>닉네임 입력</h4>
						<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
									<input class="form-control" name="nickname" id="nickname"
										type="text" placeholder="닉네임을 입력하세요.(3~5글자 한글/영문)">
								</div>
							</div>
						</div>
						<div class="form-group">
							<button type="button"
								class="button button-contactForm btn_1 boxed-btn"
								id="chatNickNameBtn" onclick="openSocket();">채팅하기</button>
						</div>
					</div>
					<div class="comments-area" id="chat-comments-area"
						style="background-color: #acb3db3b;"></div>
				</div>
			</div>
			<!-- End Align Area -->

			<!--? Start Sample Area -->
			<section class="sample-text-area" id="chat-tools-div">
				<div class="container box_1170">
					<div>
						<textarea class="single-textarea" placeholder="Message"
							onfocus="this.placeholder = ''"
							onblur="this.placeholder = 'Message'" id="messageInput"></textarea>
						<button type="button" class="genric-btn primary-border radius"
							onclick="send();">입력</button>
						<button type="button" class="genric-btn primary-border small"
							onclick="javascript:clearText();">대화내용 지우기</button>
						<button type="button" class="genric-btn primary-border small"
							onclick="closeSocket();">나가기</button>
					</div>
				</div>
			</section>
			<!-- End Sample Area -->

		</main>

		<script src="./resources/js/websocket-chat.js"></script>

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