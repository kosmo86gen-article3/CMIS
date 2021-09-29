package com.cmis.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cmis.domain.ProductVO;

@Repository("priceCompareDAO")
public class PriceCompareDAOImpl implements PriceCompareDAO {

	@Autowired
	private SqlSessionTemplate mybatis;


	public List<String> getCompareStoreList(HashMap map) {
		System.out.println("===> Mybatis PriceDAO getCompareStoreList() 호출");
		return mybatis.selectList("PriceCompareDAO.getCompareStoreList", map);
	}

	public List<HashMap> getCompareStore(HashMap map) {
		System.out.println("===> Mybatis PriceDAO getCompareStore() 호출");
		return mybatis.selectList("PriceCompareDAO.getCompareStore", map);
	}

}