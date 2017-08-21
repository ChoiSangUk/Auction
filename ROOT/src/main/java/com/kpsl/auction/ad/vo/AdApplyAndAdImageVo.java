package com.kpsl.auction.ad.vo;

// AdApply와 AdImage 조인을 위한 Vo
public class AdApplyAndAdImageVo {
	private AdApplyVo adApplyVo;
	private AdImageVo adImageVo;
	
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
