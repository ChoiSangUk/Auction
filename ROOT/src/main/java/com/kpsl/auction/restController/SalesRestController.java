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
		List<SalesLogChartVo> chartSalesList =  salesLogService.getMonthLogForSales();
		List<SalesLogChartVo> chartExpensesList = salesLogService.getMonthLogForExpenses();
		for(int i=0; i<chartSalesList.size(); i++) {
			chartExpensesList.get(i).setSalesPrice(chartSalesList.get(i).getSalesPrice()) ;
		}				
		return chartExpensesList;
	}
}
