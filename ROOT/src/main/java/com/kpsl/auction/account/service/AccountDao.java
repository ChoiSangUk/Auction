package com.kpsl.auction.account.service;

import com.kpsl.auction.account.vo.AccountVo;

public interface AccountDao {
	int insertAccount(AccountVo accountVo);
	AccountVo selectAccount(String userId);
	int updateAccount(AccountVo accountVo);
	int deleteAccount(AccountVo accountVo);
	
}
