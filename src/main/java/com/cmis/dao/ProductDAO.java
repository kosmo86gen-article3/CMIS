package com.cmis.dao;

import java.util.HashMap;
import java.util.List;

import com.cmis.domain.ProductVO;

public interface ProductDAO {

	// 상품 데이터 리스트
	/* public List<ProductVO> getProductList(); */

	// 상품 검색 select
	public List<ProductVO> getSearchProductList(HashMap map);

	// 상품 카운트 select
	public int getCountProduct(HashMap map);

	public ProductVO getProductDetail(ProductVO vo);

	public List<HashMap> getProductLocationPrice(ProductVO vo);

	public List<HashMap> getProductStorePrice(ProductVO vo);

	public List<HashMap> getProductPrices(ProductVO vo);

	public List<HashMap> getLowestPriceStore(HashMap lowestMap);

	public List<ProductVO> getProductCateList(ProductVO vo);
}