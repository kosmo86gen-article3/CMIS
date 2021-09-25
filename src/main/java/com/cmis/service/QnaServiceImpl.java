package com.cmis.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cmis.dao.QnaDAO;
import com.cmis.domain.QnaBoardVO;
import com.cmis.domain.QnaReplyVO;

@Service("qnaService")
public class QnaServiceImpl implements QnaService {
	
	@Autowired
	private QnaDAO qnaDAO;
	
	public int insertQna(QnaBoardVO vo) {
		return qnaDAO.insertQnaBoard(vo);
	}

//	public List<QnaBoardVO> getQnaBoardList() {
//		return qnaDAO.getQnaBoardList();
//	}
	
	public List<QnaBoardVO> getQnaBoardList() {
		return qnaDAO.getQnaBoardList();
	}

	@Override
	public void deleteQna(QnaBoardVO vo) {
		qnaDAO.deleteQnaBoard(vo);
		
	}

	@Override
	public int updateQna(QnaBoardVO vo) {
		return qnaDAO.updateQnaBoard(vo);
	}

	public int insertQnaReply(QnaReplyVO vo) {
		return qnaDAO.insertQnaReply(vo);
	}

}