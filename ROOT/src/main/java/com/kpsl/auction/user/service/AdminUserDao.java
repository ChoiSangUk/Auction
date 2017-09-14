package com.kpsl.auction.user.service;

import java.util.List;

import com.kpsl.auction.user.vo.AdminUserSearchVo;
import com.kpsl.auction.user.vo.UserDetailVo;
import com.kpsl.auction.user.vo.UserRemoveVo;

public interface AdminUserDao {
		List<AdminUserSearchVo> selectUserSearch(UserDetailVo userDetailVo);
		
}
