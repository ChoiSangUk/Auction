package com.kpsl.auction.account.vo;
/************************
 * 	계좌관리VO				*
 ************************/
public class AccountVo {
	private String accountCode;
	private String userId;
	private String accountBankName;
	private String accountHolderName;
	private String accountNo;
	private String accountDate;
	public String getAccountCode() {
		System.out.println("AccountVo:accountCode"+accountCode);
		return accountCode;
	}
	public void setAccountCode(String accountCode) {
		this.accountCode = accountCode;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getAccountBankName() {
		return accountBankName;
	}
	public void setAccountBankName(String accountBankName) {
		this.accountBankName = accountBankName;
	}
	public String getAccountHolderName() {
		return accountHolderName;
	}
	public void setAccountHolderName(String accountHolderName) {
		this.accountHolderName = accountHolderName;
	}
	public String getAccountNo() {
		return accountNo;
	}
	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}
	public String getAccountDate() {
		return accountDate;
	}
	public void setAccountDate(String accountDate) {
		this.accountDate = accountDate;
	}
	@Override
	public String toString() {
		return "AccountVo [accountCode=" + accountCode + ", userId=" + userId + ", accountBankName=" + accountBankName
				+ ", accountHolderName=" + accountHolderName + ", accountNo=" + accountNo + ", accountDate="
				+ accountDate + "]";
	}
	
	
}
