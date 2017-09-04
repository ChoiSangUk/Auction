package com.kpsl.auction.saleslog.service;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.kpsl.auction.saleslog.vo.SalesLogVo;

public class SalesLogServiceImpl implements SalesLogService{
	
	Logger log = Logger.getLogger(this.getClass());
	@Autowired SalesLogDao salesLogDao;
	
	@Override
	public int addIncomeSalesLog(SalesLogVo salesLogVo) {
		
		log.info("addIncomeSalesLog 호출확인");
		
		return salesLogDao.insertIncomeSalesLog(salesLogVo);
	}
}
