package com.kpsl.auction.ad.vo;

// 광고결제VO
public class AdPaymentVo {
	private String adPaymentCode;
	private String adApplyCode;
	private String userId;
	private int adPaymentPrice;
	private String adPaymentRegistDate;
	private String adPaymentState;
	
	public String getAdPaymentCode() {
		return adPaymentCode;
	}
	public void setAdPaymentCode(String adPaymentCode) {
		this.adPaymentCode = adPaymentCode;
	}
	public String getAdApplyCode() {
		return adApplyCode;
	}
	public void setAdApplyCode(String adApplyCode) {
		this.adApplyCode = adApplyCode;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getAdPaymentPrice() {
		return adPaymentPrice;
	}
	public void setAdPaymentPrice(int adPaymentPrice) {
		this.adPaymentPrice = adPaymentPrice;
	}
	public String getAdPaymentRegistDate() {
		return adPaymentRegistDate;
	}
	public void setAdPaymentRegistDate(String adPaymentRegistDate) {
		this.adPaymentRegistDate = adPaymentRegistDate;
	}
	public String getAdPaymentState() {
		return adPaymentState;
	}
	public void setAdPaymentState(String adPaymentState) {
		this.adPaymentState = adPaymentState;
	}
}
