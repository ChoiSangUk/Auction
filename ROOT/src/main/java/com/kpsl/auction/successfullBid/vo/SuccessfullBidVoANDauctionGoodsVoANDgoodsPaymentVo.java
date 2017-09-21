package com.kpsl.auction.successfullBid.vo;

public class SuccessfullBidVoANDauctionGoodsVoANDgoodsPaymentVo {
	private String auctionGoodsName;
	private int successfulBidPrice;
	private String successfulBidDate;
	private String goodsPaymentState ;
	private String auctionGoosCode;
	private String successfulBidCode;
	private String userBuyerId;
	
	
	public String getAuctionGoosCode() {
		return auctionGoosCode;
	}
	public void setAuctionGoosCode(String auctionGoosCode) {
		this.auctionGoosCode = auctionGoosCode;
	}
	public String getSuccessfulBidCode() {
		return successfulBidCode;
	}
	public void setSuccessfulBidCode(String successfulBidCode) {
		this.successfulBidCode = successfulBidCode;
	}
	public String getUserBuyerId() {
		return userBuyerId;
	}
	public void setUserBuyerId(String userBuyerId) {
		this.userBuyerId = userBuyerId;
	}
	public String getauctionGoodsName() {
		return auctionGoodsName;
	}
	public void setauctionGoodsName(String auctionGoodsName) {
		this.auctionGoodsName = auctionGoodsName;
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
	public String getGoodsPaymentState() {
		return goodsPaymentState;
	}
	public void setGoodsPaymentState(String goodsPaymentState) {
		this.goodsPaymentState = goodsPaymentState;
	}

}
