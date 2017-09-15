package com.kpsl.auction.successfullBid.vo;

import com.kpsl.auction.auctiongoods.vo.AuctionGoodsVo;
import com.kpsl.auction.bid.vo.BidVo;

public class SuccessBidAndBidAndAuctionGoodsVo {
	private SuccessBidVo successBidVo;
	private BidVo bidVo;
	private AuctionGoodsVo auctionGoodsVo;
	
	public SuccessBidVo getSuccessBidVo() {
		return successBidVo;
	}
	public void setSuccessBidVo(SuccessBidVo successBidVo) {
		this.successBidVo = successBidVo;
	}
	public BidVo getBidVo() {
		return bidVo;
	}
	public void setBidVo(BidVo bidVo) {
		this.bidVo = bidVo;
	}
	public AuctionGoodsVo getAuctionGoodsVo() {
		return auctionGoodsVo;
	}
	public void setAuctionGoodsVo(AuctionGoodsVo auctionGoodsVo) {
		this.auctionGoodsVo = auctionGoodsVo;
	}	
}
