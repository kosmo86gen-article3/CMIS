package com.cmis.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cmis.domain.WishVO;
import com.cmis.service.WishService;



// jsp -> 컨트롤러 -> 서비스 -> DAO -> mybatis -> Mapper


@Controller
public class WishController {

	@Autowired 
	private WishService wishService;
	
	@ResponseBody //비동기 처리 (ajax)일 때 꼭 추가
	
	@RequestMapping(value="ajaxHeartList",produces="application/text;charset=UTF-8")
	
	
	public String ajaxHeartList(String product_name,String product_imgSrc, HttpSession session) {
			
		
		String message = "찜목록에 담겼습니다.";
		String userId = (String)session.getAttribute("userId"); 
		System.out.println(userId);
		
		//이미지이름에서 product_code를 추출하기 위한 절차
		String productCodeSrc = product_imgSrc.split("/")[3];
		//resources/img/images/821.jpg 에서 "/"로 나누고 0부터 3번째에 있는 값을 변수에 저장
		// productCodeSrc => 821.jpg
		int productCodePos = productCodeSrc.lastIndexOf(".");
		String productCode = productCodeSrc.substring(0,productCodePos);
		
		//ajax에서 가져온 값들을 wishVO에 넣는다
		WishVO wishVO = new WishVO();
		wishVO.setMember_id(userId);
		wishVO.setProduct_code(Integer.parseInt(productCode)); //wishVO의 product_code가 int형이기 때문에 형변환
		wishVO.setProduct_name(product_name);
		
		wishService.addWishList(wishVO);
		
		return message;
	}
	
	//관심물품(찜목록) 조회
	@RequestMapping(value = "wishList.do", produces="application/text;charset=UTF-8") 
	public String wishList(Model m, HttpSession session) {
		String userId = (String)session.getAttribute("userId"); 
		System.out.println(userId);
		
		if(userId== null) {
			return "loginPage";
		}
		m.addAttribute("wishList", wishService.getWishList(userId));
		return "wishList";	
	}
	
	//상품리스트에서 중복으로 클릭시 찜 삭제 (AJAX) 
	@RequestMapping(value = "deleteWish.do", produces="application/text;charset=UTF-8")
	@ResponseBody
	public String deleteWish(WishVO wishVO) {
		if(wishVO.getMember_id().equals(null) || wishVO.getProduct_code() == 0)
			return "에러가 발생했습니다";
		int result = wishService.deleteWish(wishVO);
		if(result == 1)
			return "찜 목록에서 삭제하였습니다";
		else
			return "에러가 발생했습니다";
	}
	
	//ajax 찜목록에서 개별삭제 / 전체 삭제
	@RequestMapping(value="dropWishlist.do",produces="application/text;charset=UTF-8")
	@ResponseBody
	
	public String dropWishlist(WishVO wishVO) {
		int result = wishService.deleteWish(wishVO);
		System.out.println("찜 목록 삭제 갯수 : " + result);
		if(result > 0)
			return "삭제되었습니다";
		else
			return "찜 목록이 비어있습니다";
	}
}

	
	
	
	

