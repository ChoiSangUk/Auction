package com.kpsl.auction.user.service;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kpsl.auction.user.vo.UserDetailVo;
import com.kpsl.auction.user.vo.UserVo;

@Service
public class UserDetailServiceImpl implements UserDetailService {
	Logger log = Logger.getLogger(this.getClass());
	@Autowired private UserDetailDao userDetailDao;

	
	
	@Override
	public int setUserBuyer(UserDetailVo userDetailVo) {
		
		// 구매자회원가입
		return userDetailDao.insertUserBuyer(userDetailVo);
	}



	@Override
	public int setUser(UserVo userVo) {
		// 유저 ID만 저장
		return userDetailDao.insertUser(userVo);
	}



	@Override
	public int setUserSeller(UserDetailVo userDetailVo) {
		// 판매자회원가입
		return userDetailDao.insertUserSeller(userDetailVo);
	}



	@Override
	public int modifyUserTrans(UserDetailVo userDetailVo) {
		//구매자->판매자 전환
		return userDetailDao.updateUserTrans(userDetailVo);
	}



	@Override
	public int modifyUser(UserDetailVo userDetailVo) {
		// 유저회원정보수정
		return userDetailDao.updateUser(userDetailVo);
	}



	@Override
	public UserDetailVo getUserFind(String userId, String userEmail,String userName, String userBirth) {
		// 비밀번호찾기
		return userDetailDao.selectUserFind(userId, userEmail,userName,userBirth);
	}



	
}
