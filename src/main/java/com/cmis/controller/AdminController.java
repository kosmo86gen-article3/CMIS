package com.cmis.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cmis.domain.MemberVO;
import com.cmis.service.AdminService;
import com.cmis.service.MemberService;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	
	/*
	 * 
	 * 관리자 페이지 ////////////////////////////////////////////////
	 * 
	 */
	
	@RequestMapping("adminPage.do")
	public String adminPage(HttpSession session, Model model) throws Exception{
				//세션 IF문으로 세션 보안 처리
		String returPage = "";
		if(session.getAttribute("memberLv")!=null) {
			if (session.getAttribute("userId") == null && Integer.parseInt((String) session.getAttribute("memberLv"))== 1)  {
				returPage = "loginPage";
			} else {
				System.out.println("adminPage 세션 통과");
			
				returPage =  "adminPage";
				
			}
		}
		else {
			returPage = "error";
		}
			return returPage;
	}
	
	
	
	//관리자의 회원 목록 페이지 
	@RequestMapping("adminMemberList.do")
	public String memberList(MemberVO vo,Model model, HttpSession session) {
		//관리자 세션 IF문으로 세션 보안 처리
		String returnPage = "";
		if(session.getAttribute("memberLv")!=null) {
			if (session.getAttribute("userId") == null && Integer.parseInt((String) session.getAttribute("memberLv"))== 1)  {
				returnPage = "loginPage";
			} else {
				System.out.println("adminMemberList 세션 통과");
				model.addAttribute("memberList", adminService.getMemberList(vo));
				returnPage =  "adminMemberList";
				
			}
		}
		else {
			returnPage = "error";
		}
			return returnPage;
	}
	
	
	//관리자의 회원 상세 조회
	@RequestMapping("adminGetMember.do")
	public String adminGetMember(MemberVO vo, Model model, HttpSession session) {
		//관리자 세션 IF문으로 세션 보안 처리
		String returnPage = "";
		if(session.getAttribute("memberLv")!=null) {
			if (session.getAttribute("userId") == null && Integer.parseInt((String) session.getAttribute("memberLv"))== 1)  {
				returnPage = "loginPage";
			} else {
				System.out.println("adminGetMember 세션 통과");
				model.addAttribute("member", adminService.getMember(vo));
				returnPage =  "adminGetMember";
			}
		}
		else {
			returnPage = "error";
		}
			return returnPage;
	}
	
	//관리자의 회원 정보 수정
	@RequestMapping("adminMemberUpdate.do")
	public String adminMemberUpdate(@ModelAttribute("member") MemberVO vo, Model model, HttpSession session) {
		//관리자 세션 IF문으로 세션 보안 처리
				String returnPage = "";
				if(session.getAttribute("memberLv")!=null) {
					if (session.getAttribute("userId") == null && Integer.parseInt((String) session.getAttribute("memberLv"))== 1)  {
						returnPage = "loginPage";
					} else {
						System.out.println("adminMemberUpdate 세션 통과");
						adminService.updateMember(vo);
						System.out.println("adminMemberUpdate Service Success");
						returnPage =  "adminMemberList";
					}
				}
				else {
					returnPage = "error";
				}
					return "redirect:adminMemberList.do";		
	}
	
	
	
	
	
	
	

}//end AdminController


	
	
	
	
	
	
	
 

	

