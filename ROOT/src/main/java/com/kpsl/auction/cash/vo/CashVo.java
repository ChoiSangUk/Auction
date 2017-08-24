package com.kpsl.auction.cash.vo;
/************************
 * 	캐쉬VO				*
 ************************/
public class CashVo {
	private String cashCode;
	private String userId;
	private int cashPrice;
	private String cashDate;
	private String cashState;
	public String getCashCode() {
		return cashCode;
	}
	public void setCashCode(String cashCode) {
		this.cashCode = cashCode;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getCashPrice() {
		return cashPrice;
	}
	public void setCashPrice(int cashPrice) {
		this.cashPrice = cashPrice;
	}
	public String getCashDate() {
		return cashDate;
	}
	public void setCashDate(String cashDate) {
		this.cashDate = cashDate;
	}
	public String getCashState() {
		return cashState;
	}
	public void setCashState(String cashState) {
		this.cashState = cashState;
	}
	@Override
	public String toString() {
		return "CashVo [cashCode=" + cashCode + ", userId=" + userId + ", cashPrice=" + cashPrice + ", cashDate="
				+ cashDate + ", cashState=" + cashState + "]";
	}
	
	
	
	
	
}
