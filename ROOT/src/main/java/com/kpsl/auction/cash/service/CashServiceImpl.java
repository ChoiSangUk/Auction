package com.kpsl.auction.cash.service;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kpsl.auction.cash.vo.CashVo;

@Service
public class CashServiceImpl implements CashService {
	Logger log = Logger.getLogger(this.getClass());
	@Autowired private CashDao cashDao;

	@Override
	public int setCash(CashVo cashVo) {
		log.info("CashService Class");
		return cashDao.insertCash(cashVo);
	}

}
