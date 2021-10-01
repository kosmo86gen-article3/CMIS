package com.cmis.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;




@Repository("shopListDAO")
public class ShopListDAOImpl implements ShopListDAO {

	@Autowired
	private SqlSessionTemplate mybatis; 

	@Override
	public List<HashMap> getShopList(HashMap districKind){ 
		System.out.println("==> Mybatis getShopList() 호출");
		return mybatis.selectList("ShopListDAO.getShopList",districKind);	
	}
}