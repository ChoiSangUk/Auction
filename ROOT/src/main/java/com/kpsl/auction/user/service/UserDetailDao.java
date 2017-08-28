package com.kpsl.auction.user.service;

import com.kpsl.auction.user.vo.UserDetailVo;
import com.kpsl.auction.user.vo.UserVo;


public interface UserDetailDao {
	int insertUserBuyer(UserDetailVo userDetailVo);
	int insertUserSeller(UserDetailVo userDetailVo);
	int insertUser(UserVo userVo);
	int updateUserTrans(UserDetailVo userDetailVo);
	int updateUser(UserDetailVo userDetailVo);
	
}
