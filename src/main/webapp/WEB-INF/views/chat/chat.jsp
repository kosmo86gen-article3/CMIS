<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>C-MIS 채팅</title>
<link rel="shortcut icon" href="resources/img/favicon.png"
	type="image/png">
<link rel="icon" href="resources/img/favicon.png" type="image/png">
<link rel="stylesheet" href="resources/css/websocket-chat.css">
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
		<style type="text/css">



/* 21-10-07 문경식 */
.comments-area {
	background: #b2c7d9 !important;
	border-top: 1px solid #eee !important;
	padding: 20px 0 !important;
	margin-top: 30px !important;
	height: 500px !important;
	border-top-left-radius: 5px !important;
	border-top-right-radius: 5px !important;
	box-shadow: 0px 1px 10px 5px rgb(16 15 15/ 12%) !important;
}

/* 21-10-07 문경식 */
.comments-area .comment-list {
	padding-bottom: 10px !important;
	border-radius: 10px !important;
	margin-top: 5px !important;
}

/* 21-10-07 문경식 */
.comments-area .date {
	font-size: 14px;
	color: black;
	margin-bottom: 0;
	margin-left: 20px
}

/* 21-10-07 문경식 */
.comments-area .comment {
	margin-left: 5px;
	margin-bottom: 10px;
	color: black;
	font-size: 18px
}

/* 21-10-07 문경식 */
.sample-text-area {
	background: #fff;
	padding: 0 0 70px 0
}
</style>
		<!-- E: 헤더 부분 끝 -->


		<main>
			<div
				class="position-relative overflow-hidden p-3 p-md-5 m-md-3 text-center bg-light"
				style="margin-bottom: 50px !important; height: 220px; background: #494343 !important">
				<div class="col-md-5 p-lg-5 mx-auto my-5">
					<h1 class="display-4 font-weight-normal" style="color: white">실시간
						채팅</h1>
					<p class="lead font-weight-normal" style="color: white">회원이
						아니어도 가능합니다.</p>
				</div>
				<div class="product-device shadow-sm d-none d-md-block"></div>
				<div
					class="product-device product-device-2 shadow-sm d-none d-md-block"></div>
			</div>

			<div class="whole-wrap">
				<div class="container box_1170"
					style="max-width: 1000px !important;">

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
						style="display: block; overflow-x: hidden;"></div>
				</div>
			</div>

			<section class="sample-text-area" id="chat-tools-div">
				<div class="container box_1170"
					style="max-width: 1000px !important;">
					<textarea class="single-textarea" placeholder="메시지를 입력하세요"
						onfocus="this.placeholder = ''"
						onblur="this.placeholder = '메시지를 입력하세요'" id="messageInput"
						style="box-shadow: 0px 2px 10px 5px rgb(16 15 15/ 38%);"></textarea>
					<div class="mt-25 d-flex flex-row">
						<button type="button" id="chat-submit-btn"
							class="genric-btn primary-border radius mr-40" onclick="send();">입력</button>
						<button type="button" id="chat-reset-btn"
							class="genric-btn success-border radius"
							onclick="javascript:clearText();">대화내용 지우기</button>
						<div class="ml-auto">
							<button type="button" id="chat-quit-btn"
								class="genric-btn info-border radius" onclick="closeSocket();">나가기</button>
						</div>
					</div>
				</div>
			</section>

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