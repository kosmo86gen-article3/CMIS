package com.cmis.domain;

public class WishVO {

	private String member_id;
	private String product_name;
	private int product_code;
	private int wish_num;
	private int product_last_average_price;
	private int product_last_min_price;
	
	
	
	public WishVO() {

	}
	
	public int getProduct_last_average_price() {
		return product_last_average_price;
	}

	public void setProduct_last_average_price(int product_last_average_price) {
		this.product_last_average_price = product_last_average_price;
	}

	public int getProduct_last_min_price() {
		return product_last_min_price;
	}

	public void setProduct_last_min_price(int product_last_min_price) {
		this.product_last_min_price = product_last_min_price;
	}
	
	
	
	
	public WishVO(String member_id, String product_name, int product_code, int wish_num) {
		super();
		this.member_id = member_id;
		this.product_name = product_name;
		this.product_code = product_code;
		this.wish_num = wish_num;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getProduct_code() {
		return product_code;
	}
	public void setProduct_code(int product_code) {
		this.product_code = product_code;
	}
	public int getWish_num() {
		return wish_num;
	}
	public void setWish_num(int wish_num) {
		this.wish_num = wish_num;
	}
	
	
}
