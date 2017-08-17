package com.kpsl.auction.ad.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kpsl.auction.ad.service.AdApplyService;
import com.kpsl.auction.ad.service.AdUnitPriceService;
import com.kpsl.auction.ad.vo.AdApplyVo;
import com.kpsl.auction.ad.vo.AdUnitPriceVo;


@Controller
public class AdApplyController {
	//@Autowired AdApplyService adApplyService;
	@Autowired AdUnitPriceService adUnitPriceService;
	Logger log = Logger.getLogger(this.getClass());
	
	// 광고 신청 폼 요청
	@RequestMapping(value = "/mypage/adApplyInsertForm", method = RequestMethod.GET)
	public String adApplyAdd(Model model) {
		
		List<AdUnitPriceVo> list = adUnitPriceService.getAdUnitPirceList(); 
		
		model.addAttribute("list",list);
		log.info(list);
		return "/mypage/mypage_adPayment_insertForm";
	}
	// 광고 (액션) 요청
	@RequestMapping(value = "/mypage/adApplyInsertForm", method = RequestMethod.POST)
	public String adApplyAdd(AdApplyVo adApplyVo) {
		
		log.info("adApplyAdd 확인");
		return "redirect:/mypage/mypageMain";
	}
}
