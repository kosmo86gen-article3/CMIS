package com.cmis.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cmis.dao.ProductDAOImpl;
import com.cmis.domain.ProductVO;

@Service("productService")
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductDAOImpl productDAO;
	
	@Override
	public List<ProductVO> getProductList() {
		System.out.println("getProductListService 호출");
		return productDAO.getProductList();
	}

}
