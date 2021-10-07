package com.cmis.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cmis.domain.BoardVO;
import com.cmis.domain.CommentVO;
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

	//아이디 찾기
	public MemberVO idFind(MemberVO vo) {
		System.out.println("Mybatis idFind() 호출");
		return mybatis.selectOne("MemberDAO.idFind", vo);
	}

	//비밀번호 찾기
	public MemberVO pwFind(MemberVO vo) {
		System.out.println("Mybatis pwFind() 호출");
		return mybatis.selectOne("MemberDAO.pwFind", vo);
	}

	//패스워드 변경
	public int resetMember(MemberVO vo) {
		System.out.println("Mybatis resetMember() 호출");
		return mybatis.update("MemberDAO.resetMember", vo);
	}

	//해당하는 회원의 작성 글 목록
	public List<BoardVO> getMemberBoardList(BoardVO vo) {
		System.out.println("Mybatis getMemberBoardList() 호출");
		return mybatis.selectList("MemberDAO.getMemberBoardList", vo);
	}
	//해당하는 회원의 작성 댓글 목록
	public List<CommentVO> getMemberComment(CommentVO vo) {
		System.out.println("Mybatis getMemberComment() 호출");
		return mybatis.selectList("MemberDAO.getMemberComment", vo);
	}
	

	

	
	
}
