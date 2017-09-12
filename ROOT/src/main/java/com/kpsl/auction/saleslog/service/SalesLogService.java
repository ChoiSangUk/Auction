package com.kpsl.auction.saleslog.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.kpsl.auction.saleslog.vo.SalesLogChartVo;
import com.kpsl.auction.saleslog.vo.SalesLogVo;
@Transactional
public interface SalesLogService {
	// 회사 매입매출테이블에 입금으로 insert메서드 호출
	int addIncomeSalesLog(SalesLogVo saesLogVo);
	// 월별 입금 조회 DAO 호출
	List<SalesLogChartVo> getMonthLogForSales();
	// 월별 출금 조회 DAO 호출
	List<SalesLogChartVo> getMonthLogForExpenses();
	List<SalesLogVo> getSalesLog(SalesLogVo salesLogVo,String sk,String sv);
}
