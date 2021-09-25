package com.cmis.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cmis.domain.BoardVO;
import com.cmis.domain.CommentVO;

@Repository("boardDAO")
public class BoardDAOImpl implements BoardDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	// 자유게시판 글 목록 가져오기
	public List<BoardVO> getBoardList() { 
		return mybatis.selectList("BoardDAO.getBoardList");
	}
	
	// 자유게시판 글 상세페이지
	public BoardVO getBoardDetail(BoardVO vo) { 
		return mybatis.selectOne("BoardDAO.getBoardDetail", vo);
	}

	// 자유게시판 글 쓰기
	public void writeBoard(BoardVO vo) {
		mybatis.insert("BoardDAO.writeBoard", vo);
	}
	
	// 자유게시판 글 수정
	public void modifyBoard(BoardVO vo) {
		mybatis.update("BoardDAO.modifyBoard", vo);
	}
	
	// 자유게시판 글 삭제
	public void deleteBoard(BoardVO vo) {
		mybatis.delete("BoardDAO.deleteBoard", vo);
	}
	
	// 자유게시판 댓글 달기
	public void writeComment(CommentVO vo) {
		mybatis.insert("BoardDAO.writeComment", vo);
	}
	
	// 자유게시판 댓글 작성 후 바로 가져오기
	public List<HashMap> selectComment(CommentVO vo) {
		return mybatis.selectList("BoardDAO.selectComment", vo);
	}
	
	// 자유게시판 댓글 삭제
	public void deleteComment(CommentVO vo) {
		mybatis.delete("BoardDAO.deleteComment",vo);
	}
}
