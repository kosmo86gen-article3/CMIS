package com.cmis.dao;

import java.util.List;

import com.cmis.domain.MemberVO;

public interface AdminDAO {

	//관리자의 회원 관리
	public List<MemberVO> getMemberList(MemberVO vo);
	
	public MemberVO getMember(MemberVO vo);
	
	public void updateMember(MemberVO vo);
}
