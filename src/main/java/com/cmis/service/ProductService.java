package com.cmis.service;

import java.util.HashMap;
import java.util.List;

import com.cmis.domain.ProductVO;

public interface ProductService {

	// 상품 리스트 조회
	/* List<ProductVO> getProductList(); */

	List<ProductVO> getSearchProductList(HashMap map);

	int getCountProduct(HashMap map);

	ProductVO getProductDetail(ProductVO vo);

	List<HashMap> getProductLocationPrice(ProductVO vo);

	List<HashMap> getProductStorePrice(ProductVO vo);

	List<HashMap> getProductPrices(ProductVO vo);

	List<HashMap> getLowestPriceStore(HashMap lowestMap);

	List<ProductVO> getProductCateList(ProductVO vo);

}