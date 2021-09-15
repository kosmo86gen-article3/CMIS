package com.cmis.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cmis.dao.MemberDAOImpl;
import com.cmis.domain.MemberVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAOImpl memberDAO;

	// 회원가입 작동
	public void userReg(MemberVO vo) {
		memberDAO.userReg(vo);
	}

	// 로그인
	public MemberVO userLogin(MemberVO vo) {
		return memberDAO.userLogin(vo);
	}
	
}
