package com.cmis.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import java.io.File;
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

import com.cmis.domain.BoardVO;
import com.cmis.domain.CommentVO;
import com.cmis.domain.MemberVO;
import com.cmis.service.AdminService;
import com.cmis.service.BoardService;
import com.cmis.service.MemberService;

@Controller
public class AdminController {

	@Autowired
	private AdminService adminService;
	@Autowired
	private BoardService boardService;

	/*
	 * 
	 * 관리자 페이지 ////////////////////////////////////////////////
	 * 
	 */

	@RequestMapping("adminPage.do")
	public String adminPage(HttpSession session, Model model) throws Exception {
		// 세션 IF문으로 세션 보안 처리
		String returnPage = "";
		if (session.getAttribute("memberLv") != null) {
			if ((Integer)session.getAttribute("memberLv") == 1) {
				returnPage = "loginPage";
			} else {
				System.out.println("adminPage 세션 통과");
				// 회원 가입 건수
				model.addAttribute("memberJoinCount", adminService.getMemberJoinCount());
				// 게시판별 글 작성 건수
				model.addAttribute("boardCount", adminService.getAdminBoardCount());
				// 상품 조회수 Top 5
				model.addAttribute("productViewRank", adminService.getProductViewRank());
				// 찜목록 순위 Top 5
				model.addAttribute("productWishRank", adminService.getProductWishRank());
				// 커뮤니티 작성 Top 5
				model.addAttribute("communityRank", adminService.getCommunityRank());
				// 커뮤니티 작성 Top 5
				model.addAttribute("hotPriceShopRank", adminService.getHotPriceShopRank());
				// 회원 연령 분포도
				model.addAttribute("memberAge", adminService.getMemberAge());
				// 상품 카테고리 비율
				model.addAttribute("categoryRatio", adminService.getCategoryRatio());
				
				returnPage = "adminPage";

			}
		} else {
			returnPage = "error";
		}
		return returnPage;
	}

	// 관리자의 회원 목록 페이지
	@RequestMapping("adminMemberList.do")
	public String memberList(MemberVO vo, Model model, HttpSession session) {
		// 관리자 세션 IF문으로 세션 보안 처리
		String returnPage = "";
		
		if (session.getAttribute("memberLv") != null) {
			if ((Integer)session.getAttribute("memberLv") == 1) {
				returnPage = "loginPage";
			} else {
				System.out.println("adminMemberList 세션 통과");
				model.addAttribute("memberList", adminService.getMemberList(vo));
				returnPage = "adminMemberList";
				System.out.println(session.getAttribute("memberLv"));
			}
		} else {
			returnPage = "error";
		}
		return returnPage;
	}

	// 관리자의 회원 상세 조회
	@RequestMapping("adminGetMember.do")
	public String adminGetMember(MemberVO vo, Model model, HttpSession session) {
		// 관리자 세션 IF문으로 세션 보안 처리
		String returnPage = "";
		if (session.getAttribute("memberLv") != null) {
			if ((Integer)session.getAttribute("memberLv") == 1) {
				returnPage = "loginPage";
			} else {
				System.out.println("adminGetMember 세션 통과");
				model.addAttribute("member", adminService.getMember(vo));
				returnPage = "adminGetMember";
			}
		} else {
			returnPage = "error";
		}
		return returnPage;
	}

	// 관리자의 회원 정보 수정
	@RequestMapping("adminMemberUpdate.do")
	public String adminMemberUpdate(@ModelAttribute("member") MemberVO vo, Model model, HttpSession session) {
		// 관리자 세션 IF문으로 세션 보안 처리
		String returnPage = "";
		if (session.getAttribute("memberLv") != null) {
			if ((Integer)session.getAttribute("memberLv") == 1) {
				returnPage = "loginPage";
			} else {
				System.out.println("adminMemberUpdate 세션 통과");
				System.out.println(vo.getMember_lv());
				adminService.updateMember(vo);
				System.out.println("adminMemberUpdate Service Success");
				returnPage = "adminMemberList";
			}
		} else {
			returnPage = "error";
		}
		return "redirect:adminMemberList.do";
	}

	// 관리자의 회원 목록 페이지
	@RequestMapping("adminShowBoard.do")
	public String boardList(MemberVO vo, Model model, HttpSession session) {
		// 관리자 세션 IF문으로 세션 보안 처리
		String returnPage = "";
		if (session.getAttribute("memberLv") != null) {
			if ((Integer)session.getAttribute("memberLv") == 1) {
				returnPage = "loginPage";
			} else {
				System.out.println("adminMemberList 세션 통과");
				model.addAttribute("boardList", boardService.getBoardList());
				returnPage = "adminShowBoard";

			}
		} else {
			returnPage = "error";
		}
		return returnPage;
	}

	// 관리자 자유게시판 글 삭제
	@RequestMapping(value = "adminBoardDelete.do", produces = "application/text;charset=UTF-8", method = RequestMethod.POST)
	@ResponseBody
	public String adminBoardDelete(int board_num, HttpServletRequest request) {

		BoardVO vo = new BoardVO();

		vo.setBoard_num(board_num);

		vo = boardService.getBoardDetail(vo);

		String path = request.getSession().getServletContext().getRealPath("/resources/upload/");

		File exisFile = new File(path + "\\" + vo.getBoard_img_name());

		if (exisFile.exists()) {
			exisFile.delete();
		}

		boardService.deleteBoard(vo);

		return "삭제되었습니다";
	}
	
	// 관리자의 회원 목록 페이지
		@RequestMapping("adminShowReply.do")
		public String replyList(MemberVO vo, Model model, HttpSession session) {
			// 관리자 세션 IF문으로 세션 보안 처리
			String returnPage = "";
			if (session.getAttribute("memberLv") != null) {
				if ((Integer)session.getAttribute("memberLv") == 1) {
					returnPage = "loginPage";
				} else {
					System.out.println("adminMemberList 세션 통과");
					CommentVO co = new CommentVO();
					model.addAttribute("replyList", boardService.selectComment(co));
					returnPage = "adminShowReply";

				}
			} else {
				returnPage = "error";
			}
			return returnPage;
		}
		
		// 관리자 자유게시판 글 삭제
		@RequestMapping(value = "adminReplyDelete.do", produces = "application/text;charset=UTF-8", method = RequestMethod.POST)
		@ResponseBody
		public String adminReplyDelete(CommentVO vo) {

			boardService.deleteComment(vo);
			
			return "삭제되었습니다";
		}

}// end AdminController
