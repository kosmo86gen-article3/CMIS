package com.cmis.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cmis.domain.BoardVO;
import com.cmis.domain.CommentVO;
import com.cmis.service.BoardService;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;

	// 자유게시판 글목록 페이지
	@RequestMapping("board.do")
	public String board(Model model, String page) {

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

		return "/board/boardList";
	}

	// 자유게시판 상세글 페이지
	@RequestMapping("boardDetail.do")
	public String boardDetail(BoardVO bvo, CommentVO cvo, Model model) {

		boardService.boardViewCount(bvo);

		model.addAttribute("boardDetail", boardService.getBoardDetail(bvo));

		model.addAttribute("commentsAll", boardService.selectComment(cvo));

		System.out.println(boardService.selectComment(cvo));

		return "/board/boardDetail";
	}

	// 자유게시판 글쓰기 페이지
	@RequestMapping("boardWrite.do")
	public String boardWrite(HttpSession session) {
		if (session.getAttribute("userId") == null) {
			return "loginPage";
		} else

			return "/board/boardWrite";
	}

	// 자유게시판 글쓰기 작동
	@RequestMapping("boardWriteDo.do")
	public String boardWriteDo(BoardVO vo, HttpServletRequest request, HttpSession session) {

		if (session.getAttribute("userId") == null) {
			return "loginPage";
		} else {
			System.out.println(request.getSession().getServletContext().getRealPath("/resources/upload/"));
			// 실제 파일 업로드 경로 : 배운거하고 좀 다르게 함. 프로젝트 안의 resources-upload가 아닌 서버측 컴퓨터 내에 있는 경로
			// 불러와서 거기에 업로드한 이미지 저장함
			String path = request.getSession().getServletContext().getRealPath("/resources/upload/");

			File dir = new File(path);

			if (!dir.exists()) {
				dir.mkdirs();
			}

			// 업로드 파일 접근
			if (!vo.getBoard_img().isEmpty()) {
				String board_img_name = System.currentTimeMillis() + vo.getBoard_img().getOriginalFilename();
				vo.setBoard_img_name(board_img_name);

				String saveFile = path + System.currentTimeMillis() + vo.getBoard_img().getOriginalFilename();

				try {
					vo.getBoard_img().transferTo(new File(saveFile));
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}

			vo.setBoard_writer((String) session.getAttribute("userId"));

			boardService.writeBoard(vo);

			return "redirect:/board.do";
		}
	}

	// 자유게시판 글 수정 페이지
	@RequestMapping("boardModify.do")
	public String boardModify(BoardVO vo, Model model, HttpSession session) {
		
		if (session.getAttribute("userId") == null) {
			return "loginPage";
		}
		
		vo = boardService.getBoardDetail(vo);
		
		if (vo.getBoard_writer().equals((String) session.getAttribute("userId"))) {
			model.addAttribute("boardDetail", vo);

			return "/board/boardModify";
		} else {
			return "redirect:/board.do";
			
		}
	}

	// 자유게시판 글 수정 작동
	@RequestMapping("boardModifyDo.do")
	public String boardModifyDo(BoardVO vo, HttpServletRequest request) {
		System.out.println(request.getSession().getServletContext().getRealPath("/resources/upload/"));
		// 실제 파일 업로드 경로 : 배운거하고 좀 다르게 함. 프로젝트 안의 resources-upload가 아닌 서버측 컴퓨터 내에 있는 경로
		// 불러와서 거기에 업로드한 이미지 저장함
		String path = request.getSession().getServletContext().getRealPath("/resources/upload/");

		File exisFile = new File(path + "\\" + vo.getBoard_img_name());

		if (exisFile.exists()) {
			exisFile.delete();
		}

		// 업로드 파일 접근
		if (!vo.getBoard_img().isEmpty()) {
			String board_img_name = System.currentTimeMillis() + vo.getBoard_img().getOriginalFilename();
			vo.setBoard_img_name(board_img_name);

			String saveFile = path + System.currentTimeMillis() + vo.getBoard_img().getOriginalFilename();

			try {
				vo.getBoard_img().transferTo(new File(saveFile));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		boardService.modifyBoard(vo);

		return "redirect:/board.do";
	}

	// 자유게시판 글 삭제 작동
	@RequestMapping("boardDeleteDo.do")
	public String boardDeleteDo(BoardVO vo, HttpServletRequest request) {
		String path = request.getSession().getServletContext().getRealPath("/resources/upload/");

		File exisFile = new File(path + "\\" + vo.getBoard_img_name());

		if (exisFile.exists()) {
			exisFile.delete();
		}

		boardService.deleteBoard(vo);

		return "redirect:/board.do";
	}

	// 자유게시판 댓글 작성하고 댓글 전체 출력 작동
	@ResponseBody
	@RequestMapping(value = "boardReplyDo.do", produces = "application/text;charset=UTF-8", method = RequestMethod.POST)
	public String boardReplyDo(CommentVO vo, HttpSession session) {

		vo.setComment_writer((String) session.getAttribute("userId"));

		boardService.writeComment(vo);

		List<HashMap> result2 = boardService.selectComment(vo);

		System.out.println(result2);

		Gson json = new Gson();

		String result = json.toJson(result2).toString();

		return result;
	}

	// 자유게시판 댓글 삭제
	@ResponseBody
	@RequestMapping(value = "boardReplyDeleteDo.do", produces = "application/text;charset=UTF-8", method = RequestMethod.POST)
	public String boardReplyDeleteDo(CommentVO vo) {
		boardService.deleteComment(vo);

		List<HashMap> result2 = boardService.selectComment(vo);

		System.out.println(result2);

		Gson json = new Gson();

		String result = json.toJson(result2).toString();

		return result;
	}

}
