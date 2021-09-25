package com.cmis.domain;

public class QnaReplyVO {
	
	private int qna_board_num;
	private int qna_reply_num;
	private String reply_user_id;
	private String qna_reply_content;
	private String qna_reply_date;
	
	public int getQna_board_num() {
		return qna_board_num;
	}
	public void setQna_board_num(int qna_board_num) {
		this.qna_board_num = qna_board_num;
	}
	public int getQna_reply_num() {
		return qna_reply_num;
	}
	public void setQna_reply_num(int qna_reply_num) {
		this.qna_reply_num = qna_reply_num;
	}
	public String getReply_user_id() {
		return reply_user_id;
	}
	public void setReply_user_id(String reply_user_id) {
		this.reply_user_id = reply_user_id;
	}
	public String getQna_reply_content() {
		return qna_reply_content;
	}
	public void setQna_reply_content(String qna_reply_content) {
		this.qna_reply_content = qna_reply_content;
	}
	public String getQna_reply_date() {
		return qna_reply_date;
	}
	public void setQna_reply_date(String qna_reply_date) {
		this.qna_reply_date = qna_reply_date;
	}
}
