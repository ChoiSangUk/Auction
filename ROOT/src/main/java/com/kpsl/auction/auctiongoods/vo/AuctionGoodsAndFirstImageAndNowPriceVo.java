package com.kpsl.auction.auctiongoods.vo;

public class AuctionGoodsAndFirstImageAndNowPriceVo {
	private AuctionGoodsVo auctionGoodsVo;
	private AuctionGoodsImageVo auctionGoodsImageVo;
	private int nowPrice;
	public AuctionGoodsVo getAuctionGoodsVo() {
		return auctionGoodsVo;
	}
	public void setAuctionGoodsVo(AuctionGoodsVo auctionGoodsVo) {
		this.auctionGoodsVo = auctionGoodsVo;
	}
	public AuctionGoodsImageVo getAuctionGoodsImageVo() {
		return auctionGoodsImageVo;
	}
	public void setAuctionGoodsImageVo(AuctionGoodsImageVo auctionGoodsImageVo) {
		this.auctionGoodsImageVo = auctionGoodsImageVo;
	}
	public int getNowPrice() {
		return nowPrice;
	}
	public void setNowPrice(int nowPrice) {
		this.nowPrice = nowPrice;
	}
	@Override
	public String toString() {
		return "AuctionGoodsAndFirstImageAndNowPriceVo [auctionGoodsVo=" + auctionGoodsVo + ", auctionGoodsImageVo="
				+ auctionGoodsImageVo + ", nowPrice=" + nowPrice + "]";
	}
	
	
}
