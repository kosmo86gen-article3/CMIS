package com.cmis.dao;

import java.util.List;

import com.cmis.domain.WishVO;

public interface WishDAO {

	public void addWishList(WishVO wishVO);
	
	//찜목록 조회
	public List<WishVO> getWishList(String userId);
	
	//찜목록에 추가
	public int insertWish(WishVO wishVO);
	
	// 찜 삭제
	public int deleteWish(WishVO wishVO);

	// 찜 중복 체크
	public int overlapWish(WishVO wishVO);
	
}
