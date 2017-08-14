package com.kpsl.auction.user.vo;
/************************
 * 	 유저상세정보VO			* 
 ************************/

public class UserDetailVo {
	private String userId;
	private String userPassword;
	private String userLevel;
	private String gradeCode;
	private String restrictCode;
	private String userName;
	private String userGender;
	private String userBirth;
	private String userPhone;
	private String userEmail;
	private String userAddr;
	private String userAddrdetail;
	private int userTotalcash;
	public String getUserId() {
		System.out.println("UserDetailVo: userId"+ userId);
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserLevel() {
		return userLevel;
	}
	public void setUserLevel(String userLevel) {
		this.userLevel = userLevel;
	}
	public String getGradeCode() {
		return gradeCode;
	}
	public void setGradeCode(String gradeCode) {
		this.gradeCode = gradeCode;
	}
	public String getRestrictCode() {
		return restrictCode;
	}
	public void setRestrictCode(String restrictCode) {
		this.restrictCode = restrictCode;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserGender() {
		return userGender;
	}
	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}
	public String getUserBirth() {
		return userBirth;
	}
	public void setUserBirth(String userBirth) {
		this.userBirth = userBirth;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserAddr() {
		return userAddr;
	}
	public void setUserAddr(String userAddr) {
		this.userAddr = userAddr;
	}
	public String getUserAddrdetail() {
		return userAddrdetail;
	}
	public void setUserAddrdetail(String userAddrdetail) {
		this.userAddrdetail = userAddrdetail;
	}
	public int getUserTotalcash() {
		return userTotalcash;
	}
	public void setUserTotalcash(int userTotalcash) {
		this.userTotalcash = userTotalcash;
	}
	@Override
	public String toString() {
		return "UserDetailVo [userId=" + userId + ", userPassword=" + userPassword + ", userLevel=" + userLevel
				+ ", gradeCode=" + gradeCode + ", restrictCode=" + restrictCode + ", userName=" + userName
				+ ", userGender=" + userGender + ", userBirth=" + userBirth + ", userPhone=" + userPhone
				+ ", userEmail=" + userEmail + ", userAddr=" + userAddr + ", userAddrdetail=" + userAddrdetail
				+ ", userTotalcash=" + userTotalcash + "]";
	}

	
}
