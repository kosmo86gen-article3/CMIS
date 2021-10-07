package com.cmis.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.cmis.domain.BoardVO;
import com.cmis.domain.CommentVO;
import com.cmis.domain.MemberVO;

public interface MemberService {
	// 회원가입
	public void userReg(MemberVO vo);
	
	// 로그인
	public MemberVO userLogin(MemberVO vo);
	
	// 회원가입 아이디 중복 체크
	public MemberVO idCheck_join(MemberVO vo);
	
	//마이 페이지 회원 정보 수정 전에 
	//내 정보 확인(SELECT)
	public MemberVO getMember(String user_id) throws Exception;
	
	//회원 정보 수정 (UPDATE)
	public void updateMember(MemberVO vo);
	
	//구글회원가입
	public void joinMemberByGoogle(MemberVO vo);
		
	//구글로그인
	public MemberVO loginMemberByGoogle(MemberVO vo);
	
	//아이디 찾기
	public MemberVO idFind(MemberVO vo);
	
	//비밀번호 찾기
	public MemberVO pwFind(MemberVO vo);
	
	//비밀번호 변경
	public int resetMember(MemberVO vo);
	
	//회원의 등록 글 목록 조회
	public List<BoardVO> getMemberBoardList(BoardVO vo);
	
	//회원의 등록 댓글 목록 조회
	public List<CommentVO> getMemberComment(CommentVO vo);
}
