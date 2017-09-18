package com.kpsl.auction.successfullBid.vo;

public class SuccessBidVo {
	private String successfulBidCode;
	private String bidCode;
	private String userBuyerId;
	private int successfulBidPrice;
	private String successfulBidDate;
	private String auctionGoodsCode;
	private String userSellerId;
	
	public String getSuccessfulBidCode() {
		return successfulBidCode;
	}

	public void setSuccessfulBidCode(String successfulBidCode) {
		this.successfulBidCode = successfulBidCode;
	}

	public String getBidCode() {
		return bidCode;
	}

	public void setBidCode(String bidCode) {
		this.bidCode = bidCode;
	}

	public String getUserBuyerId() {
		return userBuyerId;
	}

	public void setUserBuyerId(String userBuyerId) {
		this.userBuyerId = userBuyerId;
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

	public String getAuctionGoodsCode() {
		return auctionGoodsCode;
	}

	public void setAuctionGoodsCode(String auctionGoodsCode) {
		this.auctionGoodsCode = auctionGoodsCode;
	}

	public String getUserSellerId() {
		return userSellerId;
	}

	public void setUserSellerId(String userSellerId) {
		this.userSellerId = userSellerId;
	}
}
