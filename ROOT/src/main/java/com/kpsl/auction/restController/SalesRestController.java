package com.kpsl.auction.restController;

import java.util.List;


import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kpsl.auction.saleslog.service.SalesLogService;
import com.kpsl.auction.saleslog.vo.SalesLogChartVo;

@RestController
public class SalesRestController {
	Logger log = Logger.getLogger(this.getClass());
	@Autowired SalesLogService salesLogService;
	
	@RequestMapping(value = "/mSalesLogAjax", method = RequestMethod.POST)
	public List<SalesLogChartVo> mSalesLogAjax() {
		List<SalesLogChartVo> chartExpensesList = salesLogService.getMonthLogForExpenses();
		List<SalesLogChartVo> chartSalesList =  salesLogService.getMonthLogForSales();
		for(int i=0; i<chartExpensesList.size(); i++) {
			chartSalesList.get(i).setExpensesPrice(chartExpensesList.get(i).getExpensesPrice()) ;
		}				
		log.info(chartExpensesList.get(0).getChartDate());
		
		return chartSalesList;
	}
}
