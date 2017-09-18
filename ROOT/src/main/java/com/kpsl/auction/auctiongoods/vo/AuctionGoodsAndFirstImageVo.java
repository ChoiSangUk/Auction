package com.kpsl.auction.auctiongoods.vo;

public class AuctionGoodsAndFirstImageVo {
	private AuctionGoodsVo auctionGoodsVo;
	private AuctionGoodsImageVo auctionGoodsImageVo;
	
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
	public AuctionGoodsImageVo getAuctionGoodsImageList() {
		return auctionGoodsImageVo;
	}
	public void setAuctionGoodsImageList(AuctionGoodsImageVo auctionGoodsImageVo) {
		this.auctionGoodsImageVo = auctionGoodsImageVo;
	}
	@Override
	public String toString() {
		return "AuctionGoodsAndFirstImageVo [auctionGoodsVo=" + auctionGoodsVo + ", AuctionGoodsImageVo="
				+ auctionGoodsImageVo + "]";
	}
	
}
