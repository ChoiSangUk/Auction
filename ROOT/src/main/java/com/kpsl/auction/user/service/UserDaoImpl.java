package com.kpsl.auction.user.service;

import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kpsl.auction.user.vo.GradeVo;
import com.kpsl.auction.user.vo.UserDetailVo;


@Repository
public class UserDaoImpl implements UserDao {
	final String NS ="com.kpsl.auction.user.service.UserDetailMapper.";
	Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public UserDetailVo selectUserLogin(String userId,String userPassword) {
		log.info("selectUserLogin 확인");
		log.info(userId);
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("userId", userId);
		paramMap.put("userPassword", userPassword);
		return sqlSessionTemplate.selectOne(NS+"selectUserLogin", paramMap);
	}

	@Override
	public GradeVo selectUserGrade(String userId) {
		log.info("selectUserGrade 확인");
		log.info(userId);
		
		return sqlSessionTemplate.selectOne(NS+"selectUserGrade",userId);
	}

	@Override
	public UserDetailVo selectUser(String userId) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne(NS+"selectUser", userId);
	}



}
