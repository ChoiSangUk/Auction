package com.kpsl.auction.ad.controller;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AdRefndApplyController {

	Logger log = Logger.getLogger(this.getClass());
	
	@RequestMapping(value = "/mypage/adRefundApplyInsertForm", method = RequestMethod.GET)
	public String adRefundApplyAdd(Model model, HttpSession session
									,@RequestParam (value="adPaymentCode", required=true) String adPaymentCode) {
			
		log.info("adRefundApplyAdd");
		log.info(adPaymentCode+"<--- 결제코드 확인");
		
		return "/mypage/mypage_adRefundApply_insertForm";
	}
	
	
}
