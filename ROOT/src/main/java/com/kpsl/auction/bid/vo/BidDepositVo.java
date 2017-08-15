package com.kpsl.auction.bid.vo;

public class BidDepositVo {
	private String bidDepositCode;
	private String bidCode;
	private	String userBuyerId;
	private String auctionGoodsCode;
	private String userSellerId;
	private int bidDepositPrice;
	private String bidDepositState;
	private String bidDepositDate;
	
	public String getBidDepositCode() {
		return bidDepositCode;
	}

	public void setBidDepositCode(String bidDepositCode) {
		this.bidDepositCode = bidDepositCode;
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

	public int getBidDepositPrice() {
		return bidDepositPrice;
	}

	public void setBidDepositPrice(int bidDepositPrice) {
		this.bidDepositPrice = bidDepositPrice;
	}

	public String getBidDepositState() {
		return bidDepositState;
	}

	public void setBidDepositState(String bidDepositState) {
		this.bidDepositState = bidDepositState;
	}

	public String getBidDepositDate() {
		return bidDepositDate;
	}

	public void setBidDepositDate(String bidDepositDate) {
		this.bidDepositDate = bidDepositDate;
	}


}
