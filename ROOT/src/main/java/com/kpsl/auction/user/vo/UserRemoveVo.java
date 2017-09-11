package com.kpsl.auction.user.vo;
/************************
 * 	회원탈퇴 VO				* 
 ************************/
public class UserRemoveVo {
	private String userRemoveCode;
	private String userId;
	private String userRemoveReason;
	private String userRemoveReasonDetail;
	private String userJoindate;
	private String userRemoveDate;
	
	public String getUserRemoveCode() {
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
	public String getUserRemoveReason() {
		return userRemoveReason;
	}
	public void setUserRemoveReason(String userRemoveReason) {
		this.userRemoveReason = userRemoveReason;
	}
	public String getUserRemoveReasonDetail() {
		return userRemoveReasonDetail;
	}
	public void setUserRemoveReasonDetail(String userRemoveReasonDetail) {
		this.userRemoveReasonDetail = userRemoveReasonDetail;
	}
	public String getUserJoindate() {
		return userJoindate;
	}
	public void setUserJoindate(String userJoindate) {
		this.userJoindate = userJoindate;
	}
	public String getUserRemoveDate() {
		return userRemoveDate;
	}
	public void setUserRemoveDate(String userRemoveDate) {
		this.userRemoveDate = userRemoveDate;
	}

	
}
