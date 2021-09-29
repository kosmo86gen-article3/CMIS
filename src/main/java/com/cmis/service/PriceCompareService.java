package com.cmis.service;

import java.util.HashMap;
import java.util.List;

import com.cmis.domain.ProductVO;

public interface PriceCompareService {

	public List<String> getCompareStoreList(HashMap map);

	public List<HashMap> getCompareStore(HashMap map);



}