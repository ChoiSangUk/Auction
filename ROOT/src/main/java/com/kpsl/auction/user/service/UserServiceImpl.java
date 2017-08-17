package com.kpsl.auction.user.service;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kpsl.auction.user.vo.UserDetailVo;
@Service
public class UserServiceImpl implements UserService {
	@Autowired private UserDao userDao;
	Logger log = Logger.getLogger(this.getClass());
	
	@Override
	public UserDetailVo getUserLogin(String userId) {
		log.info(userId);
		
		return userDao.selectUserLogin(userId);
	}

}
