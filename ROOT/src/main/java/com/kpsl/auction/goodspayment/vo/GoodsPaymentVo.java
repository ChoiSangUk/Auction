package com.kpsl.auction.goodspayment.vo;

public class GoodsPaymentVo {

	private String goodsPaymentCode;
	private String successfulBidCode;
	private String goodsPaymentDate;
	private int goodsPaymentPrice;
	private int goodsPaymentFees;
	private String goodsPaymentState;
	private String goodsPaymentRemarks;
	
	public String getGoodsPaymentCode() {
		return goodsPaymentCode;
	}

	public void setGoodsPaymentCode(String goodsPaymentCode) {
		this.goodsPaymentCode = goodsPaymentCode;
	}

	public String getSuccessfulBidCode() {
		return successfulBidCode;
	}

	public void setSuccessfulBidCode(String successfulBidCode) {
		this.successfulBidCode = successfulBidCode;
	}

	public String getGoodsPaymentDate() {
		return goodsPaymentDate;
	}

	public void setGoodsPaymentDate(String goodsPaymentDate) {
		this.goodsPaymentDate = goodsPaymentDate;
	}

	public int getGoodsPaymentPrice() {
		return goodsPaymentPrice;
	}

	public void setGoodsPaymentPrice(int goodsPaymentPrice) {
		this.goodsPaymentPrice = goodsPaymentPrice;
	}

	public int getGoodsPaymentFees() {
		return goodsPaymentFees;
	}

	public void setGoodsPaymentFees(int goodsPaymentFees) {
		this.goodsPaymentFees = goodsPaymentFees;
	}

	public String getGoodsPaymentState() {
		return goodsPaymentState;
	}

	public void setGoodsPaymentState(String goodsPaymentState) {
		this.goodsPaymentState = goodsPaymentState;
	}

	public String getGoodsPaymentRemarks() {
		return goodsPaymentRemarks;
	}

	public void setGoodsPaymentRemarks(String goodsPaymentRemarks) {
		this.goodsPaymentRemarks = goodsPaymentRemarks;
	}

	@Override
	public String toString() {
		return "GoodsPaymentVo [goodsPaymentCode=" + goodsPaymentCode + ", successfulBidCode=" + successfulBidCode
				+ ", goodsPaymentDate=" + goodsPaymentDate + ", goodsPaymentPrice=" + goodsPaymentPrice
				+ ", goodsPaymentFees=" + goodsPaymentFees + ", goodsPaymentState=" + goodsPaymentState
				+ ", goodsPaymentRemarks=" + goodsPaymentRemarks + "]";
	}
	
}
