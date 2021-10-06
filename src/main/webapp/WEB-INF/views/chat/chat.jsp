<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
<title>테스트</title>

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
        <div class="slider-area2">
            <div class="slider-height3  hero-overly hero-bg4 d-flex align-items-center">
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
				<div class="comment-form">
					<h4>닉네임 입력</h4>
					<div class="row">
						<div class="col-sm-6">
							<div class="form-group">
								<input class="form-control" name="nickname" id="nickname" type="text" placeholder="닉네임을 입력하세요.(3~5글자 한글/영문)">
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
						<button type="button" class="button button-contactForm btn_1 boxed-btn" id="chatNickNameBtn" onclick="openSocket();">채팅하기</button>
                    </div>
                 </div>
				<div class="comments-area" id="chat-comments-area" style="background-color: #acb3db3b;">
                </div>
			</div>
		</div>
		<!-- End Align Area -->
		
		<!--? Start Sample Area -->
		<section class="sample-text-area" id="chat-tools-div">
			<div class="container box_1170">
				<div>
					<textarea class="single-textarea" placeholder="Message" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Message'" id="messageInput" required></textarea>
					<button type="button" class="genric-btn primary-border radius" onclick="send();">입력</a>
                    <button type="button" class="genric-btn primary-border small" onclick="javascript:clearText();">대화내용 지우기</a>
				    <button type="button" class="genric-btn primary-border small" onclick="closeSocket();">나가기</a>
				</div>
			</div>
		</section>
		<!-- End Sample Area -->
		
</main>
    
<script type="text/javascript">
var ws;
var messages = document.getElementById("chatMessages");

function openSocket() {
	if(ws !== undefined && ws.readState !== WebSocket.CLOSED) {
		writeResopnse("WebSocket is alreay opened");
		return;
	}
	// 웹소켓 객체 만드는 코드
	ws = new WebSocket("ws://localhost:8082/zFinalProject/echo.do");
	
	ws.onopen = function(event){
		if(event.data === undefined){
			return;
		}
		writeResponse(event.data);
	};
	
	ws.onmessage = function(event){
		console.log('writeResponse');
		console.log(event.data)
		writeResponse(event.data);
	};
	
	ws.onclose = function(event){
		$('#chat-comments-area').append("대화종료");
	}
};

function send(){
	// var uid = "${sessionScope.chatNick}";
	var uid = $('#nickname').val();
	
	var text = document.getElementById("messageInput").value+","+uid;
	ws.send(text);
	text="";
	$('#messageInput').val("");
};

function closeSocket(){
	ws.close();
};

function writeResponse(text){
	// 내가 보낸 메시지, 상대방 보낸 메시지 구분하기 위한 준비
	let sessionid = null;
	let message = null;
	
	// 문자열 split
	let messagesAll = text.split(',');
	
	sessionid = messagesAll[3];
	
	alert(sessionid);
	
	if(sessionid == undefined) {
		var printHTML = '<div class="comment-list">';
		printHTML += '<div class="single-comment justify-content-between d-flex">';
		printHTML += '<div class="user justify-content-between d-flex">';
		printHTML += '<div class="desc">';
		printHTML += '<p class="comment">'+messagesAll[1]+'</p>';
		printHTML += '<div class="d-flex justify-content-between">';
		printHTML += '<div class="d-flex align-items-center">';
		printHTML += '<h5>';
		printHTML += '<a href="#">'+messagesAll[0]+'</a>';
		printHTML += '</h5>';
		printHTML += '<p class="date">'+messagesAll[2]+'</p>';
		printHTML += '</div> ';
		printHTML += '</div> ';
		printHTML += '</div> ';
		printHTML += '</div> ';
		printHTML += '</div> ';
		printHTML += '</div> ';
		
		$('#chat-comments-area').append(printHTML);
	} else {
		var printHTML = '<div class="comment-list" style="background-color: #8080804a;">';
		printHTML += '<div class="single-comment justify-content-end d-flex">';
		printHTML += '<div class="user justify-content-between d-flex">';
		printHTML += '<div class="desc">';
		printHTML += '<p class="comment" style="text-align: right;">'+messagesAll[1]+'</p>';
		printHTML += '<div class="d-flex justify-content-end">';
		printHTML += '<div class="d-flex align-items-center">';
		printHTML += '<h5>';
		printHTML += '<a href="#">'+messagesAll[0]+'</a>';
		printHTML += '</h5>';
		printHTML += '<p class="date">'+messagesAll[2]+'</p>';
		printHTML += '</div> ';
		printHTML += '</div> ';
		printHTML += '</div> ';
		printHTML += '</div> ';
		printHTML += '</div> ';
		printHTML += '</div> ';
		
		$('#chat-comments-area').append(printHTML);
	}
};

function clearText(){
	/* message.parentNode.removeChild(messages); */
	$('#chat-comments-area').empty();
};

$(function(){
	$('#chat-comments-area').css({"display": "none"});
	$('#chat-tools-div').css({"display": "none"});
	
	// 닉네임 전달 시작
	$('#chatNickNameBtn').click(nickNameGo);
	function nickNameGo() {
	  // $.ajax({
		// url:"chatNickNameDo.do", 
		// type: "post", 
		// contentType: "application/x-www-form-urlencoded;charset=UTF-8", 
		// data: {nickName:$('#nickname').val()}, 
		// success: function(){
			$('.comment-form').css({"display": "none"});
			$('#chat-comments-area').css({"display": "block"});
			$('#chat-tools-div').css({"display": "block"});
		// }, 
		// error: function(request, status, error) {
			// alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		// }
	  // }) // 닉네임 전달 끝
	};
});
</script>
    
<!-- S: 푸터 영역 시작 -->
<footer id = "footer">
	<div id = "footer_box">
		<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
	</div>
</footer>

</div> 
<!-- E: Index(Home).jsp 의 div 총괄 끝  -->

</body>
</html>