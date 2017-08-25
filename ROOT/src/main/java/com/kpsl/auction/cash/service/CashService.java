package com.kpsl.auction.cash.service;

import org.springframework.transaction.annotation.Transactional;

import com.kpsl.auction.cash.vo.CashVo;
import com.kpsl.auction.user.vo.UserDetailVo;

@Transactional
public interface CashService {
	int setCash(CashVo cashVo);
	int modifyUserCash(UserDetailVo userDetailVo);
	int setCashWithdraw(CashVo cashVo);
	int modifyUserCashWithdraw(UserDetailVo userDetailVo);
}
