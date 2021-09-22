package com.cmis.dao;

import java.util.HashMap;
import java.util.List;

import com.cmis.domain.ProductVO;
import com.cmis.domain.QnaBoardVO;
import com.cmis.domain.QnaReplyVO;

public interface QnaDAO {
   
   int insertQnaBoard(QnaBoardVO vo);
   
   List<QnaBoardVO> getQnaBoardList();

   void deleteQnaBoard(QnaBoardVO vo);
   
   int updateQnaBoard(QnaBoardVO vo);

int insertQnaReply(QnaReplyVO vo);
}