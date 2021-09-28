package com.cmis.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cmis.domain.MemberVO;
import com.cmis.domain.ProductVO;

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

	public HashMap getMemberJoinCount() {
		System.out.println("Mybatis getMemberJoinCount() 호출");
		return mybatis.selectOne("AdminDAO.getMemberJoinCount");
	}

	public List<HashMap> getAdminBoardCount() {
		System.out.println("Mybatis getAdminBoardCount() 호출");
		return mybatis.selectList("AdminDAO.getAdminBoardCount");
	}

	public List<ProductVO> getProductViewRank() {
		System.out.println("Mybatis getProductViewRank() 호출");
		return mybatis.selectList("AdminDAO.getProductViewRank");
	}

	public List<HashMap> getProductWishRank() {
		System.out.println("Mybatis getProductWishRank() 호출");
		return mybatis.selectList("AdminDAO.getProductWishRank");
	}

	public List<HashMap> getCommunityRank() {
		System.out.println("Mybatis getCommunityRank() 호출");
		return mybatis.selectList("AdminDAO.getCommunityRank");
	}

	public List<HashMap> getHotPriceShopRank() {
		System.out.println("Mybatis getHotPriceShopRank() 호출");
		return mybatis.selectList("AdminDAO.getHotPriceShopRank");
	}

	public List<HashMap> getMemberAge() {
		System.out.println("Mybatis getMemberAge() 호출");
		return mybatis.selectList("AdminDAO.getMemberAge");
	}

	public List<HashMap> getCategoryRatio() {
		System.out.println("Mybatis getCategoryRatio() 호출");
		return mybatis.selectList("AdminDAO.getCategoryRatio");
	}
	
	
}
