package com.kpsl.auction.user.service;

import com.kpsl.auction.user.vo.UserDetailVo;

public interface UserDao {
	UserDetailVo selectUserLogin(UserDetailVo userDetailVo);
}
