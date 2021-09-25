package com.cmis.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cmis.dao.BoardDAOImpl;
import com.cmis.domain.BoardVO;
import com.cmis.domain.CommentVO;

@Service("boardService")
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAOImpl boardDAO;

	// 자유게시판 글 목록 가져오기
	public List<BoardVO> getBoardList() {
		return boardDAO.getBoardList();
	}
	
	// 자유게시판 글 상세페이지
	public BoardVO getBoardDetail(BoardVO vo) {
		return boardDAO.getBoardDetail(vo);
	}

	// 자유게시판 글 쓰기
	public void writeBoard(BoardVO vo) {
		boardDAO.writeBoard(vo);
	}
	
	// 자유게시판 글 수정
	public void modifyBoard(BoardVO vo) {
		boardDAO.modifyBoard(vo);
	}
	
	// 자유게시판 글 삭제
	public void deleteBoard(BoardVO vo) {
		boardDAO.deleteBoard(vo);
	}
	
	// 자유게시판 댓글 달기
	public void writeComment(CommentVO vo) {
		boardDAO.writeComment(vo);
	}
	
	// 자유게시판 댓글 작성 후 바로 가져오기
	public List<HashMap> selectComment(CommentVO vo) {
		return boardDAO.selectComment(vo);
	}
	
	// 자유게시판 댓글 삭제
	public void deleteComment(CommentVO vo) {
		boardDAO.deleteComment(vo);
	}
}
