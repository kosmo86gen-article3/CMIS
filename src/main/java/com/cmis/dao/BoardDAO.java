package com.cmis.dao;

import java.util.HashMap;
import java.util.List;

import com.cmis.domain.BoardVO;
import com.cmis.domain.CommentVO;

public interface BoardDAO {
	// 자유게시판 글 목록 가져오기
	public List<BoardVO> getBoardList();

	// 자유게시판 글 상세페이지
	public BoardVO getBoardDetail(BoardVO vo);
	
	// 자유게시판 글 쓰기
	public void writeBoard(BoardVO vo);
	
	// 자유게시판 글 수정
	public void modifyBoard(BoardVO vo);
	
	// 자유게시판 글 삭제
	public void deleteBoard(BoardVO vo);
	
	// 자유게시판 댓글 달기
	public void writeComment(CommentVO vo);
	
	// 자유게시판 댓글 작성 후 바로 가져오기
	public List<HashMap> selectComment(CommentVO vo);
	
	// 자유게시판 댓글 삭제
	public void deleteComment(CommentVO vo);
	
	// 자유게시판 조회수 증가
	public void boardViewCount(BoardVO bvo);
}
