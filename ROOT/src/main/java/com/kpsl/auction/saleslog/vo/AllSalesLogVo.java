package com.kpsl.auction.saleslog.vo;


import com.kpsl.auction.ad.vo.AdPaymentVo;
import com.kpsl.auction.cash.vo.CashVo;
import com.kpsl.auction.user.vo.UserDetailVo;

/************************
 * 	회사매입/매출 VO			* 
 ************************/
public class AllSalesLogVo {
	private SalesLogVo salesLogVo;
	private UserDetailVo userDetailVo;
	private CashVo cashVo;
	private AdPaymentVo adPaymentVo;
	
	public SalesLogVo getSalesLogVo() {
		return salesLogVo;
	}
	public void setSalesLogVo(SalesLogVo salesLogVo) {
		this.salesLogVo = salesLogVo;
	}
	public UserDetailVo getUserDetailVo() {
		return userDetailVo;
	}
	public void setUserDetailVo(UserDetailVo userDetailVo) {
		this.userDetailVo = userDetailVo;
	}
	public CashVo getCashVo() {
		return cashVo;
	}
	public void setCashVo(CashVo cashVo) {
		this.cashVo = cashVo;
	}
	public AdPaymentVo getAdPaymentVo() {
		return adPaymentVo;
	}
	public void setAdPaymentVo(AdPaymentVo adPaymentVo) {
		this.adPaymentVo = adPaymentVo;
	}
	
}
