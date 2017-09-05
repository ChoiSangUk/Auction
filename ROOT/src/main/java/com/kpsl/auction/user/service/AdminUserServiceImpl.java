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
	public List<AdminUserSearchVo> getUserSearch(AdminUserSearchVo adminUserSearchVo) {
		log.info("AdminUserService Class AdminUserService : " +adminUserSearchVo);
		return adminUserDao.selectUserSearch(adminUserSearchVo);
	}
	

}
