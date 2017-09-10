package com.kpsl.auction.user.service;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kpsl.auction.user.vo.UserDetailVo;
import com.kpsl.auction.user.vo.UserVo;


@Repository
public class UserDetailDaoImpl implements UserDetailDao {
	final String NS = "com.kpsl.auction.user.service.UserDetailMapper."; 
	
	@Autowired
    private SqlSessionTemplate sqlSessionTemplate;
	//구매자가입
	@Override
	public int insertUserBuyer(UserDetailVo userDetailVo) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert(NS+"insertUserBuyer", userDetailVo);
	}
	//절대 지워지지않는 아이디
	@Override
	public int insertUser(UserVo userVo) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert(NS+"insertUser", userVo);
	}
	//판매자가입
	@Override
	public int insertUserSeller(UserDetailVo userDetailVo) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert(NS+"insertUserSeller", userDetailVo);
	}
	@Override
	public int updateUserTrans(UserDetailVo userDetailVo) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update(NS+"updateUsertransform", userDetailVo);
	}
	@Override
	public int updateUser(UserDetailVo userDetailVo) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update(NS+"updateUser", userDetailVo);
	}
	@Override
	public UserDetailVo selectUserPwFind(String userId, String userEmail) {
		Map<String,String> pwFindMap = new HashMap<String,String>();
		pwFindMap.put("userId", userId);
		pwFindMap.put("userEmail", userEmail);
		return sqlSessionTemplate.selectOne(NS+"selectUserPwFind", pwFindMap);
	}


}
