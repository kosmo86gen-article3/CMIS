package com.cmis.controller;

import javax.servlet.http.HttpServletRequest;

//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpSession;
//
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ChatController {
	
	// 채팅(게시판) 불러오기
	@RequestMapping("chat")
	public String chat(HttpServletRequest request) {
		String ip = getRemoteIP(request);
		
		System.out.println(ip);
		
		return "/chat/chat";
	}
	
	public static String getRemoteIP(HttpServletRequest request){
        String ip = request.getHeader("X-FORWARDED-FOR"); 
        
        //proxy 환경일 경우
        if (ip == null || ip.length() == 0) {
            ip = request.getHeader("Proxy-Client-IP");
        }

        //웹로직 서버일 경우
        if (ip == null || ip.length() == 0) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }

        if (ip == null || ip.length() == 0) {
            ip = request.getRemoteAddr() ;
        }
        
        System.out.println(ip);
        
        return ip;
   }
	
	// 채팅 로그 얻기 위해 선언
//	private static final Logger logger = LoggerFactory.getLogger(ChatController.class);
//	
//	@ResponseBody
//	@RequestMapping(value="chatNickNameDo.do", produces="application/text;charset=UTF-8", method=RequestMethod.POST)
//	public void chatNickNameDo(@RequestParam String nickName, HttpServletRequest request) {
//		System.out.println("ajax 성공"); 되는거 확인
//		System.out.println(nickName);
//		logger.info("Welcome "+nickName);
//		
//		HttpSession session = request.getSession();
//		session.setAttribute("chatNick", nickName);
//	}
	
}
