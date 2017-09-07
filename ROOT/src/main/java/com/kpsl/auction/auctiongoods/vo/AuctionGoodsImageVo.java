package com.kpsl.auction.auctiongoods.vo;

public class AuctionGoodsImageVo {
	private String auctionGoodsImageCode; 		//경매물품이미지코드(PK)
	private String auctionGoodsCode;			// 경매물품코드(FK)
	private String auctionGoodsImagePath; 		//이미지 경로
	private int auctionGoodsImageNum;		//사진 순서
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
	public String getAuctionGoodsImagePath() {
		return auctionGoodsImagePath;
	}
	public void setAuctionGoodsImagePath(String auctionGoodsImagePath) {
		this.auctionGoodsImagePath = auctionGoodsImagePath;
	}
	 
	public int getAuctionGoodsImageNum() {
		return auctionGoodsImageNum;
	}
	public void setAuctionGoodsImageNum(int auctionGoodsImageNum) {
		this.auctionGoodsImageNum = auctionGoodsImageNum;
	}
	@Override
	public String toString() {
		return "AuctionGoodsImageVo [auctionGoodsImageCode=" + auctionGoodsImageCode + ", auctionGoodsCode="
				+ auctionGoodsCode + ", auctionGoodsImagePath=" + auctionGoodsImagePath + ", auctionGoodsImageNum="
				+ auctionGoodsImageNum + "]";
	}
	
	
	
	
}
