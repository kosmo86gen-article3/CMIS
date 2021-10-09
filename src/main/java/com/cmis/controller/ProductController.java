package com.cmis.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.Socket;
import java.net.UnknownHostException;
import java.util.ArrayList;
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
	public void productlist(Model model, String page, String keyword){

		/*
		 * //상품 목록 DB값 불러와 VIEW에 뿌려주는 MODEL,서비스 호출 model.addAttribute("productList",
		 * productService.getProductList());
		 */

		// ***************************************************
		// 상품 목록 페이징 처리 및 상품 리스트 반복 출력
		// ***************************************************

		HashMap searchMap = new HashMap();
		searchMap.put("keyword", keyword);
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
		int pageCount = 8;

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
	public void productdetails(ProductVO vo, String lat, String lon, Model model) throws IOException {

		// 위도 경도가 없을 경우 학원 위도 경도로 설정
		if(lat == null || lat == "") {
			lat = "37.478687034753904";
			lon = "126.87865557160939";
		}
		// 상품 코드로 상품 상세 정보 받아옴
		vo = productService.getProductDetail(vo);

		// 상품 상세페이지 조회수 증가
		productService.productViewCount(vo);
		
		// 상품 코드로 지역별 /업태별 상품 가격 받아옴
		model.addAttribute("productLocationPrice", productService.getProductLocationPrice(vo));
		model.addAttribute("productStorePrice", productService.getProductStorePrice(vo));
		model.addAttribute("productDetail", vo);

		// 가격 예측 소켓 통신
		Socket socket = new Socket("122.45.33.118", 9999);

		// 데이터 전송을 보낼 output 선언
		OutputStream output = socket.getOutputStream();

		byte[] data = vo.getProduct_name().getBytes(); // getBytes() 메서드를 사용 해 문자열을 Byte로 바꿔준다
		output.write(data);

		// 데이터 전송을 받을 input 선언

		InputStream input = socket.getInputStream();

		BufferedReader reader = new BufferedReader(new InputStreamReader(input));

		List<String> futurePrice = new ArrayList<String>();
		
	    while (reader.readLine() != null) {
	    	futurePrice.add(reader.readLine());
	    }		
		// 소켓 연결 종료
		socket.close();
		
		// 주별 평균 가격
		model.addAttribute("productPrices", productService.getProductPrices(vo));
		// 예측 가격
		model.addAttribute("productFuturePrices", futurePrice);
		
		HashMap lowestMap = new HashMap();
		lowestMap.put("productName", vo.getProduct_name());
		lowestMap.put("lat", lat);
		lowestMap.put("lon", lon);
		// 접속 위치 기반 최저가 매장
		model.addAttribute("lowestPriceStore", productService.getLowestPriceStore(lowestMap));
		
		// 가격 예측 소켓 통신
		Socket socket2 = new Socket("122.45.33.118", 9998);

		// 데이터 전송을 보낼 output 선언
		OutputStream output2 = socket2.getOutputStream();

		byte[] data2 = vo.getProduct_name().getBytes(); // getBytes() 메서드를 사용 해 문자열을 Byte로 바꿔준다
		output2.write(data2);

		// 데이터 전송을 받을 input 선언

		InputStream input2 = socket2.getInputStream();

		BufferedReader reader2 = new BufferedReader(new InputStreamReader(input2));

		List<HashMap> newsList = new ArrayList<HashMap>();
				
	    while (reader2.readLine() != null) {
	    	HashMap map = new HashMap();
	    	map.put("newsTitle", reader2.readLine());
	    	map.put("newsLink", reader2.readLine());
	    	newsList.add(map);
	    }		
	   
		// 소켓 연결 종료
		socket2.close();
		
		// 상품 뉴스 모델
		model.addAttribute("productNewsList", newsList);
		
		// 같은 카테고리 상품 리스트 정보
		model.addAttribute("productCateList", productService.getProductCateList(vo));
		
	}

	// 이미지 검색 ajax
	@RequestMapping(value = "imageSearch.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public HashMap imageSearch(@RequestParam("imageUpload") MultipartFile multi, HttpSession session,
			HttpServletRequest request, HttpServletResponse response) throws IOException {

		String userId = (String) session.getAttribute("userId");
		System.out.println("imageSearch 테스트 : " + userId);
		// 각자 프로젝트 로컬 경로로 변경
		String path = "C:/dev/zFinalProject/src/main/webapp/resources/img/searchImage/";
		// 결과값 리턴할 hashmap 선언
		HashMap map = new HashMap();
		map.put("userId", userId);

		try {

			String originFilename = multi.getOriginalFilename();
			String extName = originFilename.substring(originFilename.lastIndexOf("."), originFilename.length());
			long size = multi.getSize();
			// 파일 저장 경로 + 파일명
			String saveFileName = path + userId + extName;

			System.out.println("uploadpath : " + path);

			System.out.println("originFilename : " + originFilename);
			System.out.println("extensionName : " + extName);
			System.out.println("size : " + size);
			System.out.println("saveFileName : " + saveFileName);

			if (!multi.isEmpty()) {
				File file = new File(path, userId + ".jpg");
				multi.transferTo(file);

				// 파이썬과 통신하기 위해 웹 소켓 선언

				Socket socket = new Socket("localhost", 10000);

				// 데이터 전송을 보낼 output 선언
				OutputStream output = socket.getOutputStream();

				// 나중에 userID로 전송 예쩡
				byte[] data = saveFileName.getBytes(); // getBytes() 메서드를 사용 해 문자열을 Byte로 바꿔준다
				output.write(data);

				// 데이터 전송을 받을 input 선언

				InputStream input = socket.getInputStream();

				BufferedReader reader = new BufferedReader(new InputStreamReader(input));

				String result = reader.readLine();

				System.out.println(result);
				
				map.put("keyword", result);
				map.put("product_name", "title");

				List<ProductVO> list = productService.getSearchProductList(map);
				
				map.put("product_code", list.get(0).getProduct_code());
				map.put("product_db_name", list.get(0).getProduct_name());
				
				// 소켓 연결 종료
				socket.close();

				return map;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return map;
	}
}