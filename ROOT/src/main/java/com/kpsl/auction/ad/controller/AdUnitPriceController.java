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
	
	@RequestMapping(value = "/board/boardAdUnitPrice", method = RequestMethod.GET)
	public String boardAdUnitPrice(Model model) {
		
		List<AdUnitPriceVo> list = adUnitPriceService.getAdUnitPirceList();
		
		model.addAttribute("list",list);
		log.info("boardAdUnitPrice 로그확인"+"<---" + model);
		return "ad/ad_unit_price";
	}
}
