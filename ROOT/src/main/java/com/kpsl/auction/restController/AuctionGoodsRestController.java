package com.kpsl.auction.restController;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.kpsl.auction.auctiongoods.service.AuctionGoodsService;
import com.kpsl.auction.auctiongoods.vo.AuctionGoodsAndFirstImageVo;
import com.kpsl.auction.auctiongoods.vo.AuctionGoodsVo;
import com.kpsl.auction.goodscategory.service.GoodsCategoryService;
import com.kpsl.auction.goodscategory.vo.MiddleCategoryVo;
import com.kpsl.auction.goodscategory.vo.SmallCategoryVo;

@RestController
public class AuctionGoodsRestController {
	Logger log = Logger.getLogger(this.getClass());
	@Autowired
	private GoodsCategoryService goodsCategoryService;
	@Autowired
	private AuctionGoodsService auctionGoodsService;
	
	
	//모든 물품을 뿌려주기 위한 처리
	@RequestMapping(value = "/auctiongoods/auctiongoodslist_getallgoods", produces = "application/json; charset=UTF-8" )
	public String auctionGoodsList_getAllGoods(){
		System.out.println("여기는 오나 ?");
		List<AuctionGoodsAndFirstImageVo> auctionGoodsList = auctionGoodsService.getAllAuctionGoods(); 
		System.out.println("auctionGoodsList는 있나? "+auctionGoodsList);
		
		Gson gson = new Gson();
		return gson.toJson(auctionGoodsList);
	}
	
	// 판매 보증금 비교 ajax
	@RequestMapping(value = "/sellerdepositajax")
	public void sellerDepositCompare() {
		System.out.println("insertForm.jsp에서 보유금과 보증금 비교");
	}

	// auctiongoods_list.jsp에서 대분류카테고리코드의 값을 받았을 때 중분류를 뿌려주기 위한 처리
	@RequestMapping(value = "/auctiongoods/auctiongoodsinsert_middle", method = RequestMethod.GET, produces = "application/json; charset=UTF-8")
	public String auctionGoodsInsert_Middle(Model model,
			@RequestParam(value = "largeCategoryCode", required = true) String largeCategoryCode) {
		log.info("auctionGoodsInsert_Middle에서 largeCategoryCode  :" + largeCategoryCode);
		// List<LargeCategoryVo> largeCategory =
		// goodsCategoryService.getAllLargeCategory();
		List<MiddleCategoryVo> middleCategoryList = goodsCategoryService.getMiddleCategoryList(largeCategoryCode);

		Gson gson = new Gson();
		return gson.toJson(middleCategoryList);

	}

	// auctiongoods_insertForm 에서 소분류 뿌려주기
	@RequestMapping(value = "/auctiongoods/auctiongoodsinsert_small", method = RequestMethod.GET, produces = "application/json; charset=UTF-8")
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

	// auctiongoods_insertForm 에서 시작일 기간 입력하면 종료일 자동 입력
	@RequestMapping(value = "/enddateajax", method = RequestMethod.GET)
	public String endDate(Model model, @RequestParam(value = "endDate", required = true) String endDate) {
		log.info("enddateajax에서 " + endDate + " 리턴");
		return endDate;
	}
}
