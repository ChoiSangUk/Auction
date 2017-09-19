package com.kpsl.auction.bid.vo;

public class BidVoANDAucntionGoodsVo {
	private String bidCode;
	private String auctionGoodsName;
	private	int bidPrice;
	private String bidDate;
	private String auctionGoodsEndDate;
	private String userBuyerId;
	private String auctionGoodsCode;
	
	
	public String getAuctionGoodsCode() {
		return auctionGoodsCode;
	}
	public void setAuctionGoodsCode(String auctionGoodsCode) {
		this.auctionGoodsCode = auctionGoodsCode;
	}
	public String getBidCode() {
		return bidCode;
	}
	public void setBidCode(String bidCode) {
		this.bidCode = bidCode;
	}
	public String getAuctionGoodsName() {
		return auctionGoodsName;
	}
	public void setAuctionGoodsName(String auctionGoodsName) {
		this.auctionGoodsName = auctionGoodsName;
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
	public String getAuctionGoodsEndDate() {
		return auctionGoodsEndDate;
	}
	public void setAuctionGoodsEndDate(String auctionGoodsEndDate) {
		this.auctionGoodsEndDate = auctionGoodsEndDate;
	}
	public String getUserBuyerId() {
		return userBuyerId;
	}
	public void setUserBuyerId(String userBuyerId) {
		this.userBuyerId = userBuyerId;
	}
		
}
