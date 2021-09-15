package com.cmis.dao;

import java.util.List;

import com.cmis.domain.ProductVO;

public interface ProductDAO {
	
	//상품 데이터 리스트
	public List<ProductVO> getProductList();
	
}
