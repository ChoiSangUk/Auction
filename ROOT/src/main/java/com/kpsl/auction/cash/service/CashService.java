package com.kpsl.auction.cash.service;

import org.springframework.transaction.annotation.Transactional;

import com.kpsl.auction.cash.vo.CashVo;

@Transactional
public interface CashService {
	int setCash(CashVo cashVo);
}
