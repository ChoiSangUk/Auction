package com.kpsl.auction.cash.service;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kpsl.auction.cash.vo.CashVo;

@Repository
public class CashDaoImpl implements CashDao {
	final String NS = "com.kpsl.auction.cash.service.CashMapper."; 
	Logger log = Logger.getLogger(this.getClass());
	@Autowired
    private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public int insertCash(CashVo cashVo) {
		log.info("CashDao Class"+ cashVo);
		return sqlSessionTemplate.insert(NS+"insertCash",cashVo);
	}

}
