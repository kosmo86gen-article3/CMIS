package com.cmis.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cmis.domain.ProductVO;

@Repository("productDAO")
public class ProductDAOImpl implements ProductDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
		
	@Override
	public List<ProductVO> getProductList() {
		System.out.println("===> Mybatis productDAO getProductList() 호출");
		return mybatis.selectList("ProductDAO.getProductList");
	}

	
}
