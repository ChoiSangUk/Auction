package com.kpsl.auction.saleslog.vo;
/************************
 * 	회사매입/매출 VO			* 
 ************************/
public class SalesLogVo {
	private String salesLogCode;
	private String salesLogRelationCode;
	private String salesLogRelation;
	private String salesLogDepositAndWithdrawal;
	private String salesLogUserId;
	private int salesLogPrice;
	private String salesLogDate;
	private String salesLogRemarks;
	public String getSalesLogCode() {
		return salesLogCode;
	}
	public void setSalesLogCode(String salesLogCode) {
		this.salesLogCode = salesLogCode;
	}
	public String getSalesLogRelationCode() {
		return salesLogRelationCode;
	}
	public void setSalesLogRelationCode(String salesLogRelationCode) {
		this.salesLogRelationCode = salesLogRelationCode;
	}
	public String getSalesLogRelation() {
		return salesLogRelation;
	}
	public void setSalesLogRelation(String salesLogRelation) {
		this.salesLogRelation = salesLogRelation;
	}
	public String getSalesLogDepositAndWithdrawal() {
		return salesLogDepositAndWithdrawal;
	}
	public void setSalesLogDepositAndWithdrawal(String salesLogDepositAndWithdrawal) {
		this.salesLogDepositAndWithdrawal = salesLogDepositAndWithdrawal;
	}
	public String getSalesLogUserId() {
		return salesLogUserId;
	}
	public void setSalesLogUserId(String salesLogUserId) {
		this.salesLogUserId = salesLogUserId;
	}
	public int getSalesLogPrice() {
		return salesLogPrice;
	}
	public void setSalesLogPrice(int salesLogPrice) {
		this.salesLogPrice = salesLogPrice;
	}
	public String getSalesLogDate() {
		return salesLogDate;
	}
	public void setSalesLogDate(String salesLogDate) {
		this.salesLogDate = salesLogDate;
	}
	public String getSalesLogRemarks() {
		return salesLogRemarks;
	}
	public void setSalesLogRemarks(String salesLogRemarks) {
		this.salesLogRemarks = salesLogRemarks;
	}

	
}
