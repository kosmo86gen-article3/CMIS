package com.cmis.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cmis.dao.NewsBoardDAO;
import com.cmis.domain.NewsBoardVO;

@Service("newsBoardService")
public class NewsBoardServiceImpl implements NewsBoardService {

	@Autowired
	private NewsBoardDAO newsBoardDAO;

	// 뉴스게시판 글 목록 가져오기
	public List<NewsBoardVO> getNewsBoardList() {
		return newsBoardDAO.getNewsBoardList();
	}
	
	// 뉴스게시판 카운트 증가
	public int newsBoardCnt(NewsBoardVO vo) {
		return newsBoardDAO.newsBoardCnt(vo);
	}
	
	// 뉴스게시판 조회수 높은순 글 목록 가져오기
	public List<NewsBoardVO> getMiniNewsBoardList() {
		return newsBoardDAO.getMiniNewsBoardList();
	}
}
