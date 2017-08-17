package com.kpsl.auction.auctiongoods.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kpsl.auction.auctiongoods.service.AuctionGoodsService;
import com.kpsl.auction.auctiongoods.vo.AuctionGoodsVo;
import com.kpsl.auction.goodscategory.service.GoodsCategoryService;
import com.kpsl.auction.goodscategory.vo.LargeCategoryVo;

@Controller
public class AuctionGoodsController {
	@Autowired
	private AuctionGoodsService auctionGoodsService;
	@Autowired
	private GoodsCategoryService goodsCategoryService;  
	// 테스트 용
	@RequestMapping(value = "/auctiongoods/selectauctiongoods", method = RequestMethod.GET)
		public String selectAuctionGoods(Model model) {
		
		AuctionGoodsVo auctionGoods = auctionGoodsService.getAuctionGoods();
		
		model.addAttribute("auctionGoods",auctionGoods);
		 
		return "/auctiongoods/auctiongoods";
	}
	
	@RequestMapping(value = "/auctiongoods/auctiongoodslist", method = RequestMethod.GET)
	public String auctionGoodsList(Model model) {
	
	AuctionGoodsVo auctionGoods = auctionGoodsService.getAuctionGoods();
	List<LargeCategoryVo> largeCategory = goodsCategoryService.getAllLargeCategory();
	model.addAttribute("auctionGoods",auctionGoods);
	model.addAttribute("largeCategory", largeCategory);
	 
	return "/auctiongoods/auctiongoods_list";
	}
	
	@RequestMapping(value = "/auctiongoods/ex", method = RequestMethod.GET)
	public String ex(Model model) {
	
	AuctionGoodsVo auctionGoods = auctionGoodsService.getAuctionGoods();
	
	model.addAttribute("auctionGoods",auctionGoods);
	 
	return "/ex_form";
	}
}
