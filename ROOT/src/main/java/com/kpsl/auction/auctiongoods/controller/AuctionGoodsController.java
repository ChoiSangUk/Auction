package com.kpsl.auction.auctiongoods.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
import com.kpsl.auction.goodscategory.vo.SmallCategoryVo;

@Controller
public class AuctionGoodsController {
	Logger log = Logger.getLogger(this.getClass());
	@Autowired
	private GoodsCategoryService goodsCategoryService;
	@Autowired
	private AuctionGoodsService auctionGoodsService;


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
	public String auctionGoodsInsert_Post(AuctionGoodsVo auctionGoodsVo, Model model) {
		System.out.println("acutiongoodsinsert_Post");
		//System.out.println("에디터 컨텐츠 값 : " + request.getParameter("auctionGoodsContents"));
		//System.out.println("경매 기간 : "+ request.getParameter("auctionGoodsTerm"));
		//AuctionGoodsVo auctionGoodsVo, Model model
		//System.out.println(auctionGoodsVo.toString());
		
		//img태그를 찾아서 소스 분리
		String contents = auctionGoodsVo.getAuctionGoodsContents();
        Pattern pattern = Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>"); //img 태그 src 추출 정규표현식
        Matcher matcher = pattern.matcher(contents);
        
        
        //img소스를 담을 list 객체 
        List<String> imgList = new ArrayList<String>();
        
        //추출한 img src들을 imgList에 담아줌
        while(matcher.find()){
        	imgList.add(matcher.group(1));
            //System.out.println(matcher.group(1));
        }
      
        /*  for(int i = 0; i<imgList.size(); i++){
        	System.out.println(imgList.get(i)); 
        }*/
        //물품등록할 service 호출
        auctionGoodsService.addAuctionGoods(auctionGoodsVo, imgList);

		
        return auctionGoodsList(model);
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
	
	
}
