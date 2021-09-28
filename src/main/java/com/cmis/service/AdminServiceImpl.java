package com.cmis.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cmis.dao.AdminDAO;
import com.cmis.dao.AdminDAOImpl;
import com.cmis.dao.MemberDAOImpl;
import com.cmis.domain.MemberVO;
import com.cmis.domain.ProductVO;

@Service("adminService")
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDAO adminDAO;

	@Override
	public List<MemberVO> getMemberList(MemberVO vo) {
		return adminDAO.getMemberList(vo);
	}

	@Override
	public MemberVO getMember(MemberVO vo) {
		return adminDAO.getMember(vo);
	}

	@Override
	public void updateMember(MemberVO vo) {
		adminDAO.updateMember(vo);
	}

	@Override
	public HashMap getMemberJoinCount() {
		return adminDAO.getMemberJoinCount();
	}

	@Override
	public List<HashMap> getAdminBoardCount() {
		return adminDAO.getAdminBoardCount();
	}

	@Override
	public List<ProductVO> getProductViewRank() {
		return adminDAO.getProductViewRank();
	}

	@Override
	public List<HashMap> getProductWishRank() {
		return adminDAO.getProductWishRank();
	}

	@Override
	public List<HashMap> getCommunityRank() {
		return adminDAO.getCommunityRank();
	}

	@Override
	public List<HashMap> getHotPriceShopRank() {
		return adminDAO.getHotPriceShopRank();
	}

	@Override
	public List<HashMap> getMemberAge() {
		return adminDAO.getMemberAge();
	}

	@Override
	public List<HashMap> getCategoryRatio() {
		return adminDAO.getCategoryRatio();
	}
}
