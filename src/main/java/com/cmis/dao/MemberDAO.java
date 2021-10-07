package com.cmis.dao;

import java.util.List;

import com.cmis.domain.BoardVO;
import com.cmis.domain.CommentVO;
import com.cmis.domain.MemberVO;

public interface MemberDAO {
	// 회원가입
	public void userReg(MemberVO vo);

	// 로그인
	public MemberVO userLogin(MemberVO vo);
	
	// 회원가입 아이디 중복 체크
	public MemberVO idCheck_join(MemberVO vo);
	
	//마이 페이지 회원 정보 수정 전에 
	//내 정보 확인(출력)
	public MemberVO getMember(String user_id) throws Exception;
	
	//회원 정보 수정(update)
	public void updateMember(MemberVO vo);
	
	//비밀번호 수정(update)
	public int resetMember(MemberVO vo);
	
	//아이디 찾기
	public MemberVO idFind(MemberVO vo);
	
	//비밀번호 찾기
	public MemberVO pwFind(MemberVO vo);
	
	//회원의 등록 글 목록 조회(리스트)
	public List<BoardVO> getMemberBoardList(BoardVO vo);
	
	//회원의 등록 댓글 조회
	public List<CommentVO> getMemberComment(CommentVO vo);
}
