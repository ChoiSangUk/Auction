package com.kpsl.auction.saleslog.service;

import com.kpsl.auction.cash.vo.CashVo;
import com.kpsl.auction.saleslog.vo.SalesLogVo;

public interface SalesLogDao {

	// 캐쉬충전시 회사매입매출 INSERT 쿼리
	int insertSalesCash(CashVo cashVo,SalesLogVo logVo);
	// 광고결제시 회사매입매출 INSERT 쿼리
	int insertIncomeSalesLog(SalesLogVo salesLogVo);
}
