package com.cmis.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cmis.dao.MemberDAOImpl;
import com.cmis.domain.BoardVO;
import com.cmis.domain.CommentVO;
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

	@Override
	public void joinMemberByGoogle(MemberVO vo) {
		memberDAO.userReg(vo);
		
	}

	@Override
	public MemberVO loginMemberByGoogle(MemberVO vo) {
		MemberVO returnVO = null;
		try {
			returnVO = memberDAO.userLogin(vo);
			System.out.println("S: 로그인 아디: "+vo.getUser_id()+" 비번: "+vo.getMember_pw()+" 이름: "+vo.getMember_name());
		} catch (Exception e) {
			e.printStackTrace();
			returnVO = null; //실행하다 문제가 생겼을때 해당 데이터를 보내지않겠다는 의미 = 예외처리
		}
		return returnVO;
	}
	
	//아이디 찾기
	@Override
	public MemberVO idFind(MemberVO vo) {
		return memberDAO.idFind(vo);
	}

	@Override
	public MemberVO pwFind(MemberVO vo) {
		return memberDAO.pwFind(vo);
	}

	@Override
	public int resetMember(MemberVO vo) {
		System.out.println("서비스 확인 : " + vo.getMember_email());
		System.out.println("서비스 확인 : " + vo.getMember_pw());
		return memberDAO.resetMember(vo);
	}
	
	//해당 회원의 목록 글 조회
	@Override
	public List<BoardVO> getMemberBoardList(BoardVO vo) {
		return memberDAO.getMemberBoardList(vo);
	}
	
	
	//해당 회원의 댓글 목록 조회
	@Override
	public List<CommentVO> getMemberComment(CommentVO vo) {
		return memberDAO.getMemberComment(vo);
	}
	
	
	
	
	
	
	
	
		
		
	
	
}
