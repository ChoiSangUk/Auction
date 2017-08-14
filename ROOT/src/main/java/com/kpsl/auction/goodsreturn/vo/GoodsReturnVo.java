package com.kpsl.auction.goodsreturn.vo;
/************************
 * 	반품관리 VO				*
 ************************/
public class GoodsReturnVo {
	private String goodsReturnCode;
	private String goodsPaymentCode;
	private String goodsReturnReason;
	private String goodsReturnState;
	private String goodsReturnDate;
	
	public String getGoodsReturnCode() {
		System.out.println("GoodsReturnVo:goodsReturnCode"+goodsReturnCode);
		return goodsReturnCode;
	}
	public void setGoodsReturnCode(String goodsReturnCode) {
		this.goodsReturnCode = goodsReturnCode;
	}
	public String getGoodsPaymentCode() {
		return goodsPaymentCode;
	}
	public void setGoodsPaymentCode(String goodsPaymentCode) {
		this.goodsPaymentCode = goodsPaymentCode;
	}
	public String getGoodsReturnReason() {
		return goodsReturnReason;
	}
	public void setGoodsReturnReason(String goodsReturnReason) {
		this.goodsReturnReason = goodsReturnReason;
	}
	public String getGoodsReturnState() {
		return goodsReturnState;
	}
	public void setGoodsReturnState(String goodsReturnState) {
		this.goodsReturnState = goodsReturnState;
	}
	public String getGoodsReturnDate() {
		return goodsReturnDate;
	}
	public void setGoodsReturnDate(String goodsReturnDate) {
		this.goodsReturnDate = goodsReturnDate;
	}
	@Override
	public String toString() {
		return "GoodsReturnVo [goodsReturnCode=" + goodsReturnCode + ", goodsPaymentCode=" + goodsPaymentCode
				+ ", goodsReturnReason=" + goodsReturnReason + ", goodsReturnState=" + goodsReturnState
				+ ", goodsReturnDate=" + goodsReturnDate + "]";
	}
	
	
}
