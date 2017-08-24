package com.kpsl.auction.cash.service;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kpsl.auction.cash.vo.CashVo;
import com.kpsl.auction.user.vo.UserDetailVo;

@Service
public class CashServiceImpl implements CashService {
	Logger log = Logger.getLogger(this.getClass());
	@Autowired 
	private CashDao cashDao;
			

	@Override
	public int setCash(CashVo cashVo) {
		log.info("CashService Class setCash");
		return cashDao.insertCash(cashVo);
	}


	@Override
	public int modifyUserCash(UserDetailVo userDetailVo) {
		
		log.info("CashService Class modifyUserCash");
	
		return cashDao.updateUserCash(userDetailVo);
	}


}
