package com.kpsl.auction.ad.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kpsl.auction.ad.service.AdApplyService;
import com.kpsl.auction.ad.service.AdUnitPriceService;
import com.kpsl.auction.ad.vo.AdApplyVo;
import com.kpsl.auction.ad.vo.AdUnitPriceVo;
import com.kpsl.auction.auctiongoods.vo.AuctionGoodsVo;

@Controller
public class AdApplyController {
	//@Autowired AdApplyService adApplyService;
	@Autowired AdUnitPriceService adUnitPriceService;
	@Autowired AdApplyService adApplyService;
	
	Logger log = Logger.getLogger(this.getClass());
	
	// 광고 신청 폼 요청
	@RequestMapping(value = "/mypage/adApplyInsertForm", method = RequestMethod.GET)
	public String adApplyAdd(Model model, String userId) {
		
		// 로그인 세션이 연결 안되있어서 임시로 값을 넣어둠
		userId = "id002";
		List<AdUnitPriceVo> adUnitPriceList = adUnitPriceService.getAdUnitPirceList(); 
		List<AuctionGoodsVo> auctionGoodsList = adApplyService.getAuctionGoodsListByUserId(userId);
		model.addAttribute("adUnitPriceList",adUnitPriceList);
		model.addAttribute("auctionGoodsList",auctionGoodsList);
		
		log.info("adApplyAdd 확인");
		return "/mypage/mypage_adApply_insertForm";
	}
	// 광고 (액션) 요청
	@RequestMapping(value = "/mypage/adApplyInsertForm", method = RequestMethod.POST)
	public String adApplyAdd(AdApplyVo adApplyVo
							, @RequestParam(value="adImageName", required=false) String adImageName) {
		log.info(adApplyVo+"<---adApplyVo확인");
		adApplyService.addAdApply(adApplyVo);
		/*log.debug(adImageName+"<--- 광고이미지");
		log.debug(adUnitPriceCode+"<-- 광고단가 코드 확인");
		log.debug(auctionGoodsCode+"<-- 물품명코드 확인");*/
		log.info("adApplyAdd 확인");
		return "redirect:/mypage/mypageMain";
	}
}
