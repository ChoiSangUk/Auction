package com.kpsl.auction.goodscategory.vo;

public class LargeCategoryVo {
	private String largeCategoryCode;  //대분류코드(PK)
	private String largeCategoryName; 	//대분류카테고리명
	public String getLargeCategoryCode() {
		return largeCategoryCode;
	}
	public void setLargeCategoryCode(String largeCategoryCode) {
		this.largeCategoryCode = largeCategoryCode;
	}
	public String getLargeCategoryName() {
		return largeCategoryName;
	}
	public void setLargeCategoryName(String largeCategoryName) {
		this.largeCategoryName = largeCategoryName;
	}
	@Override
	public String toString() {
		return "LargeCategoryVo [largeCategoryCode=" + largeCategoryCode + ", largeCategoryName=" + largeCategoryName
				+ "]";
	}
	 
}
