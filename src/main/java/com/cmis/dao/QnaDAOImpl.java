package com.cmis.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cmis.domain.QnaBoardVO;
import com.cmis.domain.QnaReplyVO;
@Repository("qnaDAO")
public class QnaDAOImpl implements QnaDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int insertQnaBoard(QnaBoardVO vo) {
		 System.out.println("===> Mybatis QnaDAO insertQnaBoard() 호출");
	     return mybatis.insert("QnaDAO.insertQnaBoard",vo);
	}

//	public List<QnaBoardVO> getQnaBoardList() {
//		System.out.println("===> Mybatis QnaDAO getQnaBoardList() 호출");
//		return mybatis.selectList("QnaDAO.getQnaBoardList");
//	}
	
	public List<QnaBoardVO> getQnaBoardList() {
		System.out.println("===> Mybatis QnaDAO getQnaBoardList() 호출");
		return mybatis.selectList("QnaDAO.getQnaBoardList");
	}

	@Override
	public void deleteQnaBoard(QnaBoardVO vo) {
		System.out.println("===> Mybatis QnaDAO deleteQnaBoardList() 호출");
		mybatis.delete("QnaDAO.deleteQnaBoard",vo);
	}
	
	@Override
	public int updateQnaBoard(QnaBoardVO vo) {
		System.out.println("===> Mybatis QnaDAO updateQnaBoardList() 호출");
		return mybatis.delete("QnaDAO.updateQnaBoard",vo);
	}

	public int insertQnaReply(QnaReplyVO vo) {
		System.out.println("===> Mybatis QnaDAO updateQnaBoardList() 호출");
		return mybatis.insert("QnaDAO.insertQnaReply",vo);
	}
	
	public int getQnaBoardListCount() {
		return mybatis.selectOne(null);
	}
}