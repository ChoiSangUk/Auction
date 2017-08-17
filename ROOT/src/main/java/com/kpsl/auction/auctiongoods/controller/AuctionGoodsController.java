package com.kpsl.auction.auctiongoods.controller;


import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kpsl.auction.auctiongoods.service.AuctionGoodsService;
import com.kpsl.auction.auctiongoods.vo.AuctionGoodsVo;
import com.kpsl.auction.goodscategory.service.GoodsCategoryService;
import com.kpsl.auction.goodscategory.vo.LargeCategoryVo;
import com.kpsl.auction.goodscategory.vo.MiddleCategoryVo;

@Controller
public class AuctionGoodsController {
	Logger log = Logger.getLogger(this.getClass());
	@Autowired
	private AuctionGoodsService auctionGoodsService;
	@Autowired
	private GoodsCategoryService goodsCategoryService;  
	// 테스트 용
	/*@RequestMapping(value = "/auctiongoods/selectauctiongoods", method = RequestMethod.GET)
		public String selectAuctionGoods(Model model) {
		
		AuctionGoodsVo auctionGoods = auctionGoodsService.getAuctionGoods();
		
		model.addAttribute("auctionGoods",auctionGoods);
		 
		return "/auctiongoods/auctiongoods";
	}*/
	
	@RequestMapping(value = "/auctiongoods/auctiongoodslist", method = RequestMethod.GET)
	public String auctionGoodsList(Model model) {
	
	AuctionGoodsVo auctionGoods = auctionGoodsService.getAuctionGoods();
	List<LargeCategoryVo> largeCategory = goodsCategoryService.getAllLargeCategory();
	model.addAttribute("auctionGoods",auctionGoods);
	model.addAttribute("largeCategory", largeCategory);
	 
	return "/auctiongoods/auctiongoods_list";
	}
	//auctiongoods_list.jsp에서 대분류카테고리코드의 값을 받았을 때 중분류를 뿌려주기 위한 처리
	@RequestMapping(value = "/auctiongoods/auctiongoodslist_middle", method = RequestMethod.GET)
	public String auctionGoodsListMiddle(Model model,
			@RequestParam(value="largeCategoryCode", required=true) String largeCategoryCode ) {
	
	AuctionGoodsVo auctionGoods = auctionGoodsService.getAuctionGoods();
	List<LargeCategoryVo> largeCategory = goodsCategoryService.getAllLargeCategory();
	List<MiddleCategoryVo> middleCategoryList = goodsCategoryService.getMiddleCategoryList(largeCategoryCode);
	model.addAttribute("auctionGoods",auctionGoods);
	model.addAttribute("largeCategory", largeCategory);
	model.addAttribute("middleCategoryList", middleCategoryList);
	 
	return "/auctiongoods/auctiongoods_list";
	}
	
	@RequestMapping(value = "/auctiongoods/ex", method = RequestMethod.GET)
	public String ex(Model model) {
		 
	AuctionGoodsVo auctionGoods = auctionGoodsService.getAuctionGoods();
	
	model.addAttribute("auctionGoods",auctionGoods);
	 
	return "/ex_form";
	}
}
