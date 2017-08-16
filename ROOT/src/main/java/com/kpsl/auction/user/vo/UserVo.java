package com.kpsl.auction.user.vo;
/************************
 * 	유저아이디 VO			*
 * (아이디 삭제시 삭제된아이디는	* 
 * 	가입 및 로그인 불허하기위한	*
 *  VO)					*
 ************************/
public class UserVo {
	private String userId;

	public String getUserId() {
		System.out.println("UserVo:userId == "+userId);
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

}
