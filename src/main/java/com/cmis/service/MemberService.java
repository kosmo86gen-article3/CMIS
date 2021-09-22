package com.cmis.service;

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
}
