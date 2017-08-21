package com.kpsl.auction.user.service;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kpsl.auction.user.vo.GradeVo;
import com.kpsl.auction.user.vo.UserDetailVo;
@Service
public class UserServiceImpl implements UserService {
	@Autowired private UserDao userDao;
	Logger log = Logger.getLogger(this.getClass());
	
	@Override
	public UserDetailVo getUserLogin(String userId,String userPassword) {
		log.info("UserServiceImpl"+userId);
		return userDao.selectUserLogin(userId,userPassword);
	}

	@Override
	public GradeVo getUserGrade(String userId) {
		log.info("getUserGrade 확인");
		return userDao.selectUserGrade(userId);
	}

}
