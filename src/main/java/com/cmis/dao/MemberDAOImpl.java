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

		mybatis.insert("MemberDAO.insertMember", vo); 
	}
	
	// 로그인
	public MemberVO userLogin(MemberVO vo) {
		
		System.out.println(vo.getUser_id());
		System.out.println(vo.getMember_pw());
		
		return mybatis.selectOne("MemberDAO.userLogin", vo);
	}

	public MemberVO idCheck_join(MemberVO vo) {
		return mybatis.selectOne("MemberDAO.idCheck", vo);
	}
	
	public MemberVO getMember(String user_id) throws Exception {
		//테스트(컨트롤러) 호출 -> 정보를 저장 -> DB로이동
		MemberVO vo = mybatis.selectOne("MemberDAO.getMember", user_id);
		return vo;
	}

	
	public void updateMember(MemberVO vo) {
		System.out.println("Mybatis updateMember() 호출");
		mybatis.update("MemberDAO.updateMember", vo);
	}

	

	
	
}
