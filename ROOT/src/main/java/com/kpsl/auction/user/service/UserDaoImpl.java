package com.kpsl.auction.user.service;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kpsl.auction.user.vo.UserDetailVo;


@Repository
public class UserDaoImpl implements UserDao {
	final String NS ="com.kpsl.auction.user.service.UserDetailMapper";
	Logger log = Logger.getLogger(this.getClass());
	
	@Autowired 
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public UserDetailVo selectUserLogin(String userId) {
		log.info("selectUserLogin 확인");
		log.info(userId);
		
		return sqlSessionTemplate.selectOne(NS+"selectUserLogin", userId);
	}
}
