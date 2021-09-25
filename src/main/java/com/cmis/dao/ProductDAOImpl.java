package com.cmis.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cmis.domain.ProductVO;

@Repository("productDAO")
public class ProductDAOImpl implements ProductDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	/*
	 * @Override public List<ProductVO> getProductList() {
	 * System.out.println("===> Mybatis productDAO getProductList() 호출"); return
	 * mybatis.selectList("ProductDAO.getProductList"); }
	 */

	@Override
	public List<ProductVO> getSearchProductList(HashMap map) {
		System.out.println("===> Mybatis productDAO getSearchProductList() 호출");
		System.out.println("HashMap 테스트 : " + map.get("keyword"));
		System.out.println("HashMap 테스트 : " + map.get("product_name"));
		return mybatis.selectList("ProductDAO.getProductList", map);
	}

	@Override
	public int getCountProduct(HashMap map) {
		System.out.println("===> Mybatis productDAO getCountProduct() 호출");
		return mybatis.selectOne("ProductDAO.getCountProduct", map);
	}

	@Override
	public ProductVO getProductDetail(ProductVO vo) {
		System.out.println("===> Mybatis productDAO getProductDetail() 호출");
		return mybatis.selectOne("ProductDAO.getProductDetail", vo);
	}

	@Override
	public List<HashMap> getProductLocationPrice(ProductVO vo) {
		System.out.println("===> Mybatis productDAO getProductLocationPrice() 호출");
		return mybatis.selectList("ProductDAO.getProductLocationPrice", vo);
	}

	@Override
	public List<HashMap> getProductStorePrice(ProductVO vo) {
		System.out.println("===> Mybatis productDAO getProductStorePrice() 호출");
		return mybatis.selectList("ProductDAO.getProductStorePrice", vo);
	}

	@Override
	public List<HashMap> getProductPrices(ProductVO vo) {
		System.out.println("===> Mybatis productDAO getProductPrices() 호출");
		return mybatis.selectList("ProductDAO.getProductPrices", vo);
	}

	@Override
	public List<HashMap> getLowestPriceStore(HashMap lowestMap) {
		System.out.println("===> Mybatis productDAO getLowestPriceStore() 호출");
		return mybatis.selectList("ProductDAO.getLowestPriceStore", lowestMap);
	}

	@Override
	public List<ProductVO> getProductCateList(ProductVO vo) {
		System.out.println("===> Mybatis productDAO getProductCateList() 호출");
		return mybatis.selectList("ProductDAO.getProductCateList", vo);
	}

}