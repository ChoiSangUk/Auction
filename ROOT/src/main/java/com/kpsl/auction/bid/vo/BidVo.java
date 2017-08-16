package com.kpsl.auction.bid.vo;

public class BidVo {
	private String bidCode;
	private String userBuyerId;
	private	String auctionGoodsCode;
	private String userSellerId;
	private int bidPrice;
	private String bidDate;
	
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

	public String getAuctionGoodsCode() {
		return auctionGoodsCode;
	}

	public void setAuctionGoodsCode(String auctionGoodsCode) {
		this.auctionGoodsCode = auctionGoodsCode;
	}

	public String getUserSellerID() {
		return userSellerId;
	}

	public void setUserSellerID(String userSellerID) {
		this.userSellerId = userSellerID;
	}

	public int getBidPrice() {
		return bidPrice;
	}

	public void setBidPrice(int bidPrice) {
		this.bidPrice = bidPrice;
	}

	public String getBidDate() {
		return bidDate;
	}

	public void setBidDate(String bidDate) {
		this.bidDate = bidDate;
	}
	
}
