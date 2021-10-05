package com.cmis.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

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
				// 1주간 신규 회원 가입 수
				model.addAttribute("memberWeekJoin", adminService.getMemberWeekJoin());
				
				returnPage = "adminPage";

			}
		} else {
			returnPage = "error";
		}
		return returnPage;
	}

	// 관리자의 회원 목록 페이지
	@RequestMapping("adminMemberList.do")
	public String memberList(MemberVO vo,String page, Model model, HttpSession session) {
		// 관리자 세션 IF문으로 세션 보안 처리
		String returnPage = "";
		
		if (session.getAttribute("memberLv") != null) {
			if ((Integer)session.getAttribute("memberLv") == 1) {
				returnPage = "loginPage";
			} else {
				System.out.println("adminMemberList 세션 통과");
				
				List<MemberVO> memberList = adminService.getMemberList(vo);
				
				model.addAttribute("memberList", memberList);
				
				int maxNum = memberList.size(); // 회원 테이블 갯수

				if (page == null) { // 페이지 받아온 게 없을때 1로
					page = "1";
				}

				int pageNum = Integer.parseInt(page); // int로 형변환

				// 페이지 수가 1 미만인 경우 1로 변경
				if (pageNum < 1)
					pageNum = 1;

				// 한 페이지에 몇 건 보여줄건지
				int pageCount = 10;

				// 출력할 첫번째 데이터
				int min = (pageNum - 1) * pageCount;

				// 출력할 마지막 데이터
				int max = (pageNum * pageCount) - 1;

				// 전체 페이지 계산
				int totPage = (int) Math.ceil(((double) maxNum / (double) pageCount)); // 441 / 8 = 55.** 값 올림

				// 현재 페이지가 max 페이지 보다 크면 total 페이지로 향하게
				if (pageNum > totPage)
					pageNum = totPage;

				// 현재 페이지에서 출력할 최소 페이지
				int minPage = pageNum - 4;

				// 1보다 작으면 1로 변경
				if (minPage < 1)
					minPage = 1;

				// 최대 페이지

				int maxPage = pageNum + 4;

				if (maxPage > totPage)
					maxPage = totPage;

				HashMap pageMap = new HashMap();
				pageMap.put("maxNum", maxNum);
				pageMap.put("min", min);
				pageMap.put("max", max);
				pageMap.put("minPage", minPage);
				pageMap.put("maxPage", maxPage);
				pageMap.put("totPage", totPage);
				pageMap.put("currentPage", pageNum);

				model.addAttribute("pageMap", pageMap);
				
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

	// 관리자 전체 게시물 관리
	@RequestMapping("adminShowBoard.do")
	public String boardList(MemberVO vo, Model model, String page, HttpSession session) {
		// 관리자 세션 IF문으로 세션 보안 처리
		String returnPage = "";
		if (session.getAttribute("memberLv") != null) {
			if ((Integer)session.getAttribute("memberLv") == 1) {
				returnPage = "loginPage";
			} else {
				System.out.println("adminMemberList 세션 통과");
				
				List<BoardVO> boardList = boardService.getBoardList();
				
				model.addAttribute("boardList", boardList);
				
				int maxNum = boardList.size(); // 회원 테이블 갯수

				if (page == null) { // 페이지 받아온 게 없을때 1로
					page = "1";
				}

				int pageNum = Integer.parseInt(page); // int로 형변환

				// 페이지 수가 1 미만인 경우 1로 변경
				if (pageNum < 1)
					pageNum = 1;

				// 한 페이지에 몇 건 보여줄건지
				int pageCount = 10;

				// 출력할 첫번째 데이터
				int min = (pageNum - 1) * pageCount;

				// 출력할 마지막 데이터
				int max = (pageNum * pageCount) - 1;

				// 전체 페이지 계산
				int totPage = (int) Math.ceil(((double) maxNum / (double) pageCount)); // 441 / 8 = 55.** 값 올림

				// 현재 페이지가 max 페이지 보다 크면 total 페이지로 향하게
				if (pageNum > totPage)
					pageNum = totPage;

				// 현재 페이지에서 출력할 최소 페이지
				int minPage = pageNum - 4;

				// 1보다 작으면 1로 변경
				if (minPage < 1)
					minPage = 1;

				// 최대 페이지

				int maxPage = pageNum + 4;

				if (maxPage > totPage)
					maxPage = totPage;

				HashMap pageMap = new HashMap();
				pageMap.put("maxNum", maxNum);
				pageMap.put("min", min);
				pageMap.put("max", max);
				pageMap.put("minPage", minPage);
				pageMap.put("maxPage", maxPage);
				pageMap.put("totPage", totPage);
				pageMap.put("currentPage", pageNum);

				model.addAttribute("pageMap", pageMap);
				
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
	
	// 관리자의 댓글 목록 페이지
		@RequestMapping("adminShowReply.do")
		public String replyList(MemberVO vo, Model model, String page, HttpSession session) {
			// 관리자 세션 IF문으로 세션 보안 처리
			String returnPage = "";
			if (session.getAttribute("memberLv") != null) {
				if ((Integer)session.getAttribute("memberLv") == 1) {
					returnPage = "loginPage";
				} else {
					System.out.println("adminMemberList 세션 통과");
					CommentVO co = new CommentVO();
					
					List<HashMap> replyList = boardService.selectComment(co);
					
					model.addAttribute("replyList", replyList);
					
					int maxNum = replyList.size(); // 회원 테이블 갯수

					if (page == null) { // 페이지 받아온 게 없을때 1로
						page = "1";
					}

					int pageNum = Integer.parseInt(page); // int로 형변환

					// 페이지 수가 1 미만인 경우 1로 변경
					if (pageNum < 1)
						pageNum = 1;

					// 한 페이지에 몇 건 보여줄건지
					int pageCount = 10;

					// 출력할 첫번째 데이터
					int min = (pageNum - 1) * pageCount;

					// 출력할 마지막 데이터
					int max = (pageNum * pageCount) - 1;

					// 전체 페이지 계산
					int totPage = (int) Math.ceil(((double) maxNum / (double) pageCount)); // 441 / 8 = 55.** 값 올림

					// 현재 페이지가 max 페이지 보다 크면 total 페이지로 향하게
					if (pageNum > totPage)
						pageNum = totPage;

					// 현재 페이지에서 출력할 최소 페이지
					int minPage = pageNum - 4;

					// 1보다 작으면 1로 변경
					if (minPage < 1)
						minPage = 1;

					// 최대 페이지

					int maxPage = pageNum + 4;

					if (maxPage > totPage)
						maxPage = totPage;

					HashMap pageMap = new HashMap();
					pageMap.put("maxNum", maxNum);
					pageMap.put("min", min);
					pageMap.put("max", max);
					pageMap.put("minPage", minPage);
					pageMap.put("maxPage", maxPage);
					pageMap.put("totPage", totPage);
					pageMap.put("currentPage", pageNum);

					model.addAttribute("pageMap", pageMap);
					
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
