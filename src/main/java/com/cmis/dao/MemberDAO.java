package com.cmis.dao;

import com.cmis.domain.MemberVO;

public interface MemberDAO {
	// 회원가입 작동
	public void userReg(MemberVO vo);

	// 로그인
	public MemberVO userLogin(MemberVO vo);
	
}
