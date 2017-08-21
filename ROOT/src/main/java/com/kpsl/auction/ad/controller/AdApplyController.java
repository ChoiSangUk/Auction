package com.kpsl.auction.ad.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kpsl.auction.ad.service.AdApplyService;
import com.kpsl.auction.ad.service.AdUnitPriceService;
import com.kpsl.auction.ad.vo.AdApplyAndAdImageVo;
import com.kpsl.auction.ad.vo.AdApplyVo;
import com.kpsl.auction.ad.vo.AdImageVo;
import com.kpsl.auction.ad.vo.AdUnitPriceVo;
import com.kpsl.auction.auctiongoods.vo.AuctionGoodsVo;

@Controller
public class AdApplyController {
	//@Autowired AdApplyService adApplyService;
	@Autowired AdUnitPriceService adUnitPriceService;
	@Autowired AdApplyService adApplyService;
	
	Logger log = Logger.getLogger(this.getClass());
	
	// 광고상세정보 페이지 요청
	@RequestMapping(value = "/ad/adminAdApplyDetail", method = RequestMethod.GET)
	public String adApplyDetail(Model model,
								@RequestParam(value="adApplyCode", required=true) String adApplyCode) {
		log.info(adApplyCode+"<--- adApplyCode 확인");
		List<AdApplyVo> AdApplylist =adApplyService.getAdApplyAndAdImageByAdApplyCode(adApplyCode);
		
		model.addAttribute("AdApplylist",AdApplylist);
		log.info("adApplyDetail 확인");
		return "/admin/ad/admin_adApply_detail";
	}
	
	// 광고신청 리스트 페이지 요청
	@RequestMapping(value = "/ad/adminAdApplySearch", method = RequestMethod.GET)
	public String adApplyList(Model model) {
		log.info("adApplyList 확인");
		List<AdApplyVo> adApplyList = adApplyService.getAdApplyList();
		model.addAttribute("adApplyList",adApplyList);
		
		return "/admin/ad/admin_adApply_search";
	}
	
	// 광고정보 및 정책 페이지 요청
	@RequestMapping(value = "/mypage/mypageAdInfo", method = RequestMethod.GET)
	public String adApplyInfo(Model model) {
		
		log.info("adApplyInfo 확인");
		return "/mypage/mypage_ad_info";
	}
	// 광고 신청 폼 요청
	@RequestMapping(value = "/mypage/adApplyInsertForm", method = RequestMethod.GET)
	public String adApplyAdd(Model model, String userId, HttpSession session) {
		//session.getAttribute(userId);
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
	public String adApplyAdd(AdApplyVo adApplyVo ,AdImageVo adImageVo) {
		log.info(adApplyVo+"<---adApplyVo확인");
		log.info(adImageVo+"<----adImageVo 확인");
		//adApplyService.addAdApply(adApplyVo);
		//adApplyService.addAdImage(adImageVo);
		adApplyService.adApplyTransaction(adApplyVo, adImageVo);
		log.info("adApplyAdd 확인");
		return "redirect:/mypage/mypageMain";
	}
}
