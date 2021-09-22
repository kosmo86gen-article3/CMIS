package com.cmis.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cmis.domain.MemberVO;
import com.cmis.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;

	// 로그인/회원가입 페이지
	@RequestMapping("{url}.do")
	public String viewPage(@PathVariable String url) {
		return "/" + url;
	}

	// 회원가입 요청이 들어왔을 때
	@RequestMapping("signUpDo.do")
	public String signUpDo(HttpServletRequest httpServletRequest, MemberVO vo) {
		System.out.println("회원가입 작동 호출");
		vo.setMember_sns("test");
		vo.setMember_lv(Integer.parseInt("1"));
		memberService.userReg(vo);

		return "redirect:/test.do";
	}

	// 회원가입 아이디 중복 체크
		@ResponseBody
		@RequestMapping(value="idCheck.do",produces="application/text;charset=UTF-8",method=RequestMethod.POST) 
		public String idCheck(MemberVO vo) {
			MemberVO result = memberService.idCheck_join(vo);
			System.out.println(result);
			String message = "사용가능한 아이디입니다";
			if(result != null) {
				message = "이미 사용중인 아이디입니다";
			}
			return message;
		}

	// 로그인 요청이 들어왔을 때
	@RequestMapping("login.do")
	public String userLogin(MemberVO vo, HttpSession session) {
		System.out.println("로그인 작동 호출");

		MemberVO result = memberService.userLogin(vo);

		// 만약 가져온 result 값이 null 이거나 id값이 없거나 그 아이디 값이 result에 있는 값과 같지 않거나 Password값이
		// TRUE!!! 이면 if문 안의 구문 실행
		// TRUE이면 성공했으며 return이 마지막으로 실행되어 test.do로 리다이렉트
		if (result != null && vo.getUser_id().equals(result.getUser_id())
				&& vo.getMember_pw().equals(result.getMember_pw())) {

			// 로그인 시 session에 set, "userID" key값에 MemberVO result.getUser_id 값을 (즉 로그인 한 회원
			// 아이디 값)
			// 이하 로그인시 session에 setAttribute로 key, value 값 부여, value는 MemberVO 변수 명 result !
			// MemberVO 값을 mapper select문에 맞게 가져오는 DAO와 Service 클래스가 만들어져 있음

			session.setAttribute("member", result);
			session.setAttribute("userId", result.getUser_id());
			session.setAttribute("memberName", result.getMember_name());
			session.setAttribute("memberLv", result.getMember_lv());
			session.setAttribute("loginTime", new Date());

			return "redirect:/test.do";
		} else {
			return "redirect:/loginPage.do";
		}
	}

	// 로그아웃 작동
	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/test.do";
	}

	/*
	 * My PAGE
	 */

//	// Mypage(회원 수정, 주문내역 보기 전 사이트)
//	@RequestMapping("myPage.do")
//	public String preHandle(MemberVO vo, HttpServletRequest req, HttpServletResponse res) throws Exception {
//		// myPage - > 회원만 접근 가능하게 세션관리, 세션 없으면 로그인 화면으로 리턴
//		HttpSession session = req.getSession();
//		MemberVO result = (MemberVO) session.getAttribute("member");
//		System.out.println(result);
//		if (result == null) { //result session값이 null이면 index page로 리턴
//			return "loginPage";
//		} else {
//			return "myPage"; //아니면 myPage 접근
//		}
//
//	}
	@RequestMapping("myPage.do")
	public String myPage(HttpSession session) {
		// 세션 IF문 으로 세션 보안 처리
		if (session.getAttribute("userId") == null) {
			return "loginPage";
		} else {
			return "myPage";
		}

	}

	// 회원 정보 수정 페이지 회원 정보 출력
	@RequestMapping("modifyMember.do")
	public String memberModify(HttpSession session, Model model)throws Exception {
		
		// 세션 IF문 으로 세션 보안 처리
		if (session.getAttribute("userId") == null) {
			return "loginPage";
		} else {
			//세션 객체 안에 있는 ID정보 저장
			String user_id = (String) session.getAttribute("userId");
			System.out.println("컨트롤러 ID 값 : " + user_id);
			
			//서비스안의 회원정보보기 메서드 호출
			MemberVO vo = memberService.getMember(user_id);
			
			//정보 저장 후  페이지 이동
			model.addAttribute("member", vo);
			return "modifyMember";
			
		}

	}
	
	
	  //회원 정보 수정 updateMember.do 요청이 들어왔을 때
	  @RequestMapping("updateMember.do") 
	  public String updateMember(HttpSession session, MemberVO vo) throws Exception{
	  memberService.updateMember(vo);
	  return "myPage"; 
	  
	  }
	 
	
	
	

	// 등록 글 보기
	@RequestMapping("showBoard.do")
	public String showBoard(HttpSession session) {
		// 세션 IF문 으로 세션 보안 처리
		if (session.getAttribute("userId") == null) {
			return "loginPage";
		} else {
			return "showBoard";
		}

	}

	// 등록 댓글 보기
	@RequestMapping("showReply.do")
	public String showReply(HttpSession session) {
		// 세션 IF문 으로 세션 보안 처리
		if (session.getAttribute("userId") == null) {
			return "loginPage";
		} else {
			return "showReply";
		}

	}

}
