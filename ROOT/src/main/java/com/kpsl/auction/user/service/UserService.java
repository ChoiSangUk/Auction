package com.kpsl.auction.user.service;

import org.springframework.transaction.annotation.Transactional;

import com.kpsl.auction.user.vo.GradeVo;
import com.kpsl.auction.user.vo.UserDetailVo;

@Transactional
public interface UserService {
	UserDetailVo getUserLogin(String userId,String userPassword);
	GradeVo getUserGrade(String userId);
}
