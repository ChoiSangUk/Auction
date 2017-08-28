package com.kpsl.auction.account.service;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kpsl.auction.account.vo.AccountVo;
import com.kpsl.auction.cash.vo.CashVo;
import com.kpsl.auction.user.vo.UserDetailVo;

@Service
public class AccountServiceImpl implements AccountService {
	Logger log = Logger.getLogger(this.getClass());
	@Autowired 
	private AccountDao accountDao;
	@Override
	public int setAccount(AccountVo accountVo) {
		log.info("AccountService Class setAccount");
		return accountDao.insertAccount(accountVo);
	}
	@Override
	public AccountVo getAccount(String userId) {
		log.info("AccountService Class getAccount");
		return accountDao.selectAccount(userId);
	}
	@Override
	public int modifyAccount(AccountVo accountVo) {
		log.info("AccountService Class modifyAccount");
		return accountDao.updateAccount(accountVo);
	}
	@Override
	public int removeAccount(AccountVo accountVo) {
		log.info("AccountService Class removeAccount");
		return accountDao.deleteAccount(accountVo);
	}
			

}
