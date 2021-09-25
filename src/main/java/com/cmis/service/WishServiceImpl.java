package com.cmis.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cmis.dao.WishDAO;
import com.cmis.dao.WishDAOImpl;
import com.cmis.domain.WishVO;




@Service("wishService")
public class WishServiceImpl implements WishService {
	
	

	@Autowired
	private WishDAOImpl wishDAO;
	
	//찜목록 추가
	public void addWishList(WishVO wishVO) {
		wishDAO.addWishList(wishVO);
	}
	
	//찜목록 출력
	public List<WishVO> getWishList(String userId) {
		return wishDAO.getWishList(userId);
	}
	// 찜 삭제
	public int deleteWish(WishVO wishVO) {
		return wishDAO.deleteWish(wishVO);
	}
	// 찜 중복 확인
	public int overlapWish(WishVO wishVO) {
		return wishDAO.overlapWish(wishVO);
	}
}


