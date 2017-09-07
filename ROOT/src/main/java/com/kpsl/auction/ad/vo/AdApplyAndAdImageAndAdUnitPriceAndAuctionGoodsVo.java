package com.kpsl.auction.ad.vo;

import com.kpsl.auction.auctiongoods.vo.AuctionGoodsVo;

// AdApply, AdImage, AdUnitPrice, AdPayment, AuctionGoods, AdRefund 조인을 위한 Vo
public class AdApplyAndAdImageAndAdUnitPriceAndAuctionGoodsVo {
	private AdApplyVo adApplyVo;
	private AdImageVo adImageVo;
	private AdUnitPriceVo adUnitPriceVo;
	private AdPaymentVo adPaymentVo;
	private AuctionGoodsVo auctionGoodsVo;
	
	public AuctionGoodsVo getAuctionGoodsVo() {
		return auctionGoodsVo;
	}
	public void setAuctionGoodsVo(AuctionGoodsVo auctionGoodsVo) {
		this.auctionGoodsVo = auctionGoodsVo;
	}
	public AdUnitPriceVo getAdUnitPriceVo() {
		return adUnitPriceVo;
	}
	public void setAdUnitPriceVo(AdUnitPriceVo adUnitPriceVo) {
		this.adUnitPriceVo = adUnitPriceVo;
	}
	public AdApplyVo getAdApplyVo() {
		return adApplyVo;
	}
	public void setAdApplyVo(AdApplyVo adApplyVo) {
		this.adApplyVo = adApplyVo;
	}
	public AdPaymentVo getAdPaymentVo() {
		return adPaymentVo;
	}
	public void setAdPaymentVo(AdPaymentVo adPaymentVo) {
		this.adPaymentVo = adPaymentVo;
	}
	public AdImageVo getAdImageVo() {
		return adImageVo;
	}
	public void setAdImageVo(AdImageVo adImageVo) {
		this.adImageVo = adImageVo;
	}
}
