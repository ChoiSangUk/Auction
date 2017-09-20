package com.kpsl.auction.successfullBid.vo;

public class SuccessfullBidVoANDauctionGoodsVo {
	private String aictionGoodsName;
	private String successfulBidCode;
	private String userSellerId;
	private int successfulBidPrice;
	private String successfulBidDate;
	private String auctionGoodsCode;
	private String userBuyerId;
	private String userTotalcash;
	
	public String getAuctionGoodsCode() {
		return auctionGoodsCode;
	}
	public void setAuctionGoodsCode(String auctionGoodsCode) {
		this.auctionGoodsCode = auctionGoodsCode;
	}
	public String getUserBuyerId() {
		return userBuyerId;
	}
	public void setUserBuyerId(String userBuyerId) {
		this.userBuyerId = userBuyerId;
	}
	public String getAuctionGoodsName() {
		return aictionGoodsName;
	}
	public void setAuctionGoodsName(String aucionGoodsName) {
		this.aictionGoodsName = aucionGoodsName;
	}
	public String getUserSellerId() {
		return userSellerId;
	}
	public void setUserSellerId(String userSellerId) {
		this.userSellerId = userSellerId;
	}
	public int getSuccessfulBidPrice() {
		return successfulBidPrice;
	}
	public void setSuccessfulBidPrice(int successfulBidPrice) {
		this.successfulBidPrice = successfulBidPrice;
	}
	public String getSuccessfulBidDate() {
		return successfulBidDate;
	}
	public void setSuccessfulBidDate(String successfulBidDate) {
		this.successfulBidDate = successfulBidDate;
	}
	public String getSuccessfulBidCode() {
		return successfulBidCode;
	}
	public void setSuccessfulBidCode(String successfulBidCode) {
		this.successfulBidCode = successfulBidCode;
	}
	public String getUserTotalcash() {
		return userTotalcash;
	}
	public void setUserTotalcash(String userTotalcash) {
		this.userTotalcash = userTotalcash;
	}

	
	
}
