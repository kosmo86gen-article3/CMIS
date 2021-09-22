package com.cmis.dao;

import java.util.HashMap;
import java.util.List;

import com.cmis.domain.ProductVO;

public interface MapDAO {

	List<HashMap> getStoreList(HashMap latlon);
	
	List<HashMap> getStoreProductList(String shopName);
	
	List<HashMap> getMapProductList(String productName);
	
	List<HashMap> getProductStoreList(HashMap map);
}
