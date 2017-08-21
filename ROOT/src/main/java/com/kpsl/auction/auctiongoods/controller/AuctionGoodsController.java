package com.kpsl.auction.auctiongoods.controller;


import java.util.List;

import org.apache.log4j.Logger;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kpsl.auction.goodscategory.service.GoodsCategoryService;
import com.kpsl.auction.goodscategory.vo.LargeCategoryVo;
import com.kpsl.auction.goodscategory.vo.MiddleCategoryVo;
import com.kpsl.auction.goodscategory.vo.SmallCategoryVo;

@Controller
public class AuctionGoodsController {
	Logger log = Logger.getLogger(this.getClass());
	@Autowired
	private GoodsCategoryService goodsCategoryService;  

	
	@RequestMapping(value = "/auctiongoods/auctiongoodslist", method = RequestMethod.GET)
	public String auctionGoodsList(Model model) {
	
	 
	List<LargeCategoryVo> largeCategory = goodsCategoryService.getAllLargeCategory();
	 
	model.addAttribute("largeCategory", largeCategory);
	 
	return "/auctiongoods/auctiongoods_list";
	}
	
	//auctiongoods_list.jsp에서 대분류카테고리코드의 값을 받았을 때 중분류를 뿌려주기 위한 처리
	@RequestMapping(value = "/auctiongoods/auctiongoodslist_middle", method = RequestMethod.GET)
	public String auctionGoodsListMiddle(Model model,
			@RequestParam(value="largeCategoryCode", required=true) String largeCategoryCode ) {
	
	 
	List<LargeCategoryVo> largeCategory = goodsCategoryService.getAllLargeCategory();
	List<MiddleCategoryVo> middleCategoryList = goodsCategoryService.getMiddleCategoryList(largeCategoryCode);
	 
	model.addAttribute("largeCategory", largeCategory);
	model.addAttribute("middleCategoryList", middleCategoryList);
	 
	return "/auctiongoods/auctiongoods_list";
	}
	
	//auctiongoods_list.jsp에서 대,중분류카테고리코드의 값을 받았을 때 소분류를 뿌려주기 위한 처리
	@RequestMapping(value = "/auctiongoods/auctiongoodslist_small", method = RequestMethod.GET)
	public String auctionGoodsListSmall(Model model,
			@RequestParam(value="largeCategoryCode", required=true) String largeCategoryCode,
			@RequestParam(value="middleCategoryCode", required=true) String middleCategoryCode) {
	
	 
	List<LargeCategoryVo> largeCategory = goodsCategoryService.getAllLargeCategory();
	List<MiddleCategoryVo> middleCategoryList = goodsCategoryService.getMiddleCategoryList(largeCategoryCode);
	List<SmallCategoryVo> smallCategoryList = goodsCategoryService.getSmallCategoryList(largeCategoryCode, middleCategoryCode);
	 
	model.addAttribute("largeCategory", largeCategory);
	model.addAttribute("middleCategoryList", middleCategoryList);
	model.addAttribute("smallCategoryList", smallCategoryList) ;
	return "/auctiongoods/auctiongoods_list";
	}
	
	 
	
	//auctiongoodsinert  (물품등록 폼으로 이동)
	@RequestMapping(value = "/auctiongoods/auctiongoodsinsert", method = RequestMethod.GET)
	public String auctionGoodsInsert(Model model) {
	
	 
	List<LargeCategoryVo> largeCategory = goodsCategoryService.getAllLargeCategory();
	 
	model.addAttribute("largeCategory", largeCategory);
	 
	return "/auctiongoods/auctiongoods_insertForm";
	}
	
	//auctiongoods_list.jsp에서 대분류카테고리코드의 값을 받았을 때 중분류를 뿌려주기 위한 처리
	@RequestMapping(value = "/auctiongoods/auctiongoodsinsert_middle", method = RequestMethod.GET, produces="application/json; charset=UTF-8")
	@ResponseBody
	public String auctionGoodsInsert_Middle(Model model,
			@RequestParam(value = "largeCategoryCode", required = true) String largeCategoryCode) {
		
		List<LargeCategoryVo> largeCategory = goodsCategoryService.getAllLargeCategory();
		List<MiddleCategoryVo> middleCategoryList = goodsCategoryService.getMiddleCategoryList(largeCategoryCode);

		Gson gson = new Gson();
		return gson.toJson(middleCategoryList);
	
	}
	
	@RequestMapping(value = "/auctiongoods/auctiongoodsinsert_small", method = RequestMethod.GET, produces="application/json; charset=UTF-8")
	@ResponseBody
	public String auctionGoodsInsert_Small(Model model,
			@RequestParam(value="largeCategoryCode", required=true) String largeCategoryCode,
			@RequestParam(value = "middleCategoryCode", required = true) String middleCategoryCode) {
		
		List<LargeCategoryVo> largeCategory = goodsCategoryService.getAllLargeCategory();
		List<SmallCategoryVo> smallCategoryList = goodsCategoryService.getSmallCategoryList(largeCategoryCode,middleCategoryCode);

		Gson gson = new Gson();
		return gson.toJson(smallCategoryList);
	
	}
	
	 
}
