package com.cmis.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import java.util.Date;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cmis.domain.MemberVO;
import com.cmis.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private JavaMailSender mailSender;
	
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
	@RequestMapping(value = "idCheck.do", produces = "application/text;charset=UTF-8", method = RequestMethod.POST)
	public String idCheck(MemberVO vo) {
		MemberVO result = memberService.idCheck_join(vo);
		System.out.println(result);
		String message = "사용가능한 아이디입니다";
		if (result != null) {
			message = "이미 사용중인 아이디입니다";
		}
		return message;
	}
	
	//회원가입 중 이메일 인증 요청
    @RequestMapping(value="mailCheck.do", method=RequestMethod.GET)
    @ResponseBody
    public String mailCheckGET(String email) throws Exception{
        
        /* 뷰(View)로부터 넘어온 데이터 확인 */
       System.out.println("이메일 데이터 전송 확인");
       System.out.println("인증번호 : " + email);
       
       /* 인증번호 난수 생성*/
       Random random = new Random(); // 새로운 Random 객체 생성
       int checkNum = random.nextInt(888888) + 111111;
       System.out.println("인증번호 : " + checkNum);
       
       /* 이메일 보내기*/
       String setFrom = "aysangtest@naver.com"; //root-context.xml에 삽입한 자신의 이메일 계정의 이메일 주소
       String toMail = email; //수신받을 이메일 view 단의 입력받은 이메일 주소 변수 사용
       String title= "회원가입 인증 이메일 입니다.";  //자신이 보낼 이메일 제목
       String content = //자신이 보낼 이메일 내용
    		   "저희 CMIS 홈페이지를 방문해주셔서 감사합니다." +
    		   "<br><br>" + "인증번호는" + checkNum + "입니다."+
    		   "<br>"+
    		   "해당 인증번호를 해당 인증번호란에 기입하여 주세요.";
       
       try {
    	   MimeMessage message = mailSender.createMimeMessage();
    	   MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
    	   helper.setFrom(setFrom);
    	   helper.setTo(toMail);
    	   helper.setSubject(title);
    	   helper.setText(content,true);
    	   mailSender.send(message);
    	   
       }catch(Exception e) {
    	   e.printStackTrace();
       }
       
       //String 타입 변수 num을 선언하고 인증번호(checkNum)을 string으로 형 변환 한 값을 할당합니다.
       String num = Integer.toString(checkNum);
       
       return num;
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
			session.setAttribute("loginSns", result.getMember_sns());
			System.out.println("sns로그인 값" + result.getMember_sns());
			System.out.println("일반:1 / 관리자 :9 ->" + result.getMember_lv());
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

	/* 구글아이디로 로그인 */	
    @ResponseBody
	@RequestMapping(value = "loginGoogle.do", method = RequestMethod.POST)
	public String loginGooglePOST(MemberVO vo, HttpSession session, RedirectAttributes rttr) throws Exception{
		MemberVO returnVO = memberService.userLogin(vo);
		String mvo_ajaxid = vo.getUser_id();
		String mvo_ajaxemail = vo.getMember_email();
		System.out.println("C: 구글 로그인 API ajax 에서 가져온 vo "+ vo);
		System.out.println("C: 구글 로그인 API ajax 에서 가져온 id "+ mvo_ajaxid);
		System.out.println("C: 구글 로그인 API ajax 에서 가져온 email : " + mvo_ajaxemail);
		if(returnVO == null) { //아이디가 DB에 존재하지 않는 경우 회원가입이 진행되어야함 근데 해당 이메일이 있을 경우 그냥 로그인
			//구글 회원가입
			System.out.println("DB에 아이디가 없으면 회원가입 첫번째 회원가입 ");
			vo.setMember_sns("google"); //회원가입 되면 Member_sns에 google삽입
			vo.setMember_lv(Integer.parseInt("1")); //일반회원 
			
			/* 인증번호 난수 생성 --> 구글로 회원가입한 회원 user_id 임의 지정*/
			Random random = new Random(); // 새로운 Random 객체 생성
		    int checkNum = random.nextInt(888888) + 111111;
		    vo.setUser_id("google"+checkNum);
		    System.out.println("인증번호 : " + checkNum);
			System.out.println("최종 회원가입된 구글 아이디 값 : " + vo.getUser_id());
			memberService.userReg(vo);	
			
			//구글 로그인
			returnVO = memberService.userLogin(vo);
			session.setAttribute("loginSns", returnVO.getMember_sns());
			
			session.setAttribute("userId", returnVO.getUser_id());	
			session.setAttribute("memberName", returnVO.getMember_name());
			session.setAttribute("memberLv", returnVO.getMember_lv());		
			rttr.addFlashAttribute("mvo", returnVO);
			
			return "redirect:/test.do"; 
		}else {//아이디가 DB에 존재하지 않는 경우
			

			//구글 로그인
			memberService.userLogin(vo);
			session.setAttribute("loginSns", returnVO.getMember_sns());
			session.setAttribute("userId", returnVO.getUser_id());
			session.setAttribute("memberName", returnVO.getMember_name());
			session.setAttribute("memberLv", returnVO.getMember_lv());
			rttr.addFlashAttribute("mvo", returnVO);
		}
		
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
	public String memberModify(HttpSession session, Model model) throws Exception {

		// 세션 IF문 으로 세션 보안 처리
		if (session.getAttribute("userId") == null) {
			return "loginPage";
		} else {
			// 세션 객체 안에 있는 ID정보 저장
			String user_id = (String) session.getAttribute("userId");
			System.out.println("컨트롤러 ID 값 : " + user_id);
			// 서비스안의 회원정보보기 메서드 호출
			MemberVO vo = memberService.getMember(user_id);

			// 정보 저장 후 페이지 이동
			model.addAttribute("member", vo);
			return "modifyMember";

		}

	}

	// 회원 정보 수정 updateMember.do 요청이 들어왔을 때
	@RequestMapping("updateMember.do")
	public String updateMember(HttpSession session, MemberVO vo) throws Exception {
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
