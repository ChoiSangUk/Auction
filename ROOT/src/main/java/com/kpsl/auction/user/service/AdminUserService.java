package com.kpsl.auction.user.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.kpsl.auction.user.vo.AdminUserSearchVo;
import com.kpsl.auction.user.vo.GradeVo;
import com.kpsl.auction.user.vo.UserDetailVo;
import com.kpsl.auction.user.vo.UserRemoveVo;

@Transactional
public interface AdminUserService {
	List<AdminUserSearchVo> getUserSearch(UserDetailVo userDetailVo,String sk, String sv);
	List<UserRemoveVo> getRemoveUserSearch(UserRemoveVo userRemoveVo,String sk, String sv);
}
