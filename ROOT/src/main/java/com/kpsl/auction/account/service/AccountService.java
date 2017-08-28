package com.kpsl.auction.account.service;

import org.springframework.transaction.annotation.Transactional;

import com.kpsl.auction.account.vo.AccountVo;

@Transactional
public interface AccountService {
	int setAccount(AccountVo accountVo);
}
