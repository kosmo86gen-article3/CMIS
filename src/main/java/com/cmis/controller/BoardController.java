package com.cmis.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
	public String board(Model model) {
		model.addAttribute("boardList", boardService.getBoardList());
		
		return "/board/boardList";
	}
	
	// 자유게시판 상세글 페이지
	@RequestMapping("boardDetail.do")
	public String boardDetail(BoardVO bvo, CommentVO cvo, Model model) {
		model.addAttribute("boardDetail", boardService.getBoardDetail(bvo));
		
		model.addAttribute("commentsAll", boardService.selectComment(cvo));
		
		System.out.println(boardService.selectComment(cvo));
		
		return "/board/boardDetail";
	}
	
	// 자유게시판 글쓰기 페이지
	@RequestMapping("boardWrite.do")
	public String boardWrite() {
		
		return "/board/boardWrite";
	}
	
	// 자유게시판 글쓰기 작동
	@RequestMapping("boardWriteDo.do")
	public String boardWriteDo(BoardVO vo, HttpServletRequest request) {
		System.out.println(request.getSession().getServletContext().getRealPath("/resources/upload/"));
		// 실제 파일 업로드 경로 : 배운거하고 좀 다르게 함. 프로젝트 안의 resources-upload가 아닌 서버측 컴퓨터 내에 있는 경로 불러와서 거기에 업로드한 이미지 저장함
		String path = request.getSession().getServletContext().getRealPath("/resources/upload/");
		
		File dir = new File(path); 
		
		if(!dir.exists()) {
			dir.mkdirs(); 
		}

		// 업로드 파일 접근
		if(! vo.getBoard_img().isEmpty()) {
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
		
		boardService.writeBoard(vo);
		
		return "redirect:/board.do";
	}
	
	// 자유게시판 글 수정 페이지
	@RequestMapping("boardModify.do")
	public String boardModify(BoardVO vo, Model model) {
		model.addAttribute("boardDetail", boardService.getBoardDetail(vo));
		
		return "/board/boardModify";
	}
	
	// 자유게시판 글 수정 작동
	@RequestMapping("boardModifyDo.do")
	public String boardModifyDo(BoardVO vo, HttpServletRequest request) {
		System.out.println(request.getSession().getServletContext().getRealPath("/resources/upload/"));
		// 실제 파일 업로드 경로 : 배운거하고 좀 다르게 함. 프로젝트 안의 resources-upload가 아닌 서버측 컴퓨터 내에 있는 경로 불러와서 거기에 업로드한 이미지 저장함
		String path = request.getSession().getServletContext().getRealPath("/resources/upload/");
		
		File exisFile = new File(path+"\\"+vo.getBoard_img_name()); 
		
		if(exisFile.exists()) {
			exisFile.delete(); 
		}

		// 업로드 파일 접근
		if(! vo.getBoard_img().isEmpty()) {
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
		
		File exisFile = new File(path+"\\"+vo.getBoard_img_name()); 
		
		if(exisFile.exists()) {
			exisFile.delete(); 
		}
		
		boardService.deleteBoard(vo);
		
		return "redirect:/board.do";
	}
	
	// 자유게시판 댓글 작성하고 댓글 전체 출력 작동
	@ResponseBody
	@RequestMapping(value="boardReplyDo.do", produces="application/text;charset=UTF-8", method=RequestMethod.POST)
	public String boardReplyDo(CommentVO vo) {
		boardService.writeComment(vo);
		
		List<HashMap> result2 = boardService.selectComment(vo);
		
		System.out.println(result2);
		
		Gson json = new Gson();
		
		String result  = json.toJson(result2).toString();
		
		return result;
	}
	
	// 자유게시판 댓글 삭제
	@ResponseBody
	@RequestMapping(value="boardReplyDeleteDo.do", produces="application/text;charset=UTF-8", method=RequestMethod.POST)
	public String boardReplyDeleteDo(CommentVO vo) {
		boardService.deleteComment(vo);
		
		List<HashMap> result2 = boardService.selectComment(vo);
		
		System.out.println(result2);
		
		Gson json = new Gson();
		
		String result  = json.toJson(result2).toString();
		
		return result;
	}
	
}
