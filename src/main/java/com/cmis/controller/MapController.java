package com.cmis.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cmis.domain.ProductVO;
import com.cmis.service.MapService;
import com.google.protobuf.Parser;

@Controller
public class MapController {
	
	@Autowired
	private MapService mapservice;
	
	// 로그인 작동
	@RequestMapping("map.do")
	public String searchShopList(String lat, String lon, Model model,HttpServletResponse response) throws Exception {
						
		if((lon == null)||(lon == "")) {
			response.setContentType("text/html; charset=UTF-8");
	         PrintWriter out = response.getWriter();
	         out.println("<script>alert('위치 정보를 불러올수가 없습니다'); </script>");
	         out.flush();
			return "redirect:index.do";
		}
		else {
		
		HashMap latlon = new HashMap();		
		latlon.put("lon", lon);
		latlon.put("lat", lat);

		
		
		model.addAttribute("storeList", mapservice.getStoreList(latlon));
		
		
		return "map";
		}
	}
	
		// ajax로 shopName 가져옴
		// 매장 물건 검색 ajax
		@RequestMapping(value = "getStoreProductList.do",  produces="application/json;charset=UTF-8")
		@ResponseBody
		public List<HashMap> getStoreProductList(String shopName) {
			return mapservice.getStoreProductList(shopName);

		}
		
		// 물건 검색 ajax
		@RequestMapping(value = "getMapProductList.do",  produces="application/json;charset=UTF-8")
		@ResponseBody
		public List<HashMap> getMapProductList(String productName) {
			return mapservice.getMapProductList(productName);
		}
		
		// 매장 물건 검색 ajax
		@RequestMapping(value = "getProductStoreList.do",  produces="application/json;charset=UTF-8")
		@ResponseBody
		public List<HashMap> getProductStoreList(String lat, String lon, String productName) {
			HashMap map = new HashMap();		
			map.put("lon", lon);
			map.put("lat", lat);
			map.put("productName", productName);
			return mapservice.getProductStoreList(map);
		}

}
