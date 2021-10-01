package com.cmis.service;

import java.util.List;

import com.cmis.domain.NewsBoardVO;

public interface NewsBoardService {
	// 뉴스게시판 글 목록 가져오기
	public List<NewsBoardVO> getNewsBoardList();
	
	// 뉴스게시판 카운트 증가
	public int newsBoardCnt(NewsBoardVO vo);
	
	// 뉴스게시판 조회수 높은순 글 목록 가져오기
	public List<NewsBoardVO> getMiniNewsBoardList();
}
