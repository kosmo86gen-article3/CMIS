package com.cmis.service;

import java.util.HashMap;
import java.util.List;

import com.cmis.domain.ProductVO;

public interface MapService {
	
	//매장 리스트 조회
	List<HashMap> getStoreList(HashMap latlon);
	
	List<HashMap> getStoreProductList(String shopName); 
	
	List<HashMap> getMapProductList(String productName);
	
	List<HashMap> getProductStoreList(HashMap map);
}
