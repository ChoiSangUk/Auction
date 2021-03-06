package com.kpsl.auction.user.service;

import org.springframework.transaction.annotation.Transactional;

import com.kpsl.auction.user.vo.UserDetailVo;
import com.kpsl.auction.user.vo.UserVo;

@Transactional
public interface UserDetailService {
	int setUserBuyer(UserDetailVo userDetailVo);
	int setUser(UserVo userVo);
	int setUserSeller(UserDetailVo userDetailVo);
	int modifyUserTrans(UserDetailVo userDetailVo);
	int modifyUser(UserDetailVo userDetailVo);
	UserDetailVo getUserFind(String userId,String userEmail,String userName, String userBirth);
}
