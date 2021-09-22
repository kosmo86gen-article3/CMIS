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
      return mybatis.selectList("ProductDAO.getProductList",map);
   }

   @Override
   public int getCountProduct(HashMap map) {
      System.out.println("===> Mybatis productDAO getCountProduct() 호출");
      return mybatis.selectOne("ProductDAO.getCountProduct",map);
   }

   
}