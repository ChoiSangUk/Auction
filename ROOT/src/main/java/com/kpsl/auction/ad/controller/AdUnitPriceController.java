package com.kpsl.auction.ad.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kpsl.auction.ad.service.AdUnitPriceService;
import com.kpsl.auction.ad.vo.AdUnitPriceVo;

@Controller
public class AdUnitPriceController {
	@Autowired AdUnitPriceService adUnitPriceService;
	
	Logger log = Logger.getLogger(this.getClass());
	
	@RequestMapping(value = "/ad/adminAdManagement", method = RequestMethod.GET)
	public String adUnitPriceList(Model model) {
		
		List<AdUnitPriceVo> list = adUnitPriceService.getAdUnitPirceList();
		
		model.addAttribute("list",list);
		log.info("boardAdUnitPrice 확인");
		return "/admin/ad/admin_ad_management";
	}
	
	@RequestMapping(value = "/ad/adminAdUnitUpdateForm", method = RequestMethod.GET)
	public String adUnitPriceModify(Model model) {
		/** 업데이트폼에 들어갈 변수들 받아서 보내주는 기능 추가 예정*/
		log.info("adUnitPriceModify 확인");
		return "/admin/ad/admin_adUnit_updateForm";
	}
}
