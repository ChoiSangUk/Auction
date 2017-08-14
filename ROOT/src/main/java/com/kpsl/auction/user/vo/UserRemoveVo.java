package com.kpsl.auction.user.vo;
/************************
 * 	회원탈퇴 VO				* 
 ************************/
public class UserRemoveVo {
	private String userRemoveCode;
	private String userId;
	private String userRemoveApplyDate;
	private String userRemoveClearDate;
	
	public String getUserRemoveCode() {
		System.out.println("UserRemoveVo:userRemoveCode"+userRemoveCode);
		return userRemoveCode;
	}
	public void setUserRemoveCode(String userRemoveCode) {
		this.userRemoveCode = userRemoveCode;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserRemoveApplyDate() {
		return userRemoveApplyDate;
	}
	public void setUserRemoveApplyDate(String userRemoveApplyDate) {
		this.userRemoveApplyDate = userRemoveApplyDate;
	}
	public String getUserRemoveClearDate() {
		return userRemoveClearDate;
	}
	public void setUserRemoveClearDate(String userRemoveClearDate) {
		this.userRemoveClearDate = userRemoveClearDate;
	}
	@Override
	public String toString() {
		return "UserRemoveVo [userRemoveCode=" + userRemoveCode + ", userId=" + userId + ", userRemoveApplyDate="
				+ userRemoveApplyDate + ", userRemoveClearDate=" + userRemoveClearDate + "]";
	}
	
	
	
}
