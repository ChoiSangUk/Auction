package com.kpsl.auction.ad.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kpsl.auction.ad.service.AdPaymentService;

@Controller
public class AdPaymentController {
	@Autowired AdPaymentService adPaymentService;
	
	Logger log = Logger.getLogger(this.getClass());
	
	@RequestMapping(value = "/mypage/adPaymentInsertForm", method = RequestMethod.GET)
	public String adPaymentInsertForm(Model model) {
		
		log.info("adPaymentInsertForm 요청 확인");
		
		return "/mypage/mypage_adPayment_insertForm";	
	}
}
