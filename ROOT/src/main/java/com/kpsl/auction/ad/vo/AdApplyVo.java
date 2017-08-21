package com.kpsl.auction.ad.vo;

// 광고신청VO
public class AdApplyVo {
	private String adApplyCode;
	private String adUnitPriceCode;
	private String auctionGoodsCode;
	private String userId;
	private String adApplyRegistDate;
	private String adApplyStartDate;
	private String adApplyEndDate;
	private String adApplyState;
	private AdImageVo adImageVo;
	
	public AdImageVo getAdImageVo() {
		return adImageVo;
	}
	public void setAdImageVo(AdImageVo adImageVo) {
		this.adImageVo = adImageVo;
	}
	public String getAdApplyCode() {
		return adApplyCode;
	}
	public void setAdApplyCode(String adApplyCode) {
		this.adApplyCode = adApplyCode;
	}
	public String getAdUnitPriceCode() {
		return adUnitPriceCode;
	}
	public void setAdUnitPriceCode(String adUnitPriceCode) {
		this.adUnitPriceCode = adUnitPriceCode;
	}
	public String getAuctionGoodsCode() {
		return auctionGoodsCode;
	}
	public void setAuctionGoodsCode(String auctionGoodsCode) {
		this.auctionGoodsCode = auctionGoodsCode;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getAdApplyRegistDate() {
		return adApplyRegistDate;
	}
	public void setAdApplyRegistDate(String adApplyRegistDate) {
		this.adApplyRegistDate = adApplyRegistDate;
	}
	public String getAdApplyStartDate() {
		return adApplyStartDate;
	}
	public void setAdApplyStartDate(String adApplyStartDate) {
		this.adApplyStartDate = adApplyStartDate;
	}
	public String getAdApplyEndDate() {
		return adApplyEndDate;
	}
	public void setAdApplyEndDate(String adApplyEndDate) {
		this.adApplyEndDate = adApplyEndDate;
	}
	public String getAdApplyState() {
		return adApplyState;
	}
	public void setAdApplyState(String adApplyState) {
		this.adApplyState = adApplyState;
	}
}
