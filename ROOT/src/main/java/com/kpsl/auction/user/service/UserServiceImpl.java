package com.kpsl.auction.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kpsl.auction.user.vo.UserDetailVo;
@Service
public class UserServiceImpl implements UserService {
	@Autowired private UserDao userDao;
		
	@Override
	public UserDetailVo getUserLogin(UserDetailVo userDetailVo) {
		// TODO Auto-generated method stub
		return userDao.selectUserLogin(userDetailVo);
	}

}
