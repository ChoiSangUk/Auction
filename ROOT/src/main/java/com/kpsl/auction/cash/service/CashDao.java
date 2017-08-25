package com.kpsl.auction.cash.service;

import com.kpsl.auction.cash.vo.CashVo;
import com.kpsl.auction.user.vo.UserDetailVo;

public interface CashDao {
	int insertCash(CashVo cashVo);
	int updateUserCash(UserDetailVo userDetailVo);
	int insertCashWithdraw(CashVo cashVo);
	int updateUserCashWithdraw(UserDetailVo userDetailVo);
}
