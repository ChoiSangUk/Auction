package com.kpsl.auction.user.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kpsl.auction.user.vo.UserRemoveVo;

@Repository
public class UserRemoveDaoImpl implements UserRemoveDao {
final String NS = "com.kpsl.auction.user.service.UserDetailMapper."; 
	
	@Autowired
    private SqlSessionTemplate sqlSessionTemplate;
	@Override
	public int insertUserDelete(UserRemoveVo userRemoveVo) {
		//유저삭제 테이블
		return sqlSessionTemplate.insert(NS+"insertUserDelete", userRemoveVo);
	}

}
