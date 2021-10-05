package com.cmis.dao;

import java.util.HashMap;
import java.util.List;

import com.cmis.domain.MemberVO;
import com.cmis.domain.ProductVO;

public interface AdminDAO {

	//관리자의 회원 관리
	public List<MemberVO> getMemberList(MemberVO vo);
	
	public MemberVO getMember(MemberVO vo);
	
	public void updateMember(MemberVO vo);

	public HashMap getMemberJoinCount();

	public List<HashMap> getAdminBoardCount();

	public List<ProductVO> getProductViewRank();

	public List<HashMap> getProductWishRank();

	public List<HashMap> getCommunityRank();

	public List<HashMap> getHotPriceShopRank();

	public List<HashMap> getMemberAge();

	public List<HashMap> getCategoryRatio();

	public List<HashMap> getMemberWeekJoin();
}
