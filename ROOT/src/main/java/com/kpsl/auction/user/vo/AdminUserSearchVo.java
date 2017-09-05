package com.kpsl.auction.user.vo;
/************************
 * 	 유저검색VO			* 
 ************************/

public class AdminUserSearchVo {
	private UserDetailVo userDetailVo;
	private GradeVo gradeVo;
	private RestrictVo restrictVo;
	
	public UserDetailVo getUserDetailVo() {
		return userDetailVo;
	}
	public void setUserDetailVo(UserDetailVo userDetailVo) {
		this.userDetailVo = userDetailVo;
	}
	public GradeVo getGradeVo() {
		return gradeVo;
	}
	public void setGradeVo(GradeVo gradeVo) {
		this.gradeVo = gradeVo;
	}
	public RestrictVo getRestrictVo() {
		return restrictVo;
	}
	public void setRestrictVo(RestrictVo restrictVo) {
		this.restrictVo = restrictVo;
	}
}
