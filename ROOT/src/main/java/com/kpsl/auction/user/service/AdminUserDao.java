package com.kpsl.auction.user.service;

import java.util.List;

import com.kpsl.auction.user.vo.UserDetailVo;

public interface AdminUserDao {
		List<UserDetailVo> selectCashDetail(UserDetailVo userDetailVo);
}
