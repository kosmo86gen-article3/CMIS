package com.cmis.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cmis.domain.WishVO;


@Repository("wishDAO")
public class WishDAOImpl implements WishDAO {

	@Autowired
	private SqlSessionTemplate mybatis; 
	
	
	public void addWishList(WishVO wishVO) { 
		mybatis.insert("WishDAO.addWishList",wishVO);
	}
	
	public List<WishVO> getWishList(String userId){ 
		System.out.println("==> Mybatis getWishList() 호출");
		return mybatis.selectList("WishDAO.getWishList",userId);	
	}
	// 찜 추가
	public int insertWish(WishVO wishVO) {
		System.out.println("==> Mybatis insertWish() 호출");
		return mybatis.insert("WishDAO.insertWish", wishVO);
	}
	
	// 찜 삭제
	public int deleteWish(WishVO wishVO) {
		
		System.out.println("==> Mybatis deleteWish() 호출");
		System.out.println("아이디 : " + wishVO.getMember_id());
		System.out.println("상품 번호 : " +  wishVO.getProduct_code());
		System.out.println("찜 번호 : " + wishVO.getWish_num());
		return mybatis.delete("WishDAO.deleteWish", wishVO);
	}

	// 찜 중복 체크
	public int overlapWish(WishVO wishVO) {
		System.out.println("==> Mybatis overlapWish() 호출");
		return mybatis.selectOne("WishDAO.overlapWish", wishVO);
	}
}
