package com.kpsl.auction.user.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kpsl.auction.user.vo.AdminUserSearchVo;
import com.kpsl.auction.user.vo.GradeVo;
import com.kpsl.auction.user.vo.UserDetailVo;
@Service
public class AdminUserServiceImpl implements AdminUserService {
	@Autowired private AdminUserDao adminUserDao;
	Logger log = Logger.getLogger(this.getClass());
	@Override
	public List<AdminUserSearchVo> getUserSearch(UserDetailVo userDetailVo, String sk, String sv) {
		log.info("AdminUserService Class AdminUserService : " +userDetailVo);
		
		if(sk.equals("userId")) {
			userDetailVo.setUserId(sv);
			log.info(sk+"<-- sk확인");
			log.info(sv+"<-- sv확인");
		}else if(sk.equals("userName")) {
			userDetailVo.setUserName(sv);
			log.info(sk+"<-- sk확인");
			log.info(sv+"<-- sv확인");
		}else if(sk.equals("userPhone")) {
			userDetailVo.setUserPhone(sv);
			log.info(sk+"<-- sk확인");
			log.info(sv+"<-- sv확인");
		}/*else if(sk.equals("adPaymentState")) {
			adPaymentVo.setAdPaymentState(sv);
			log.info(sk+"<-- sk확인");
			log.info(sv+"<-- sv확인");
		}*/
		
		return adminUserDao.selectUserSearch(userDetailVo);
	}
	

}
