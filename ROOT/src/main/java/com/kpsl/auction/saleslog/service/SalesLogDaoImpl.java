package com.kpsl.auction.saleslog.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kpsl.auction.cash.vo.CashVo;
import com.kpsl.auction.saleslog.vo.SalesLogChartVo;
import com.kpsl.auction.saleslog.vo.SalesLogVo;

@Repository
public class SalesLogDaoImpl implements SalesLogDao{
	final String salesLogMapper = "com.kpsl.auction.saleslog.service.SalesLogMapper."; 
	Logger log = Logger.getLogger(this.getClass());
	@Autowired
    private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public int insertSalesCash(CashVo cashVo,SalesLogVo logVo) {
		
		log.info("insertSalesCash 호출확인");
		
		return sqlSessionTemplate.insert(salesLogMapper+"insertCashSalesLog",cashVo);
	}

	@Override
	public int insertIncomeSalesLog(SalesLogVo salesLogVo) {
		
		log.info("insertAdPaymentSalesLog 호출 확인");
		
		return sqlSessionTemplate.insert(salesLogMapper+"insertIncomeSalesLog",salesLogVo);
	}

	@Override
	public List<SalesLogChartVo> selectMonthLogForSales() {
		
		log.info("selectMonthLogForSales 호출 확인");
		
		return sqlSessionTemplate.selectList(salesLogMapper+"selectMonthLogForSales");
	}

	@Override
	public List<SalesLogChartVo> selectMonthLogForExpenses() {
		
		log.info("selectMonthLogForExpenses 호출 확인");
		
		return sqlSessionTemplate.selectList(salesLogMapper+"selectMonthLogForExpenses");
	}

	@Override
	public List<SalesLogVo> selectSalesLog(SalesLogVo salesLogVo) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList(salesLogMapper+"selectSalesLog", salesLogVo);
	}
}
