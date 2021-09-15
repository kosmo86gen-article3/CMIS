package com.cmis.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cmis.domain.ProductVO;
import com.cmis.service.ProductService;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	//상품 목록 페이지 요청
	@RequestMapping("productList.do")
	public void productlist(Model model, String page) {
		
		//상품 목록 DB값 불러와 VIEW에 뿌려주는 MODEL,서비스 호출
		model.addAttribute("productList", productService.getProductList()); 
		
		
		//***************************************************
		//상품 목록 페이징 처리 및 상품 리스트 반복 출력
		//***************************************************
		
		int maxNum = 441; //상품테이블 갯수
		
		if(page==null) { //페이지 받아온 게 없을때 1로 
			page = "1";	
		}
		
		int pageNum = Integer.parseInt(page); //int로 형변환
		
		//페이지 수가 1 미만인 경우 1로 변경
		if(pageNum <1)
			pageNum = 1;
		
		//한 페이지에 몇 건 보여줄건지
		int pageCount = 10;
		
		//출력할 첫번째 데이터
		int min = (pageNum -1) * pageCount;
		
		//출력할 마지막 데이터
		int max = (pageNum * pageCount)-1 ;
		
		//전체 페이지 계산
		int totPage = (int)Math.ceil(((double)maxNum / (double)pageCount)); //441 / 8 = 55.** 값 올림
		
		//현재 페이지가 max 페이지 보다 크면 total 페이지로 향하게
		if(pageNum>totPage)
			pageNum = totPage;
		
		//현재 페이지에서 출력할 최소 페이지
		int minPage = pageNum - 4;
		
		//1보다 작으면 1로 변경
		if(minPage < 1)
			minPage = 1;
		
		//최대 페이지
		
		int maxPage = pageNum + 4;
		
		if(maxPage > totPage)
			maxPage = totPage;
		
		HashMap pageMap = new HashMap();
		pageMap.put("min", min);
		pageMap.put("max", max);
		pageMap.put("minPage", minPage);
		pageMap.put("maxPage", maxPage);
		pageMap.put("totPage", totPage);
		pageMap.put("currentPage", pageNum);
		
		model.addAttribute("pageMap", pageMap);
		
		
		//*************************************************
		//상품 목록 검색기능
		//*************************************************
		
		
		
		
		
	}
	
		//상품 상세 페이지 요청
		@RequestMapping("productdetails.do")
		public void productdetails() {
			
		}
}
