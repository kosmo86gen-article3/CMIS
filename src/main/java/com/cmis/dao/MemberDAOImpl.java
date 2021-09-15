package com.cmis.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cmis.domain.MemberVO;

@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	// 회원가입 작동
	public void userReg(MemberVO vo) { 
		System.out.println("daoimpl - 회원가입 작동 호출");
//		System.out.println(vo.getMember_address());
//		System.out.println(vo.getMember_age());
//		System.out.println(vo.getMember_lv());
//		System.out.println(vo.getMember_name());
//		System.out.println(vo.getMember_phone());
//		System.out.println(vo.getMember_pw());
//		System.out.println(vo.getMember_sex());
//		System.out.println(vo.getMember_sns());
//		System.out.println(vo.getUser_id());
		mybatis.insert("MemberDAO.insertMember", vo);
	}
	
	// 로그인
	public MemberVO userLogin(MemberVO vo) {
		
		System.out.println(vo.getUser_id());
		System.out.println(vo.getMember_pw());
		
		return mybatis.selectOne("MemberDAO.userLogin", vo);
	}

}
