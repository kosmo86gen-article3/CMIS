package com.cmis.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cmis.dao.MapDAO;
import com.cmis.dao.ProductDAOImpl;
import com.cmis.domain.ProductVO;

@Service("mapService")
public class MapServiceImpl implements MapService {
	
	@Autowired
	private MapDAO mapDAO;

	public List<HashMap> getStoreList(HashMap latlon) {
		return mapDAO.getStoreList(latlon);
	}

	public List<HashMap> getStoreProductList(String shopName) {
		return mapDAO.getStoreProductList(shopName);
	}
	
	public List<HashMap> getMapProductList(String productName) {
		return mapDAO.getMapProductList(productName);
	}

	public List<HashMap> getProductStoreList(HashMap map) {
		return mapDAO.getProductStoreList(map);
	}


}
