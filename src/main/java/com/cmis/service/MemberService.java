package com.cmis.service;

import com.cmis.domain.MemberVO;

public interface MemberService {
	// 회원가입
	public void userReg(MemberVO vo);
	
	// 로그인
	public MemberVO userLogin(MemberVO vo);

}
