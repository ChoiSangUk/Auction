package com.kpsl.auction.user.service;

import java.util.List;

import com.kpsl.auction.user.vo.UserRemoveVo;

public interface UserRemoveDao {
	int insertUserDelete(UserRemoveVo userRemoveVo);
	List<UserRemoveVo> selectRemoveUserSearch(UserRemoveVo userRemoveVo);
}
