package com.kpsl.auction.auctiongoods.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kpsl.auction.auctiongoods.service.AuctionGoodsService;
import com.kpsl.auction.auctiongoods.vo.AuctionGoodsAndFirstImageVo;
import com.kpsl.auction.auctiongoods.vo.AuctionGoodsImageVo;
import com.kpsl.auction.auctiongoods.vo.AuctionGoodsVo;
import com.kpsl.auction.bid.service.BidService;
import com.kpsl.auction.bid.vo.BidVo;
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
	@Autowired
	private BidService bidService;
	
	//내 판매물품
	@RequestMapping(value = "/auctiongoods/mySalesGoods", method = RequestMethod.GET)
	public String getMySalesGoodsList(Model model,
			@RequestParam(value = "userId", required = true) String userId){
		List<AuctionGoodsAndFirstImageVo> mySalesGoodsList = auctionGoodsService.getAllAuctionGoodsByUserId(userId); 
		System.out.println("controller 에서");
		System.out.println(mySalesGoodsList.toString());
		model.addAttribute("mySalesGoodsList", mySalesGoodsList);
				return "mypage/mypage_my_sales_goods_list";
		
	}
	
	@RequestMapping(value = "/auctiongoods/mySales", method = RequestMethod.GET)
	public String getMySalesList(Model model, HttpSession session, AuctionGoodsVo auctionGoodsVo
								,@RequestParam(value="auctionGoodsState", required = true) String auctionGoodsState){
		String userId = (String) session.getAttribute("userId");
		auctionGoodsVo.setUserId(userId);
		auctionGoodsVo.setAuctionGoodsState(auctionGoodsState);
		List<AuctionGoodsAndFirstImageVo> mySalesGoodsList = auctionGoodsService.getAllAuctionGoodsByUserIdAndAuctionGoodsState(auctionGoodsVo);
		System.out.println("controller 에서");
		System.out.println(mySalesGoodsList.toString());
		model.addAttribute("mySalesGoodsList", mySalesGoodsList);
				return "mypage/mypage_my_sales_list";
		
	}
	//물품 수정
	@RequestMapping(value = "/auctiongoods/auctiongoodsupdate", method = RequestMethod.GET)
	public String updateAuctionGoods(Model model, 
			@RequestParam(value = "auctionGoodsCode", required = true) String auctionGoodsCode){
			
		List<LargeCategoryVo> largeCategory = goodsCategoryService.getAllLargeCategory();
		model.addAttribute("largeCategory", largeCategory);
		
		AuctionGoodsVo auctionGoods = auctionGoodsService.getAuctionGoods(auctionGoodsCode);
		model.addAttribute("auctionGoods", auctionGoods);
			
		return "auctiongoods/auctiongoods_updateForm";
		}
	
	//물품 수정 액션 부분
	@RequestMapping(value = "/auctiongoods/auctiongoodsupdate_action", method=RequestMethod.POST)
	public String updateAuctionGoodsAction(Model model,AuctionGoodsVo auctionGoodsVo){
		String contents = auctionGoodsVo.getAuctionGoodsContents();
        Pattern pattern = Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>"); //img 태그 src 추출 정규표현식
        Matcher matcher = pattern.matcher(contents);
        System.out.println("update에서의 acutionGoodsVo"+auctionGoodsVo.toString());
        
        //img소스를 담을 list 객체 
        List<String> imgList = new ArrayList<String>();
        
        //추출한 img src들을 imgList에 담아줌
        while(matcher.find()){
        	imgList.add(matcher.group(1));
            //System.out.println(matcher.group(1));
        }
         auctionGoodsService.updateAuctionGoods(auctionGoodsVo, imgList);
        
		return getAuctionGoods(model, null, auctionGoodsVo.getAuctionGoodsCode());
	}
	//선택한 단일 물품 상세 페이지로
	@RequestMapping(value = "/auctiongoods/auctiongoods_detail", method = RequestMethod.GET)
	public String getAuctionGoods(Model model, BidVo bidVo,
			@RequestParam(value = "auctionGoodsCode", required = true) String auctionGoodsCode){
		
		 AuctionGoodsVo auctionGoods = auctionGoodsService.getAuctionGoods(auctionGoodsCode);
		 log.info(auctionGoods.getAuctionGoodsBidHits()+"<---  입찰수");
		 BidVo nowPriceBid = bidService.getBidHighBidPrice(auctionGoodsCode);
		 if(nowPriceBid == null){
			 model.addAttribute("nowPrice", auctionGoods.getAuctionGoodsStartPrice());
		 }else{
			 model.addAttribute("nowPrice", nowPriceBid.getBidPrice());
		 }
		 
		 model.addAttribute("auctionGoods", auctionGoods);
		 
		 bidVo.setAuctionGoodsCode(auctionGoodsCode);
		 List<BidVo> goodsbidlist = bidService.getGoodsBidList(bidVo);
		 model.addAttribute("goodsbidlist", goodsbidlist);
		 
		  List<AuctionGoodsImageVo> auctionGoodsImages= auctionGoodsService.getAllAuctionGoodsImages(auctionGoodsCode); 
		  model.addAttribute("auctionGoodsImages",auctionGoodsImages);
		 System.out.println("이미지 투스트링"+auctionGoodsImages);
		return "auctiongoods/auctiongoods_detail";
		
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
		
		model.addAttribute("largeCategoryCode", largeCategoryCode);
		model.addAttribute("largeCategory", largeCategory);
		model.addAttribute("middleCategoryList", middleCategoryList);

		return "/auctiongoods/auctiongoods_list";
	}

	// auctiongoods_list.jsp에서 대,중분류카테고리코드의 값을 받았을 때 소분류를 뿌려주기 위한 처리
	@RequestMapping(value = "/auctiongoods/auctiongoodslist_small", method = RequestMethod.GET)
	public String auctionGoodsListSmall(Model model,
			@RequestParam(value = "largeCategoryCode", required = true) String largeCategoryCode,
			@RequestParam(value = "middleCategoryCode", required = true) String middleCategoryCode,
			@RequestParam(value = "smallCategoryCode", required = false) String smallCategoryCode) {

		List<LargeCategoryVo> largeCategory = goodsCategoryService.getAllLargeCategory();
		List<MiddleCategoryVo> middleCategoryList = goodsCategoryService.getMiddleCategoryList(largeCategoryCode);
		List<SmallCategoryVo> smallCategoryList = goodsCategoryService.getSmallCategoryList(largeCategoryCode,
				middleCategoryCode);
		if(smallCategoryCode!=null){
			System.out.println("스몰카테고리가 널이 아니면" + smallCategoryCode);
			model.addAttribute("smallCategoryCode",smallCategoryCode);
		}else{
			System.out.println("스몰카테고리가 널이다");
		}
		
		model.addAttribute("largeCategoryCode", largeCategoryCode);
		model.addAttribute("middleCategoryCode", middleCategoryCode);
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
	public String auctionGoodsInsert_Post(AuctionGoodsVo auctionGoodsVo, Model model,
			@RequestParam(value = "userTotalCash", required = true) int userTotalCash) {
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
        auctionGoodsService.addAuctionGoods(auctionGoodsVo, imgList, userTotalCash);

		
        return "main";
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
	
	@RequestMapping(value = "/sellInfo", method = RequestMethod.GET)
	public String sellInfo(Model model){
		return "/mypage/mypage_sell_info";
	}
	
	
}
