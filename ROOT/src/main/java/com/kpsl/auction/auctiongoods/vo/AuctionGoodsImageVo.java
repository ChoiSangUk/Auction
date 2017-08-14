package com.kpsl.auction.auctiongoods.vo;

public class AuctionGoodsImageVo {
	private String auctionGoodsImageCode; 		//경매물품이미지코드(PK)
	private String auctionGoodsCode;			// 경매물품코드(FK)
	private String userId; 						//아이디(FK)
	private String auctionGoodsImageName; 		//이미지명
	private String auctionGoodsImageAlertName;	//변경된 이미지명
	public String getAuctionGoodsImageCode() {
		return auctionGoodsImageCode;
	}
	public void setAuctionGoodsImageCode(String auctionGoodsImageCode) {
		this.auctionGoodsImageCode = auctionGoodsImageCode;
	}
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
	public String getAuctionGoodsImageName() {
		return auctionGoodsImageName;
	}
	public void setAuctionGoodsImageName(String auctionGoodsImageName) {
		this.auctionGoodsImageName = auctionGoodsImageName;
	}
	public String getAuctionGoodsImageAlertName() {
		return auctionGoodsImageAlertName;
	}
	public void setAuctionGoodsImageAlertName(String auctionGoodsImageAlertName) {
		this.auctionGoodsImageAlertName = auctionGoodsImageAlertName;
	}
	@Override
	public String toString() {
		return "AuctionGoodsImageVo [auctionGoodsImageCode=" + auctionGoodsImageCode + ", auctionGoodsCode="
				+ auctionGoodsCode + ", userId=" + userId + ", auctionGoodsImageName=" + auctionGoodsImageName
				+ ", auctionGoodsImageAlertName=" + auctionGoodsImageAlertName + "]";
	}
	
}
