package com.cmis.service;


import java.util.HashMap;
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

	HashMap getMemberJoinCount();

	List<HashMap> getAdminBoardCount();

	List<ProductVO> getProductViewRank();

	List<HashMap> getProductWishRank();

	List<HashMap> getCommunityRank();

	List<HashMap> getHotPriceShopRank();

	List<HashMap> getMemberAge();

	List<HashMap> getCategoryRatio();

	List<HashMap> getMemberWeekJoin();
	
	
	
	
}
