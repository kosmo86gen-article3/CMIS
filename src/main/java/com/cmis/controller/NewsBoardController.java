package com.cmis.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cmis.domain.NewsBoardVO;
import com.cmis.service.NewsBoardService;

@Controller
public class NewsBoardController {

	@Autowired
	private NewsBoardService newsBoardService;
	
	// 뉴스게시판 글목록 페이지
	@RequestMapping("newsBoard.do")
	public String newsBoard(Model model) {
		model.addAttribute("newsBoardList", newsBoardService.getNewsBoardList());
		
		//model.addAttribute("miniNewsBoardList", newsBoardService.getMiniNewsBoardList());
		
		return "/news/newsPage";
	}
	
	// 뉴스게시판 카운트 증가
	@ResponseBody
	@RequestMapping(value="newsBoardCnt.do", produces="application/text;charset=UTF-8", method=RequestMethod.POST)
	public String newsBoardCnt(NewsBoardVO vo) {
		
		int result = newsBoardService.newsBoardCnt(vo);
		
//		System.out.println(result);
		
		return String.valueOf(result);
	}
	
}
