package com.kpsl.auction.user.service;

import org.springframework.transaction.annotation.Transactional;

import com.kpsl.auction.user.vo.GradeVo;
import com.kpsl.auction.user.vo.UserDetailVo;
import com.kpsl.auction.user.vo.UserRemoveVo;

@Transactional
public interface UserService {
	UserDetailVo getUserLogin(String userId,String userPassword);
	GradeVo getUserGrade(String userId);
	UserDetailVo getUser(String userId);
	int setUserDelete(UserRemoveVo userRemoveVo);
	int removeUser(String userId);
}
