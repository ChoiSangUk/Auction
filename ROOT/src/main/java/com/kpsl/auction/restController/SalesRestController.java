package com.kpsl.auction.restController;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;

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
		
		List<SalesLogChartVo> chartList = new ArrayList<SalesLogChartVo>();		
		chartList = salesLogService.getMonthLogForSales();
		chartList = salesLogService.getMonthLogForExpenses();

		return chartList;
	}
}
