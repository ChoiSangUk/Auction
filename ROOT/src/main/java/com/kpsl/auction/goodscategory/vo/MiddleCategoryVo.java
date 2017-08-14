package com.kpsl.auction.goodscategory.vo;

public class MiddleCategoryVo {
	private String middleCategoryCode; 	//중분류코드(PK)
	private String largeCategoryCode; 	//대분류코드명(PK)(FK)
	private String middleCategoryName; 	//중분류카테고리명
	private String middleCategoryState; //중분류카테고리상태
	
	public String getMiddleCategoryCode() {
		return middleCategoryCode;
	}
	public void setMiddleCategoryCode(String middleCategoryCode) {
		this.middleCategoryCode = middleCategoryCode;
	}
	public String getLargeCategoryCode() {
		return largeCategoryCode;
	}
	public void setLargeCategoryCode(String largeCategoryCode) {
		this.largeCategoryCode = largeCategoryCode;
	}
	public String getMiddleCategoryName() {
		return middleCategoryName;
	}
	public void setMiddleCategoryName(String middleCategoryName) {
		this.middleCategoryName = middleCategoryName;
	}
	public String getMiddleCategoryState() {
		return middleCategoryState;
	}
	public void setMiddleCategoryState(String middleCategoryState) {
		this.middleCategoryState = middleCategoryState;
	}
	@Override
	public String toString() {
		return "MiddleCategoryVo [middleCategoryCode=" + middleCategoryCode + ", largeCategoryCode=" + largeCategoryCode
				+ ", middleCategoryName=" + middleCategoryName + ", middleCategoryState=" + middleCategoryState + "]";
	}
	
}
