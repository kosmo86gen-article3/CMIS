package com.cmis.domain;

import java.util.List;

public class QnaBoardVO {
	
	private int qna_board_num;
	private String user_id;
	private String qna_board_content;
	private String qna_board_date;
	private List<QnaReplyVO> qnaReplyVO;
	private int qna_reply_count;
	
	public int getQna_board_num() {
		return qna_board_num;
	}
	public void setQna_board_num(int qna_board_num) {
		this.qna_board_num = qna_board_num;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getQna_board_content() {
		return qna_board_content;
	}
	public void setQna_board_content(String qna_board_content) {
		this.qna_board_content = qna_board_content;
	}
	public String getQna_board_date() {
		return qna_board_date;
	}
	public void setQna_board_date(String qna_board_date) {
		this.qna_board_date = qna_board_date;
	}
	public List<QnaReplyVO> getQnaReplyVO() {
		return qnaReplyVO;
	}
	public void setQnaReplyVO(List<QnaReplyVO> qnaReplyVO) {
		this.qnaReplyVO = qnaReplyVO;
	}
	public int getQna_reply_count() {
		return qna_reply_count;
	}
	public void setQna_reply_count(int qna_reply_count) {
		this.qna_reply_count = qna_reply_count;
	}
	
	
	
}