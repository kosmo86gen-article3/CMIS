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
	
	
	// 회원가입 아이디 중복 체크
	public MemberVO idCheck_join(MemberVO vo) {
		return memberDAO.idCheck_join(vo);
	}
	
	public MemberVO getMember(String user_id) throws Exception {
		return memberDAO.getMember(user_id);
	}

	@Override
	public void updateMember(MemberVO vo) {
		memberDAO.updateMember(vo);
	}
	
	
}
