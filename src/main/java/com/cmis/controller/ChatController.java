package com.cmis.controller;

import java.io.IOException;
//import java.io.PrintWriter;
//import java.util.HashSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChatController {
	
//	private static final HashSet<String> ipList = new HashSet<String>();
	
	// 채팅(게시판) 불러오기
	@RequestMapping("chat")
	public String chat(HttpServletRequest request, HttpServletResponse response) throws IOException {
//		String ip = getRemoteIP(request);
		
//		System.out.println(ip);
		
//		if(!ipList.contains(ip)) {
//			ipList.add(ip);
//			return "/chat/chat";
//		} else if(ipList.contains(ip)) {
//			response.setContentType("text/html; charset=UTF-8");
//	         PrintWriter out = response.getWriter();
//	         out.println("<script>alert('ip 중복 방지'); </script>");
//	         out.flush();
//			return "/member/login";
//		}
		
		return "/chat/chat";
	}
	
//	private String getRemoteIP(HttpServletRequest request){
//        String ip = request.getHeader("X-FORWARDED-FOR"); 
//        
//        //proxy 환경일 경우
//        if (ip == null || ip.length() == 0) {
//            ip = request.getHeader("Proxy-Client-IP");
//        }
//
//        //웹로직 서버일 경우
//        if (ip == null || ip.length() == 0) {
//            ip = request.getHeader("WL-Proxy-Client-IP");
//        }
//
//        if (ip == null || ip.length() == 0) {
//            ip = request.getRemoteAddr() ;
//        }
//        
//        return ip;
//   }
	
}
