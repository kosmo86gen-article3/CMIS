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

}