package com.cmis.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cmis.dao.ProductDAO;
import com.cmis.domain.ProductVO;

@Service("productService")
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDAO productDAO;

	/*
	 * @Override public List<ProductVO> getProductList() {
	 * System.out.println("getProductListService 호출"); return
	 * productDAO.getProductList(); }
	 */

	@Override
	public List<ProductVO> getSearchProductList(HashMap map) {
		System.out.println("getSearchProductList 호출");
		return productDAO.getSearchProductList(map);
	}

	@Override
	public int getCountProduct(HashMap map) {
		System.out.println("getCountProduct 호출");
		return productDAO.getCountProduct(map);
	}

	@Override
	public ProductVO getProductDetail(ProductVO vo) {
		System.out.println("getProductDetail 호출");
		return productDAO.getProductDetail(vo);
	}

	@Override
	public List<HashMap> getProductLocationPrice(ProductVO vo) {
		System.out.println("getProductLocationPrice 호출");
		return productDAO.getProductLocationPrice(vo);
	}

	@Override
	public List<HashMap> getProductStorePrice(ProductVO vo) {
		System.out.println("getProductStorePrice 호출");
		return productDAO.getProductStorePrice(vo);
	}

	@Override
	public List<HashMap> getProductPrices(ProductVO vo) {
		System.out.println("getProductPrices 호출");
		return productDAO.getProductPrices(vo);
	}

	@Override
	public List<HashMap> getLowestPriceStore(HashMap lowestMap) {
		System.out.println("getLowestPriceStore");
		return productDAO.getLowestPriceStore(lowestMap);
	}

	@Override
	public List<ProductVO> getProductCateList(ProductVO vo) {
		System.out.println("getProductCateList");
		return productDAO.getProductCateList(vo);
	}

}