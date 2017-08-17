package com.kpsl.auction.user.service;

import java.util.Map;

import com.kpsl.auction.user.vo.UserDetailVo;

public interface UserDao {
	UserDetailVo selectUserLogin(String userId);
}
