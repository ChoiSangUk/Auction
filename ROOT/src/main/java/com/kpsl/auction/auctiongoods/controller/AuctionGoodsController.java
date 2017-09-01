package com.kpsl.auction.auctiongoods.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kpsl.auction.auctiongoods.service.AuctionGoodsService;
import com.kpsl.auction.auctiongoods.vo.AuctionGoodsVo;
import com.kpsl.auction.goodscategory.service.GoodsCategoryService;
import com.kpsl.auction.goodscategory.vo.LargeCategoryVo;
import com.kpsl.auction.goodscategory.vo.MiddleCategoryVo;
import com.kpsl.auction.goodscategory.vo.SmallCategoryVo;

@Controller
public class AuctionGoodsController {
	Logger log = Logger.getLogger(this.getClass());
	@Autowired
	private GoodsCategoryService goodsCategoryService;
	@Autowired
	private AuctionGoodsService auctionGoodsService;

	// 판매 보증금 비교 ajax
	@RequestMapping(value = "/sellerdepositajax")
	@ResponseBody
	public void sellerDepositCompare() {
		System.out.println("insertForm.jsp에서 보유금과 보증금 비교");
	}

	// 스마트 에디터 테스트
	@RequestMapping(value = "/test")
	public String test() {
		return "auctiongoods/test";
	}

	@RequestMapping(value = "/auctiongoods/auctiongoodslist", method = RequestMethod.GET)
	public String auctionGoodsList(Model model) {

		List<LargeCategoryVo> largeCategory = goodsCategoryService.getAllLargeCategory();

		model.addAttribute("largeCategory", largeCategory);

		return "/auctiongoods/auctiongoods_list";
	}

	// auctiongoods_list.jsp에서 대분류카테고리코드의 값을 받았을 때 중분류를 뿌려주기 위한 처리
	@RequestMapping(value = "/auctiongoods/auctiongoodslist_middle", method = RequestMethod.GET)
	public String auctionGoodsListMiddle(Model model,
			@RequestParam(value = "largeCategoryCode", required = true) String largeCategoryCode) {

		List<LargeCategoryVo> largeCategory = goodsCategoryService.getAllLargeCategory();
		List<MiddleCategoryVo> middleCategoryList = goodsCategoryService.getMiddleCategoryList(largeCategoryCode);

		model.addAttribute("largeCategory", largeCategory);
		model.addAttribute("middleCategoryList", middleCategoryList);

		return "/auctiongoods/auctiongoods_list";
	}

	// auctiongoods_list.jsp에서 대,중분류카테고리코드의 값을 받았을 때 소분류를 뿌려주기 위한 처리
	@RequestMapping(value = "/auctiongoods/auctiongoodslist_small", method = RequestMethod.GET)
	public String auctionGoodsListSmall(Model model,
			@RequestParam(value = "largeCategoryCode", required = true) String largeCategoryCode,
			@RequestParam(value = "middleCategoryCode", required = true) String middleCategoryCode) {

		List<LargeCategoryVo> largeCategory = goodsCategoryService.getAllLargeCategory();
		List<MiddleCategoryVo> middleCategoryList = goodsCategoryService.getMiddleCategoryList(largeCategoryCode);
		List<SmallCategoryVo> smallCategoryList = goodsCategoryService.getSmallCategoryList(largeCategoryCode,
				middleCategoryCode);

		model.addAttribute("largeCategory", largeCategory);
		model.addAttribute("middleCategoryList", middleCategoryList);
		model.addAttribute("smallCategoryList", smallCategoryList);
		return "/auctiongoods/auctiongoods_list";
	}

	// auctiongoodsinert (물품등록 폼으로 이동)
	@RequestMapping(value = "/auctiongoods/auctiongoodsinsert", method = RequestMethod.GET)
	public String auctionGoodsInsert(Model model) {

		List<LargeCategoryVo> largeCategory = goodsCategoryService.getAllLargeCategory();

		model.addAttribute("largeCategory", largeCategory);

		return "/auctiongoods/auctiongoods_insertForm";
	}

	// auctiongoodsinert action 부분
	@RequestMapping(value = "/auctiongoods/auctiongoodsinsert", method = RequestMethod.POST)
	public void auctionGoodsInsert_Post(HttpServletRequest request) {
		System.out.println("에디터 컨텐츠 값 : " + request.getParameter("ir1"));
	}

	// auctiongoods_list.jsp에서 대분류카테고리코드의 값을 받았을 때 중분류를 뿌려주기 위한 처리
	@RequestMapping(value = "/auctiongoods/auctiongoodsinsert_middle", method = RequestMethod.GET, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String auctionGoodsInsert_Middle(Model model,
			@RequestParam(value = "largeCategoryCode", required = true) String largeCategoryCode) {
		log.info("auctionGoodsInsert_Middle에서 largeCategoryCode  :" + largeCategoryCode);
		// List<LargeCategoryVo> largeCategory =
		// goodsCategoryService.getAllLargeCategory();
		List<MiddleCategoryVo> middleCategoryList = goodsCategoryService.getMiddleCategoryList(largeCategoryCode);

		Gson gson = new Gson();
		return gson.toJson(middleCategoryList);

	}

	@RequestMapping(value = "/auctiongoods/auctiongoodsinsert_small", method = RequestMethod.GET, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String auctionGoodsInsert_Small(Model model,
			@RequestParam(value = "largeCategoryCode", required = true) String largeCategoryCode,
			@RequestParam(value = "middleCategoryCode", required = true) String middleCategoryCode) {

		log.info("auctionGoodsInsert_Small에서 largeCategoryCode :" + largeCategoryCode);
		// List<LargeCategoryVo> largeCategory =
		// goodsCategoryService.getAllLargeCategory();
		List<SmallCategoryVo> smallCategoryList = goodsCategoryService.getSmallCategoryList(largeCategoryCode,
				middleCategoryCode);

		Gson gson = new Gson();
		return gson.toJson(smallCategoryList);

	}

	// 물품리스트
	@RequestMapping(value = "/auctiongoods/goodslist", method = RequestMethod.GET)
	public String goodslist(Model model) {

		log.info("리스트 클릭시 controller 메서드로 들어오는가?");
		List<AuctionGoodsVo> list = auctionGoodsService.getAuctionGoodss();
		log.info(list);
		model.addAttribute("list", list);
		return "/auctiongoods/auctiongoods_list1";
	}

	@RequestMapping(value = "/enddateajax", method = RequestMethod.GET)
	@ResponseBody
	public String endDate(Model model, @RequestParam(value = "endDate", required = true) String endDate) {
		log.info("enddateajax에서 " + endDate + " 리턴");
		return endDate;
	}
}
