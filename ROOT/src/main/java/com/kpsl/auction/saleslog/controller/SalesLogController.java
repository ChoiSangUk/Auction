package com.kpsl.auction.saleslog.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	public String salesLog(SalesLogVo salesLogVo,Model model,String sk,String sv) {
		
		model.addAttribute("list", salesLogService.getSalesLog(salesLogVo,sk,sv));
		
		log.info("로그확인");
		return "/admin/saleslog/admin_saleslog_list";
	}
}
