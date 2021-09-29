package com.cmis.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cmis.service.MapService;
import com.cmis.service.PriceCompareService;

@Controller
public class PriceCompareController {

	@Autowired
	private PriceCompareService priceCompareService;
	@Autowired
	private MapService mapservice;

	@RequestMapping("price_compare.do")
	public String compareList(Model model, HttpSession session, String lat, String lon) {
		// 세션 상품목록이 비어있지 않을 경우
		if (session.getAttribute("product_list") != null) {
			// 상품 목록을 String으로 받음
			String product_list = (String) session.getAttribute("product_list");
			System.out.println("세션 출력 : " + product_list);
			// 상품 목록을 배열로 변환
			String[] str_list = product_list.split("#");

			System.out.println("리스트 출력 : " + str_list[0]);
			System.out.println("리스트 사이즈 : " + str_list.length);
			// 위도 경도와 배열을 해쉬맵에 보냄
			HashMap map = new HashMap();
			map.put("lat", lat);
			map.put("lon", lon);
			map.put("array", str_list);
			// 위치 기반 가장 저렴한 매장 5개 추출
			List<String> storeList = priceCompareService.getCompareStoreList(map);
			// 추출한 매장에서 다시 상품 가격을 추출함
			List<List<HashMap>> compareList = new ArrayList<List<HashMap>>();
			for (int i = 0; i < storeList.size(); i++) {
				map.put("shop_name", storeList.get(i));
				List<HashMap> list_map = priceCompareService.getCompareStore(map);
				System.out.println(list_map.get(0).get("shop_name"));
				System.out.println(list_map.get(0).get("product_name"));
				System.out.println(list_map.get(0).get("sale_price"));
				compareList.add(i, list_map);
			}
			// 상품리스트, 매장리스트, 가격리스트 넘김
			model.addAttribute("productList", str_list);
			model.addAttribute("storeList", storeList);
			model.addAttribute("compareList", compareList);
		}
		return "price_compare";
	}

	// 물건 검색 ajax
	@RequestMapping(value = "productCompareSearch.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<HashMap> productCompareSearch(String product_name) {
		return mapservice.getMapProductList(product_name);
	}

	// 견적 추가 ajax
	@RequestMapping(value = "addProductCompare.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String addProductCompare(String product_name, HttpSession session) {

		// 기존 견적 상품 세션이 없을 경우
		if (session.getAttribute("product_list") == null) {

			session.setAttribute("product_list", product_name + "#");
			System.out.println("현재 상품 세션 : " + product_name);

			return "상품을 견적서에 추가했습니다";

		} else {// 기존 견적 상품 세션이 있을 경우
			String product_list = (String) session.getAttribute("product_list");

			String[] list = product_list.split("#");

			// 배열 중복 확인
			for (int i = 0; i < list.length; i++) {
				String str1 = list[i];
				if (str1.equals(product_name)) {
					System.out.println("중복 => " + i + ". " + product_name);
					return "중복된 상품입니다";
				}
			}

			product_list += product_name + "#";

			session.setAttribute("product_list", product_list);
			System.out.println("현재 상품 세션 : " + product_list);

			return "상품을 견적서에 추가했습니다";
		}
	}

	// 견적 전부 삭제 ajax
	@RequestMapping(value = "removeAllProductCompare.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public void removeAllProductCompare(String product_name, HttpSession session) {

		session.removeAttribute("product_list");

	}

	// 견적 개별 삭제 ajax
	@RequestMapping(value = "removeProductCompare.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String removeProductCompare(String product_name, HttpSession session) {

		// 기존 견적 상품 세션이 있을 경우
		String product_list = (String) session.getAttribute("product_list");

		String[] list = product_list.split("#");

		product_list = "";
		// 배열 중복 확인
		for (int i = 0; i < list.length; i++) {
			String str1 = list[i];
			if (!str1.equals(product_name)) {
				System.out.println(product_name);
				product_list += str1 + "#";
			}
		}

			

			session.setAttribute("product_list", product_list);
			System.out.println("현재 상품 세션 : " + product_list);

			return "상품을 삭제하였습니다";
		
	}
}