package com.kpsl.auction.ad.vo;

// AdApply, AdImage, AdUnitPrice 조인을 위한 Vo
public class AdApplyAndAdImageAndAdUnitPriceVo {
	private AdApplyVo adApplyVo;
	private AdImageVo adImageVo;
	private AdUnitPriceVo adUnitPriceVo;
	
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
	public AdImageVo getAdImageVo() {
		return adImageVo;
	}
	public void setAdImageVo(AdImageVo adImageVo) {
		this.adImageVo = adImageVo;
	}
}
