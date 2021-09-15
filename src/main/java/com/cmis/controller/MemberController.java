package com.cmis.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cmis.domain.MemberVO;
import com.cmis.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	// 로그인/회원가입 페이지
	@RequestMapping("{url}.do")
	public String viewPage(@PathVariable String url) {
		return "/"+url;
	}
	
	// 회원가입 작동
	@RequestMapping("signUpDo.do")
	public String signUpDo(HttpServletRequest httpServletRequest, MemberVO vo) {
		System.out.println("회원가입 작동 호출");
		vo.setMember_sns("test");
		vo.setMember_lv(Integer.parseInt("1"));
//		System.out.println(vo.getMember_address());
//		System.out.println(vo.getMember_age());
//		System.out.println(vo.getMember_lv());
//		System.out.println(vo.getMember_name());
//		System.out.println(vo.getMember_phone());
//		System.out.println(vo.getMember_pw());
//		System.out.println(vo.getMember_sex());
//		System.out.println(vo.getMember_sns());
//		System.out.println(vo.getUser_id());
		memberService.userReg(vo);
		
		return "redirect:/test.do";
	}
	
	// 로그인 작동
	@RequestMapping("login.do")
	public String userLogin(MemberVO vo, HttpSession session) {
		System.out.println("로그인 작동 호출");
		
		MemberVO result = memberService.userLogin(vo);
		
		if(result != null && vo.getUser_id().equals(result.getUser_id()) && vo.getMember_pw().equals(result.getMember_pw())) {
			session.setAttribute("userId", result.getUser_id());
			session.setAttribute("memberName", result.getMember_name());
			session.setAttribute("loginTime", new Date());
			
			return "redirect:/test.do";
		}else {
			return "redirect:/loginPage.do";
		}	 
	}
	
	// 로그아웃 작동
	   @RequestMapping("logout.do")
	   public String logout(HttpSession session) {
	      session.invalidate();
	      return "redirect:/test.do";
	   }
}
