package com.cmis.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cmis.domain.NewsBoardVO;

@Repository("newsBoardDAO")
public class NewsBoardDAOImpl implements NewsBoardDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	// 뉴스게시판 글 목록 가져오기
	public List<NewsBoardVO> getNewsBoardList() { 
		return mybatis.selectList("NewsBoardDAO.getNewsBoardList");
	}
	
	// 뉴스게시판 카운트 증가
	public int newsBoardCnt(NewsBoardVO vo) {
//		System.out.println("<"+vo.getNews_num()+">");
		
		return mybatis.update("NewsBoardDAO.newsBoardCnt", vo);
	}
	
	// 뉴스게시판 조회수 높은순 글 목록 가져오기
	public List<NewsBoardVO> getMiniNewsBoardList() {
		return mybatis.selectList("NewsBoardDAO.getMiniNewsBoardList");
	}
}
