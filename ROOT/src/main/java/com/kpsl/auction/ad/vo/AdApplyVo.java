package com.kpsl.auction.ad.vo;

import org.hibernate.validator.constraints.NotEmpty;

// 광고신청VO
public class AdApplyVo {	
	private String adApplyCode;
	private String adUnitPriceCode;
	@NotEmpty(message="물품을 먼저 등록해주세요.")
	private String auctionGoodsCode;
	private String userId;	
	private String adApplyRegistDate;
	@NotEmpty(message="광고시작일을 선택해주세요.")
	private String adApplyStartDate;
	@NotEmpty(message="광고종료일을 선택해주세요.")
	private String adApplyEndDate;
	private String adApplyApprovalDate;
	private String adApplyState;
	private int beginRow;
	private int pagePerRow;	
	
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
	public String getAdApplyApprovalDate() {
		return adApplyApprovalDate;
	}
	public void setAdApplyApprovalDate(String adApplyApprovalDate) {
		this.adApplyApprovalDate = adApplyApprovalDate;
	}
	public String getAdApplyState() {
		return adApplyState;
	}
	public void setAdApplyState(String adApplyState) {
		this.adApplyState = adApplyState;
	}
	public int getBeginRow() {
		return beginRow;
	}
	public void setBeginRow(int beginRow) {
		this.beginRow = beginRow;
	}
	public int getPagePerRow() {
		return pagePerRow;
	}
	public void setPagePerRow(int pagePerRow) {
		this.pagePerRow = pagePerRow;
	}
}
