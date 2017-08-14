package com.kpsl.auction.goodscategory.vo;

public class SmallCategoryVo {
	private String smallCategoryCode; 	//소분류코드(PK)
	private String middleCategoryCode; 	//중분류코드(PK)(FK)
	private String largeCategoryCode; 	//대분류코드(PK)(FK)
	private String smallCategoryName; 	//소분류품목
	private String smallCategoryState;	//소분류카테고리상태
	public String getSmallCategoryCode() {
		return smallCategoryCode;
	}
	public void setSmallCategoryCode(String smallCategoryCode) {
		this.smallCategoryCode = smallCategoryCode;
	}
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
	public String getSmallCategoryName() {
		return smallCategoryName;
	}
	public void setSmallCategoryName(String smallCategoryName) {
		this.smallCategoryName = smallCategoryName;
	}
	public String getSmallCategoryState() {
		return smallCategoryState;
	}
	public void setSmallCategoryState(String smallCategoryState) {
		this.smallCategoryState = smallCategoryState;
	}
	@Override
	public String toString() {
		return "SmallCategoryVo [smallCategoryCode=" + smallCategoryCode + ", middleCategoryCode=" + middleCategoryCode
				+ ", largeCategoryCode=" + largeCategoryCode + ", smallCategoryName=" + smallCategoryName
				+ ", smallCategoryState=" + smallCategoryState + "]";
	}

	
}
