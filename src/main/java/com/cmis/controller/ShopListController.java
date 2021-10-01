package com.cmis.controller;

import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.cmis.service.ShopListService;

@Controller
public class ShopListController {
	
	@Autowired private ShopListService shopListService; 
	@RequestMapping(value="shopList.do")
	public String selectShopList(){	 
		return "shopList";	
	}
	 
	@RequestMapping(value="getShopList.do", produces="application/json;charset=UTF-8" )
	//produces="application/json;charset=UTF-8" : json형식으로 선언
	@ResponseBody //비동기 처리 (ajax)일 때 꼭 추가
	public List<HashMap> getShopList( String distric_code, String shop_kind_code){
		 
		 HashMap districKind = new HashMap();
		 districKind.put("distric_code",distric_code);
		 districKind.put("shop_kind_code",shop_kind_code);
		/*
		 * System.out.println(districKind.get("distric_code"));
		 * System.out.println(districKind.get("shop_kind_code"));
		 */
		 List<HashMap> list = shopListService.getShopList(districKind);
		
		 return list;
	 }
}


	
	

