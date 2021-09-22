package com.cmis.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.Socket;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.cmis.domain.ProductVO;
import com.cmis.service.ProductService;

@Controller
public class ProductController {

	@Autowired
	private ProductService productService;

	// 상품 목록 페이지 요청
	@RequestMapping("productList.do")
	public void productlist(Model model, String page, @RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "title") String select // 기본 검색 옵션값을 작성자로 한다.
	// 키워드의 기본값을 ""으로 한다.
	)

	{

		/*
		 * //상품 목록 DB값 불러와 VIEW에 뿌려주는 MODEL,서비스 호출 model.addAttribute("productList",
		 * productService.getProductList());
		 */

		// ***************************************************
		// 상품 목록 페이징 처리 및 상품 리스트 반복 출력
		// ***************************************************

		HashMap searchMap = new HashMap();
		searchMap.put("keyword", keyword);
		System.out.println("select 값 : " + select);
		if (select.equals("title")) {
			searchMap.put("product_name", select);
		} else if (select == "product_hot_sale_price") {
			searchMap.put("product_hot_sale_price", select);
		}
		model.addAttribute("productList", productService.getSearchProductList(searchMap));

		int maxNum = productService.getCountProduct(searchMap); // 상품테이블 갯수

		if (page == null) { // 페이지 받아온 게 없을때 1로
			page = "1";
		}

		int pageNum = Integer.parseInt(page); // int로 형변환

		// 페이지 수가 1 미만인 경우 1로 변경
		if (pageNum < 1)
			pageNum = 1;

		// 한 페이지에 몇 건 보여줄건지
		int pageCount = 10;

		// 출력할 첫번째 데이터
		int min = (pageNum - 1) * pageCount;

		// 출력할 마지막 데이터
		int max = (pageNum * pageCount) - 1;

		// 전체 페이지 계산
		int totPage = (int) Math.ceil(((double) maxNum / (double) pageCount)); // 441 / 8 = 55.** 값 올림

		// 현재 페이지가 max 페이지 보다 크면 total 페이지로 향하게
		if (pageNum > totPage)
			pageNum = totPage;

		// 현재 페이지에서 출력할 최소 페이지
		int minPage = pageNum - 4;

		// 1보다 작으면 1로 변경
		if (minPage < 1)
			minPage = 1;

		// 최대 페이지

		int maxPage = pageNum + 4;

		if (maxPage > totPage)
			maxPage = totPage;

		HashMap pageMap = new HashMap();
		pageMap.put("maxNum", maxNum);
		pageMap.put("min", min);
		pageMap.put("max", max);
		pageMap.put("minPage", minPage);
		pageMap.put("maxPage", maxPage);
		pageMap.put("totPage", totPage);
		pageMap.put("currentPage", pageNum);

		model.addAttribute("pageMap", pageMap);

		// *************************************************
		// 상품 목록 검색기능
		// *************************************************

		// map에 저장하기 위해 list를 만들어서 검색옵션과 키워드를 저장한다.
		// List<MemberBoardDTO> list = memberboardservice.listAll(search_option,
		// keyword, start, end);

	}

	// 상품 상세 페이지 요청
	@RequestMapping("productdetails.do")
	public void productdetails() {

	}

	// 이미지 검색 ajax
	@RequestMapping(value = "imageSearch.do",  produces="application/json;charset=UTF-8")
   	@ResponseBody
   	public HashMap imageSearch(@RequestParam("imageUpload") MultipartFile multi, HttpSession session,HttpServletRequest request,HttpServletResponse response) throws IOException {
    	
		String userId = (String) session.getAttribute("userId");
		System.out.println("imageSearch 테스트 : " + userId);
        // 각자 프로젝트 로컬 경로로 변경
        String path = "C:/dev/zFinalProject/src/main/webapp/resources/img/searchImage/";
        HashMap map = new HashMap();
        map.put("result", "");
        map.put("userId", userId);
        
        try {
 
            String originFilename = multi.getOriginalFilename();
            String extName = originFilename.substring(originFilename.lastIndexOf("."),originFilename.length());
            long size = multi.getSize();
            String saveFileName = path + userId + ".jpg";
            
            System.out.println("uploadpath : " + path);
            
            System.out.println("originFilename : " + originFilename);
            System.out.println("extensionName : " + extName);
            System.out.println("size : " + size);
            System.out.println("saveFileName : " + saveFileName);
            
            if(!multi.isEmpty())
            {
            	File file = new File(path, userId + ".jpg");
                multi.transferTo(file);
                
            	// 파이썬과 통신하기 위해 웹 소켓 선언
                
                Socket socket = new Socket("localhost", 10000);
                
                // 데이터 전송을 보낼 output 선언
                OutputStream output = socket.getOutputStream();
                
                // 나중에 userID로 전송 예쩡
                byte[] data = saveFileName.getBytes(); //getBytes() 메서드를 사용 해 문자열을 Byte로 바꿔준다
                output.write(data);
                
                // 데이터 전송을 받을 input 선언
                
                InputStream input = socket.getInputStream();
                
                BufferedReader reader = new BufferedReader(new InputStreamReader(input));

                String result = reader.readLine();
                
                System.out.println(result);
                
                // 소켓 연결 종료
                socket.close();
                
                map.put("result", result);
                
                return map;
            }
        }catch(Exception e)
        {
            System.out.println(e);
        }
             return map;  
   		}
}