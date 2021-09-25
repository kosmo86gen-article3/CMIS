package com.cmis.service;


import java.util.List;

import com.cmis.domain.*;

public interface AdminService {
	
	//관리자 회원 관리
	
	//회원 목록
	List<MemberVO> getMemberList(MemberVO vo);
	
	//회원 상세 조회
	MemberVO getMember(MemberVO vo);
	
	//회원 수정
	void updateMember(MemberVO vo);
	
	
	
	
}
