package com.kpsl.auction.user.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kpsl.auction.user.vo.UserDetailVo;


@Repository
public class UserDaoImpl implements UserDao {
	final String NS ="com.kpsl.auction.user.service.UserDatailMapper.";
	
	@Autowired 
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public UserDetailVo selectUserLogin(UserDetailVo userDetailVo) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne(NS+"selectUserLogin", userDetailVo);
	}

}
