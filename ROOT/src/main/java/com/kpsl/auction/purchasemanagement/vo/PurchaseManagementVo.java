package com.kpsl.auction.purchasemanagement.vo;
/************************
 * 	구매관리 VO				*
 * (구매확정을위한 VO)		* 
 ************************/
public class PurchaseManagementVo {
	private String purchaseManagementCode;
	private String goodsPaymentCode;
	private String purchaseManagementState;
	private String purchaseManagementDate;
	
	public String getPurchaseManagementCode() {
		System.out.println("PurchaseManagementVo:purchaseManagementCode"+purchaseManagementCode);
		return purchaseManagementCode;
	}
	public void setPurchaseManagementCode(String purchaseManagementCode) {
		this.purchaseManagementCode = purchaseManagementCode;
	}
	public String getGoodsPaymentCode() {
		return goodsPaymentCode;
	}
	public void setGoodsPaymentCode(String goodsPaymentCode) {
		this.goodsPaymentCode = goodsPaymentCode;
	}
	public String getPurchaseManagementState() {
		return purchaseManagementState;
	}
	public void setPurchaseManagementState(String purchaseManagementState) {
		this.purchaseManagementState = purchaseManagementState;
	}
	public String getPurchaseManagementDate() {
		return purchaseManagementDate;
	}
	public void setPurchaseManagementDate(String purchaseManagementDate) {
		this.purchaseManagementDate = purchaseManagementDate;
	}
	@Override
	public String toString() {
		return "PurchaseManagementVo [purchaseManagementCode=" + purchaseManagementCode + ", goodsPaymentCode="
				+ goodsPaymentCode + ", purchaseManagementState=" + purchaseManagementState
				+ ", purchaseManagementDate=" + purchaseManagementDate + "]";
	}
	
	
}
