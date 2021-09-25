package com.cmis.domain;

import lombok.Data;

@Data
public class ProductVO {
	

//	product_code	int	NO		
//	product_name	varchar(50)	NO		
//	product_detail	varchar(500)	NO		
//	manufactor_code	int	NO		
//	main_category	varchar(50)	NO		
//	sub_category	varchar(50)	NO		
//	product_capacity_division	int	YES		
//	product_capacity_division_code	varchar(45)	NO		
//	product_unit_quantity	varchar(4)	NO		
//	product_unit_seperate_code	varchar(45)	NO		
	
	private int product_code; //상품코드
	private String product_name; //상품명
	private String product_detail; //제조업체 코드
	private int manufactor_code; // 상품단위구분코드
	private String main_category; //상품 메인 카테고리
	private String sub_category; //상품 서브 카테고리
	private float product_last_average_price;//상품 마지막 평균가
	private float product_last_hot_sale_price; //상품 마지막 핫딜가격
	private float product_last_min_price; // 상품 마지막 최저가
	private float product_last_max_price; // 상품 마지막 최대가
	
	private int product_capacity_division;
	private String product_capacity_division_code;
	

	private String product_unit_quantity;
	private String product_unit_seperate_code;
	
	
}
