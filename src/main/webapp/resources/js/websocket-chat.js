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
		send2();
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
		
		setInterval(function(){
			location.reload();
		}, 2300)
	}
};

function send2(){
	var uid2 = $('#nickname').val();
	var text2 = "님이 입장하셨습니다."+","+uid2;
	ws.send(text2);
	text2="";
};

function send(){
	if($('#messageInput')==null){
		return false;
	}else if($('#messageInput').val().includes('님이 입장하셨습니다.') || $('#messageInput').val().includes('님이 퇴장하셨습니다.')){
		alert("'님이 입장하셨습니다.'와 '님이 퇴장하셨습니다.'는 쓸 수 없습니다");
		$('#messageInput').val("");
		return false;
	}
	var uid = $('#nickname').val();
	var text = document.getElementById("messageInput").value+","+uid;
	ws.send(text);
	text="";
	$('#messageInput').val("");
};

function closeSocket(){
	var uid3 = $('#nickname').val();
	var text3 = "님이 퇴장하셨습니다."+","+uid3;
	ws.send(text3);
	text3="";
	ws.close();
};

function writeResponse(text){
	// 내가 보낸 메시지, 상대방 보낸 메시지 구분하기 위한 준비
	let sessionid = null;
	let message = null;
	
	// 문자열 split
	let messagesAll = text.split(',');
	
	sessionid = messagesAll[3];
	
	/* alert(sessionid);
	alert(messagesAll[0]); */
	
	if(sessionid == undefined && messagesAll[1].includes('님이 입장하셨습니다.') == false && messagesAll[1].includes('님이 퇴장하셨습니다.') == false) {
		var printHTML = '<div class="comment-list">';
		printHTML += '<div class="single-comment justify-content-between d-flex">';
		printHTML += '<div class="user justify-content-between d-flex">';
		printHTML += '<div class="desc">';
		printHTML += '<p class="comment">'+messagesAll[1]+'</p>';
		printHTML += '<div class="d-flex justify-content-between">';
		printHTML += '<div class="d-flex align-items-center">';
		printHTML += '<h5>';
		printHTML += '<a>'+messagesAll[0]+'</a>';
		printHTML += '</h5>';
		printHTML += '<p class="date">'+messagesAll[2]+'</p>';
		printHTML += '</div> ';
		printHTML += '</div> ';
		printHTML += '</div> ';
		printHTML += '</div> ';
		printHTML += '</div> ';
		printHTML += '</div> ';
		
		$('#chat-comments-area').append(printHTML);
	} else if(sessionid !== undefined && messagesAll[1].includes('님이 입장하셨습니다.') == false && messagesAll[1].includes('님이 퇴장하셨습니다.') == false) {
		var printHTML = '<div class="comment-list" style="background-color: #8080804a;">';
		printHTML += '<div class="single-comment justify-content-end d-flex">';
		printHTML += '<div class="user justify-content-between d-flex">';
		printHTML += '<div class="desc">';
		printHTML += '<p class="comment" style="text-align: right;">'+messagesAll[1]+'</p>';
		printHTML += '<div class="d-flex justify-content-end">';
		printHTML += '<div class="d-flex align-items-center">';
		printHTML += '<h5>';
		printHTML += '<a>'+messagesAll[0]+'</a>';
		printHTML += '</h5>';
		printHTML += '<p class="date">'+messagesAll[2]+'</p>';
		printHTML += '</div> ';
		printHTML += '</div> ';
		printHTML += '</div> ';
		printHTML += '</div> ';
		printHTML += '</div> ';
		printHTML += '</div> ';
		
		$('#chat-comments-area').append(printHTML);
	} else if(messagesAll[1].includes('님이 입장하셨습니다.') == true){
		var printHTML = '<div class="comment-list">';
		printHTML += '<div class="single-comment justify-content-between d-flex">';
		printHTML += '<div class="user justify-content-between d-flex">';
		printHTML += '<div class="desc">';
		printHTML += '<p class="comment">'+messagesAll[0]+messagesAll[1]+'</p>';
		printHTML += '</div> ';
		printHTML += '</div> ';
		printHTML += '</div> ';
		printHTML += '</div> ';
		
		$('#chat-comments-area').append(printHTML);
	} else if(messagesAll[1].includes('님이 퇴장하셨습니다.') == true){
		var printHTML = '<div class="comment-list">';
		printHTML += '<div class="single-comment justify-content-between d-flex">';
		printHTML += '<div class="user justify-content-between d-flex">';
		printHTML += '<div class="desc">';
		printHTML += '<p class="comment">'+messagesAll[0]+messagesAll[1]+'</p>';
		printHTML += '</div> ';
		printHTML += '</div> ';
		printHTML += '</div> ';
		printHTML += '</div> ';
		
		$('#chat-comments-area').append(printHTML);
	}
};

function clearText(){
	$('#chat-comments-area').empty();
};

$(function(){
	$('#chat-comments-area').css({"display": "none"});
	$('#chat-tools-div').css({"display": "none"});
	
	// 닉네임 전달 시작
	$('#chatNickNameBtn').click(nickNameGo);
	function nickNameGo() {
			$('.comment-form').css({"display": "none"});
			$('#chat-comments-area').css({"display": "block"});
			$('#chat-tools-div').css({"display": "block"});
	};
	// 닉네임 전달 끝
});