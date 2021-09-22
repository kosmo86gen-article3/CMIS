package com.cmis.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cmis.domain.ProductVO;

@Repository("mapDAO")
public class MapDAOImpl implements MapDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
		
	public List<HashMap> getStoreList(HashMap latlon) {
	      System.out.println("===> Mybatis mapDAO getStoreList() 호출");
	      return mybatis.selectList("MapDAO.getStoreList", latlon);
	   }

	public List<HashMap> getStoreProductList(String shopName) {
		System.out.println("===> Mybatis mapDAO getStoreProductList() 호출");
		return mybatis.selectList("MapDAO.getStoreProductList", shopName);
	}

	public List<HashMap> getMapProductList(String productName) {
		System.out.println("===> Mybatis mapDAO getMapProductList() 호출");
		return mybatis.selectList("MapDAO.getMapProductList", productName);
	}
	
	public List<HashMap> getProductStoreList(HashMap map) {
		System.out.println("===> Mybatis mapDAO getProductStoreList() 호출");
		return mybatis.selectList("MapDAO.getProductStoreList", map);
	}

	

	
}
