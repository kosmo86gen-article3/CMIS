package com.cmis.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cmis.domain.QnaBoardVO;
import com.cmis.domain.QnaReplyVO;
import com.cmis.service.QnaService;

@Controller
public class QnaController {

	@Autowired
	QnaService qnaService;

//   @RequestMapping("qna_board.do")
//   public String qnaBoard(Model m) {
//      m.addAttribute("qnaBoardList", qnaService.getQnaBoardList());
//      return "qnaBoard";
//   }

	@RequestMapping("qna_board.do")
	public String qnaBoard(Model m) {
		m.addAttribute("qnaBoardList", qnaService.getQnaBoardList());
		return "qna_board";
	}

	@RequestMapping("insert_qna.do")
	public String insertQna(QnaBoardVO vo, HttpSession session) {
		if (session.getAttribute("userId") == null) {
			return "loginPage";
		} else {
			qnaService.insertQna(vo);
		return "redirect:qna_board.do";
		}
	}

	@RequestMapping(value = "delete_qna.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public void deleteQna(QnaBoardVO vo) {

		System.out.println(vo.getUser_id());
		System.out.println(vo.getQna_board_num());
		qnaService.deleteQna(vo);

	}

	@RequestMapping(value = "update_qna.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public HashMap updateQna(QnaBoardVO vo) {
		HashMap map = new HashMap();
		System.out.println(vo.getUser_id());
		System.out.println(vo.getQna_board_content());
		System.out.println(vo.getQna_board_num());
		int result = qnaService.updateQna(vo);
		System.out.println(result);
		if (result > 0) {
			map.put("result", "수정 성공");
			return map;
		} else {
			map.put("result", "에러");
			return map;
		}
	}

	@RequestMapping(value = "insert_qna_reply.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public HashMap insertQnaReply(QnaReplyVO vo) {
		HashMap map = new HashMap();
		System.out.println(vo.getQna_board_num());
		System.out.println(vo.getQna_reply_content());
		System.out.println(vo.getReply_user_id());
		int result = qnaService.insertQnaReply(vo);
		System.out.println(result);
		if (result > 0) {
			map.put("result", "작성 성공");
			return map;
		} else {
			map.put("result", "에러");
			return map;
		}
	}

}