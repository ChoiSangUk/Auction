package com.kpsl.auction.account.service;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kpsl.auction.account.vo.AccountVo;

@Repository
public class AccountDaoImpl implements AccountDao {
	final String NS = "com.kpsl.auction.cash.service.CashMapper."; 
	Logger log = Logger.getLogger(this.getClass());
	@Autowired
    private SqlSessionTemplate sqlSessionTemplate;
	@Override
	public int insertAccount(AccountVo accountVo) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert(NS+"insertAccount", accountVo);
	}

	

}
