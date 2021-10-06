package com.cmis.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.RemoteEndpoint.Basic;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;

@Controller
@ServerEndpoint(value="/echo.do")
public class WebSocketChat {
	
	private String nowFormat = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy년 MM월 dd일 HH시 mm분"));
	
	// 사용자들 세션 담기 위한 변수 선언
	private static final List<Session> sessionList = new ArrayList<Session>();
	//  사용자들 IP 담기 위한 변수 선언
	private static final Logger logger = LoggerFactory.getLogger(WebSocketChat.class);
	public WebSocketChat() {
		System.out.println("웹소켓(서버) 객체 생성");
	}
	
	@OnOpen
	public void onOpen(Session session) {
		logger.info("Open session id : "+session.getId());
		
		try {
			final Basic basic = session.getBasicRemote();
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		sessionList.add(session);
		// 사용자 입장 메시지 보내야함 ***************************************
	}
	
	// 모든 사용자들에게 메세지 전달함
	// @param self
	// @param sender
	// @param message
	private void sendAllSessionToMessage(Session self, String sender, String message) {
		try {
			for(Session session : WebSocketChat.sessionList) {
				if(!self.getId().equals(session.getId())) {
					session.getBasicRemote().sendText(sender+","+message+","+nowFormat);
				}
			}
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	// 내가 입력하는 메세지
	// @param message
	// @param session
	@OnMessage
	public void onMessage(String message, Session session) {
		String sender = message.split(",")[1];
		message = message.split(",")[0];
		
		logger.info("Message From "+sender+" : "+message);
		try {
			final Basic basic = session.getBasicRemote();
			basic.sendText(sender+","+message+","+nowFormat+","+session.getId());
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		sendAllSessionToMessage(session, sender, message);
	}
	
	@OnError
	public void onError(Throwable e, Session session) {
		System.out.println("에러 발생");
	}
	
	@OnClose
	public void onClose(Session session) {
		logger.info("Session "+session.getId()+" has ended");
		sessionList.remove(session);
	}
}
