package com.kpsl.auction.user.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kpsl.auction.user.vo.AdminUserSearchVo;
import com.kpsl.auction.user.vo.GradeVo;
import com.kpsl.auction.user.vo.UserDetailVo;
import com.kpsl.auction.user.vo.UserRemoveVo;
@Service
public class AdminUserServiceImpl implements AdminUserService {
	@Autowired private AdminUserDao adminUserDao;
	@Autowired private UserRemoveDao userRemoveDao;
	Logger log = Logger.getLogger(this.getClass());
	@Override
	public List<AdminUserSearchVo> getUserSearch(UserDetailVo userDetailVo, String sk, String sv) {
		log.info("AdminUserService Class AdminUserService : " +userDetailVo);
		
		if(sk.equals("userId")) {
			userDetailVo.setUserId(sv+"%");
			log.info(sk+"<-- sk확인");
			log.info(sv+"<-- sv확인");
		}else if(sk.equals("userName")) {
			userDetailVo.setUserName("%"+sv+"%");
			log.info(sk+"<-- sk확인");
			log.info(sv+"<-- sv확인");
		}else if(sk.equals("userPhone")) {
			userDetailVo.setUserPhone("%"+sv+"%");
			log.info(sk+"<-- sk확인");
			log.info(sv+"<-- sv확인");
		}else if(sk.equals("userEmail")) {
			userDetailVo.setUserEmail(sv+"%");
			log.info(sk+"<-- sk확인");
			log.info(sv+"<-- sv확인");
		}else if(sk.equals("userAddr")) {
			userDetailVo.setUserAddr("%"+sv+"%");
			log.info(sk+"<-- sk확인");
			log.info(sv+"<-- sv확인");
		}
		
		return adminUserDao.selectUserSearch(userDetailVo);
	}
	@Override
	public List<UserRemoveVo> getRemoveUserSearch(UserRemoveVo userRemoveVo,String sk, String sv) {
		log.info("AdminUserService Class getRemoveUserSearch : " +userRemoveVo);
		if(sk.equals("userId")) {
			userRemoveVo.setUserId(sv+"%");
			log.info(sk+"<-- sk확인");
			log.info(sv+"<-- sv확인");
		}
		return userRemoveDao.selectRemoveUserSearch(userRemoveVo);
	}
	

}
