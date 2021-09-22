package com.cmis.service;

import java.util.List;

import com.cmis.domain.QnaBoardVO;
import com.cmis.domain.QnaReplyVO;

public interface QnaService {
	int insertQna(QnaBoardVO vo);
	
	List<QnaBoardVO> getQnaBoardList();

	void deleteQna(QnaBoardVO vo);
	
	int updateQna(QnaBoardVO vo);

	int insertQnaReply(QnaReplyVO vo);
}