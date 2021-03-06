package com.kpsl.auction.ad.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kpsl.auction.ad.service.AdUnitPriceService;
import com.kpsl.auction.ad.vo.AdUnitPriceVo;

@Controller
public class AdUnitPriceController {
	@Autowired AdUnitPriceService adUnitPriceService;
	
	Logger log = Logger.getLogger(this.getClass());
	
	// 광고 단가 리스트 요청
	@RequestMapping(value = "/ad/adminAdManagement", method = RequestMethod.GET)
	public String adUnitPriceList(Model model) {
		
		List<AdUnitPriceVo> list = adUnitPriceService.getAdUnitPirceList();
		
		model.addAttribute("list",list);
		log.info("boardAdUnitPrice 확인");
		return "/admin/ad/admin_ad_management";
	}
	
	// 광고단가 수정폼 요청
	@RequestMapping(value = "/ad/adminAdUnitUpdateForm", method = RequestMethod.GET)
	public String adUnitPriceModify(Model model
									, @RequestParam(value="adUnitPriceCode", required=true) String adUnitPriceCode) {
		AdUnitPriceVo adUnitPriceVo = adUnitPriceService.getAdUnitPriceByAdUnitPriceCode(adUnitPriceCode);
		model.addAttribute("ad", adUnitPriceVo);
		log.info(adUnitPriceCode);
		log.info(adUnitPriceVo.getAdUnitPriceCode());
		return "/admin/ad/admin_adUnit_updateForm";
	}
	
	// 광고단가 수정(액션) 요청
	@RequestMapping(value = "/ad/adminAdUnitUpdateForm", method = RequestMethod.POST)
	public String adUnitPriceModify(AdUnitPriceVo adUnitPriceVo) {
		
		adUnitPriceService.modifyAdUnitPrice(adUnitPriceVo);
		log.info("수정확인 확인");
		return "redirect:/ad/adminAdManagement";
	}
}
