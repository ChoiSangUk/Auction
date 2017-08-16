package com.kpsl.auction.auctiongoods.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kpsl.auction.auctiongoods.service.AuctionGoodsService;
import com.kpsl.auction.auctiongoods.vo.AuctionGoodsVo;

@Controller
public class AuctionGoodsController {
	@Autowired
	private AuctionGoodsService auctionGoodsService;
	
	@RequestMapping(value = "/auctiongoods/selectauctiongoods", method = RequestMethod.GET)
		public String selectAuctionGoods(Model model) {
		
		AuctionGoodsVo auctionGoods = auctionGoodsService.getAuctionGoods();
		
		model.addAttribute("auctionGoods",auctionGoods);
		 
		return "/goods/auctiongoods";
	}
}
