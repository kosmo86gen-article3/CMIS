package com.cmis.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cmis.dao.AdminDAOImpl;
import com.cmis.dao.MemberDAOImpl;
import com.cmis.domain.MemberVO;

@Service("adminService")
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDAOImpl adminDAO;

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
}
