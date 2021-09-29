package com.cmis.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cmis.dao.PriceCompareDAO;
import com.cmis.domain.ProductVO;

@Service("priceCompareService")
public class PriceCompareServiceImpl implements PriceCompareService {

	@Autowired
	private PriceCompareDAO priceCompareDAO;


	public List<String> getCompareStoreList(HashMap map) {
		return priceCompareDAO.getCompareStoreList(map);
	}


	public List<HashMap> getCompareStore(HashMap map) {
		return priceCompareDAO.getCompareStore(map);
	}


}