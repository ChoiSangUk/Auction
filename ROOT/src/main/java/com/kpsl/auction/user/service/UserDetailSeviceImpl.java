package com.kpsl.auction.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kpsl.auction.user.vo.UserDetailVo;
@Service
public class UserDetailSeviceImpl implements UserDetailService {
	@Autowired private UserDetailDao userDetailDao;

	@Override
	public int setUserBuyer(UserDetailVo userDetailVo) {
		// TODO Auto-generated method stub
		return userDetailDao.insertUserBuyer(userDetailVo);
	}

}
