package com.kpsl.auction.user.service;


import com.kpsl.auction.user.vo.GradeVo;
import com.kpsl.auction.user.vo.UserDetailVo;

public interface UserDao {
	UserDetailVo selectUserLogin(String userId,String userPassword);
	GradeVo selectUserGrade(String userId);
	UserDetailVo selectUser(String userId);
	
}
