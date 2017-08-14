package com.kpsl.auction.cash.vo;
/************************
 * 	물품배송VO				*
 ************************/
public class CashVo {
	private String goodsDeliveryCode;
	private String goodsPaymentCode;
	private String goodsDeliveryAddr;
	private String goodsDeliveryAddrdetail;
	private String goodsDeliveryCompany;
	private String goodsDeliveryState;
	private String goodsDeliveryNo;
	
	public String getGoodsDeliveryCode() {
		System.out.println("GoodsDeliveryVo:goodsDeliveryCode"+goodsDeliveryCode);
		return goodsDeliveryCode;
	}
	public void setGoodsDeliveryCode(String goodsDeliveryCode) {
		this.goodsDeliveryCode = goodsDeliveryCode;
	}
	public String getGoodsPaymentCode() {
		return goodsPaymentCode;
	}
	public void setGoodsPaymentCode(String goodsPaymentCode) {
		this.goodsPaymentCode = goodsPaymentCode;
	}
	public String getGoodsDeliveryAddr() {
		return goodsDeliveryAddr;
	}
	public void setGoodsDeliveryAddr(String goodsDeliveryAddr) {
		this.goodsDeliveryAddr = goodsDeliveryAddr;
	}
	public String getGoodsDeliveryAddrdetail() {
		return goodsDeliveryAddrdetail;
	}
	public void setGoodsDeliveryAddrdetail(String goodsDeliveryAddrdetail) {
		this.goodsDeliveryAddrdetail = goodsDeliveryAddrdetail;
	}
	public String getGoodsDeliveryCompany() {
		return goodsDeliveryCompany;
	}
	public void setGoodsDeliveryCompany(String goodsDeliveryCompany) {
		this.goodsDeliveryCompany = goodsDeliveryCompany;
	}
	public String getGoodsDeliveryState() {
		return goodsDeliveryState;
	}
	public void setGoodsDeliveryState(String goodsDeliveryState) {
		this.goodsDeliveryState = goodsDeliveryState;
	}
	public String getGoodsDeliveryNo() {
		return goodsDeliveryNo;
	}
	public void setGoodsDeliveryNo(String goodsDeliveryNo) {
		this.goodsDeliveryNo = goodsDeliveryNo;
	}
	@Override
	public String toString() {
		return "GoodsDeliveryVo [goodsDeliveryCode=" + goodsDeliveryCode + ", goodsPaymentCode=" + goodsPaymentCode
				+ ", goodsDeliveryAddr=" + goodsDeliveryAddr + ", goodsDeliveryAddrdetail=" + goodsDeliveryAddrdetail
				+ ", goodsDeliveryCompany=" + goodsDeliveryCompany + ", goodsDeliveryState=" + goodsDeliveryState
				+ ", goodsDeliveryNo=" + goodsDeliveryNo + "]";
	}
	
	
}
