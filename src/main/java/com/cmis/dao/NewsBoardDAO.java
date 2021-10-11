package com.cmis.dao;

import java.util.List;

import com.cmis.domain.NewsBoardVO;

public interface NewsBoardDAO {
	// 뉴스게시판 글 목록 가져오기
	public List<NewsBoardVO> getNewsBoardList();
	
	// 뉴스게시판 카운트 증가
	public int newsBoardCnt(NewsBoardVO vo);
	
	// 뉴스게시판에 많이 본 뉴스
	public List<NewsBoardVO> getMiniNewsBoardList();
}
