package com.cmis.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cmis.dao.ShopListDAOImpl;

@Service("shopListService")
public class ShopListServiceImpl implements ShopListService {

	@Autowired
	private ShopListDAOImpl shopListDAO;
	
	//매장 목록 출력
	public List<HashMap> getShopList(HashMap districKind) {
		
		return shopListDAO.getShopList(districKind);
	}
	
}


