package com.kpsl.auction.account.service;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kpsl.auction.account.vo.AccountVo;

@Repository
public class AccountDaoImpl implements AccountDao {
	final String NS = "com.kpsl.auction.account.service.AccountMapper."; 
	Logger log = Logger.getLogger(this.getClass());
	@Autowired
    private SqlSessionTemplate sqlSessionTemplate;
	@Override
	public int insertAccount(AccountVo accountVo) {
		return sqlSessionTemplate.insert(NS+"insertAccount", accountVo);
	}
	@Override
	public AccountVo selectAccount(String userId) {
		
		return sqlSessionTemplate.selectOne(NS+"selectUserAccount", userId);
	}
	@Override
	public int updateAccount(AccountVo accountVo) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update(NS+"updateUserAccount", accountVo);
	}
	@Override
	public int deleteAccount(AccountVo accountVo) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.delete(NS+"deleteUserAccount", accountVo);
	}


}
