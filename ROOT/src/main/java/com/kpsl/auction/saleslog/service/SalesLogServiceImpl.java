package com.kpsl.auction.saleslog.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kpsl.auction.saleslog.vo.SalesLogChartVo;
import com.kpsl.auction.saleslog.vo.SalesLogVo;

@Service
public class SalesLogServiceImpl implements SalesLogService{
	
	Logger log = Logger.getLogger(this.getClass());
	@Autowired SalesLogDao salesLogDao;
	
	@Override
	public int addIncomeSalesLog(SalesLogVo salesLogVo) {
		
		log.info("addIncomeSalesLog 호출확인");
		
		return salesLogDao.insertIncomeSalesLog(salesLogVo);
	}

	@Override
	public List<SalesLogChartVo> getMonthLogForSales() {
		
		log.info("selectMonthLogForSales 호출 확인");
		
		return salesLogDao.selectMonthLogForSales();
	}

	@Override
	public List<SalesLogChartVo> getMonthLogForExpenses() {
		
		log.info("selectMonthLogForExpenses 호출 확인");
		
		return salesLogDao.selectMonthLogForExpenses();
	}

	@Override
	public List<SalesLogVo> getSalesLog(SalesLogVo salesLogVo,String sk,String sv) {
		
		if(sk.equals("salesLogUserId")) {
			salesLogVo.setSalesLogUserId(sv+"%");
			log.info(sk+"<-- sk확인");
			log.info(sv+"<-- sv확인");
		}
		return salesLogDao.selectSalesLog(salesLogVo);
	}

	@Override
	public int getSalesLogCount(SalesLogVo salesLogVo, String sk, String sv) {
		log.info("selectgetSalesLogCount 호출 확인");
		
		
		if(sk.equals("salesLogUserId")) {
			salesLogVo.setSalesLogUserId(sv+"%");
			log.info(sk+"<-- sk확인");
			log.info(sv+"<-- sv확인");
		}
		return salesLogDao.selectSalesLogCount(salesLogVo);
	}

}
