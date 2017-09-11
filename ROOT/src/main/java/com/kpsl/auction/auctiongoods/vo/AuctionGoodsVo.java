package com.kpsl.auction.auctiongoods.vo;

public class AuctionGoodsVo {
	private String auctionGoodsCode;  	//경매물품코드(PK)
	private String userId;				//아이디(PK)(FK)
	private String smallCategoryCode;	//소분류코드(FK)
	private String middleCategoryCode;	//중분류코드(FK)
	private String largeCategoryCode;	//대분류코드(FK)
	private String auctionGoodsName;	//물품명
	private String auctionGoodsSys;		//경매방식
	private String auctionGoodsBidSys;	//입찰방식
	private String auctionGoodsContents;//상세내용
	private String auctionGoodsRegistDate;	//경매물품등록일
	private int auctionGoodsTerm;			//경매기간
	private String auctionGoodsStartDate;	//경매시작일
	private String auctionGoodsEndDate;		//경매종료일
	private int auctionGoodsStartPrice;		//시작가
	private int auctionGoodsBidUnit;		//입찰단위
	private String auctionGoodsInstantBuyState;	//즉시구매유무
	private int auctionGoodsInstantBuyPrice;	//즉시구매가
	private String auctionGoodsState;		//등록상태
	private int auctionGoodsHits; 			//조회 수
	private int auctionGoodsBidHits;		//입찰 수 
	private int auctionGoodsDepositPrice;   //판매 보증금
	public String getAuctionGoodsCode() {
		return auctionGoodsCode;
	}
	
	public void setAuctionGoodsCode(String auctionGoodsCode) {
		this.auctionGoodsCode = auctionGoodsCode;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
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
	public String getAuctionGoodsName() {
		return auctionGoodsName;
	}
	public void setAuctionGoodsName(String auctionGoodsName) {
		this.auctionGoodsName = auctionGoodsName;
	}
	public String getAuctionGoodsSys() {
		return auctionGoodsSys;
	}
	public void setAuctionGoodsSys(String auctionGoodsSys) {
		this.auctionGoodsSys = auctionGoodsSys;
	}
	public String getAuctionGoodsBidSys() {
		return auctionGoodsBidSys;
	}
	public void setAuctionGoodsBidSys(String auctionGoodsBidSys) {
		this.auctionGoodsBidSys = auctionGoodsBidSys;
	}
	public String getAuctionGoodsContents() {
		return auctionGoodsContents;
	}
	public void setAuctionGoodsContents(String auctionGoodsContents) {
		this.auctionGoodsContents = auctionGoodsContents;
	}
	public String getAuctionGoodsRegistDate() {
		return auctionGoodsRegistDate;
	}
	public void setAuctionGoodsRegistDate(String auctionGoodsRegistDate) {
		this.auctionGoodsRegistDate = auctionGoodsRegistDate;
	}
	public int getAuctionGoodsTerm() {
		return auctionGoodsTerm;
	}
	public void setAuctionGoodsTerm(int auctionGoodsTerm) {
		this.auctionGoodsTerm = auctionGoodsTerm;
	}
	public String getAuctionGoodsStartDate() {
		return auctionGoodsStartDate;
	}
	public void setAuctionGoodsStartDate(String auctionGoodsStartDate) {
		this.auctionGoodsStartDate = auctionGoodsStartDate;
	}
	public String getAuctionGoodsEndDate() {
		return auctionGoodsEndDate;
	}
	public void setAuctionGoodsEndDate(String auctionGoodsEndDate) {
		this.auctionGoodsEndDate = auctionGoodsEndDate;
	}
	public int getAuctionGoodsStartPrice() {
		return auctionGoodsStartPrice;
	}
	public void setAuctionGoodsStartPrice(int auctionGoodsStartPrice) {
		this.auctionGoodsStartPrice = auctionGoodsStartPrice;
	}
	public int getAuctionGoodsBidUnit() {
		return auctionGoodsBidUnit;
	}
	public void setAuctionGoodsBidUnit(int auctionGoodsBidUnit) {
		this.auctionGoodsBidUnit = auctionGoodsBidUnit;
	}
	public String getAuctionGoodsInstantBuyState() {
		return auctionGoodsInstantBuyState;
	}
	public void setAuctionGoodsInstantBuyState(String auctionGoodsInstantBuyState) {
		this.auctionGoodsInstantBuyState = auctionGoodsInstantBuyState;
	}
	public int getAuctionGoodsInstantBuyPrice() {
		return auctionGoodsInstantBuyPrice;
	}
	public void setAuctionGoodsInstantBuyPrice(int auctionGoodsInstantBuyPrice) {
		this.auctionGoodsInstantBuyPrice = auctionGoodsInstantBuyPrice;
	}
	public String getAuctionGoodsState() {
		return auctionGoodsState;
	}
	public void setAuctionGoodsState(String auctionGoodsState) {
		this.auctionGoodsState = auctionGoodsState;
	}


	public int getAuctionGoodsHits() {
		return auctionGoodsHits;
	}

	public int getAuctionGoodsDepositPrice() {
		return auctionGoodsDepositPrice;
	}

	public void setAuctionGoodsDepositPrice(int auctionGoodsDepositPrice) {
		this.auctionGoodsDepositPrice = auctionGoodsDepositPrice;
	}

	public void setAuctionGoodsHits(int auctionGoodsHits) {
		this.auctionGoodsHits = auctionGoodsHits;
	}

	public int getAuctionGoodsBidHits() {
		return auctionGoodsBidHits;
	}

	public void setAuctionGoodsBidHits(int auctionGoodsBidHits) {
		this.auctionGoodsBidHits = auctionGoodsBidHits;
	}

	@Override
	public String toString() {
		return "AuctionGoodsVo [auctionGoodsCode=" + auctionGoodsCode + ", userId=" + userId + ", smallCategoryCode="
				+ smallCategoryCode + ", middleCategoryCode=" + middleCategoryCode + ", largeCategoryCode="
				+ largeCategoryCode + ", auctionGoodsName=" + auctionGoodsName + ", auctionGoodsSys=" + auctionGoodsSys
				+ ", auctionGoodsBidSys=" + auctionGoodsBidSys + ", auctionGoodsContents=" + auctionGoodsContents
				+ ", auctionGoodsRegistDate=" + auctionGoodsRegistDate + ", auctionGoodsTerm=" + auctionGoodsTerm
				+ ", auctionGoodsStartDate=" + auctionGoodsStartDate + ", auctionGoodsEndDate=" + auctionGoodsEndDate
				+ ", auctionGoodsStartPrice=" + auctionGoodsStartPrice + ", auctionGoodsBidUnit=" + auctionGoodsBidUnit
				+ ", auctionGoodsInstantBuyState=" + auctionGoodsInstantBuyState + ", auctionGoodsInstantBuyPrice="
				+ auctionGoodsInstantBuyPrice + ", auctionGoodsState=" + auctionGoodsState + ", auctionGoodsHits="
				+ auctionGoodsHits + ", auctionGoodsBidHits=" + auctionGoodsBidHits + ", auctionGoodsDepositPrice="
				+ auctionGoodsDepositPrice + "]";
	}
	
}
