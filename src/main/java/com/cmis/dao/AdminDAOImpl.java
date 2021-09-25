package com.cmis.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cmis.domain.MemberVO;

@Repository("adminDAO")
public class AdminDAOImpl implements AdminDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;

	
	//관리자의 회원 관리
	public List<MemberVO> getMemberList(MemberVO vo) {
		System.out.println("===> Mybatis getMemberList() 호출");
		return mybatis.selectList("AdminDAO.getMemberList", vo);
		
	}
	
	public MemberVO getMember(MemberVO vo) {
		System.out.println("Mybatis getMember()호출");
		return (MemberVO) mybatis.selectOne("AdminDAO.getMember", vo);
	}

	public void updateMember(MemberVO vo) {
		System.out.println("Mybatis updateMember() 호출");
		mybatis.update("AdminDAO.updateMember", vo);
	}
}
