package com.kpsl.auction.user.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kpsl.auction.user.vo.UserDetailVo;
import com.kpsl.auction.user.vo.UserVo;


@Repository
public class UserDetailDaoImpl implements UserDetailDao {
	final String NS = "com.kpsl.auction.user.service.UserDatailMapper."; 
	
	@Autowired
    private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public int insertUserBuyer(UserDetailVo userDetailVo) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert(NS+"insertUserBuyer", userDetailVo);
	}

	@Override
	public int insertUser(UserVo userVo) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert(NS+"insertUser", userVo);
	}


}
