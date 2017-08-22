package com.kpsl.auction.saleslog.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SalesLogController {
	Logger log = Logger.getLogger(this.getClass());
	
	@RequestMapping(value = "/saleslog/adminSalesLogList", method = RequestMethod.GET)
	public String salesLogList() {

		log.info("로그확인");
		return "/admin/saleslog/admin_saleslog_list";
	}
}
