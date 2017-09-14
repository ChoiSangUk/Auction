package com.kpsl.auction.saleslog.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kpsl.auction.saleslog.service.SalesLogService;
import com.kpsl.auction.saleslog.vo.SalesLogVo;

@Controller
public class SalesLogController {
	Logger log = Logger.getLogger(this.getClass());
	@Autowired SalesLogService salesLogService;
	
	@RequestMapping(value = "/saleslog/adminSalesLogList", method = RequestMethod.GET)
	public String salesLogList() {

		log.info("로그확인");
		return "/admin/saleslog/admin_saleslog_list";
	}
	@RequestMapping(value = "/saleslog/adminSalesLogList", method = RequestMethod.POST)
	public String salesLog(SalesLogVo salesLogVo,Model model,String sk,String sv)	{
		
		/*int SalesLogCount = salesLogService.getSalesLogCount(salesLogVo, sk, sv);
		int pagePerRow = 2;
		// count/pagePerRow시 결과값이 소수점이하는 버리기 때문에 pagePerRow를 double형으로 형변환시킴
		int lastPage = (int) (Math.ceil(SalesLogCount / (double)pagePerRow));
			*/

		model.addAttribute("list", salesLogService.getSalesLog(salesLogVo,sk,sv));
		log.info("로그확인");
		return "/admin/saleslog/admin_saleslog_list";
	}
}
