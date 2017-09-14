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

import com.kpsl.auction.ad.service.AdRefundApplyService;
import com.kpsl.auction.ad.vo.AdApplyAndAdImageAndAdUnitPriceAndAuctionGoodsVo;
import com.kpsl.auction.ad.vo.AdRefundApplyVo;
import com.kpsl.auction.saleslog.vo.SalesLogVo;

@Controller
public class AdRefndApplyController {

	Logger log = Logger.getLogger(this.getClass());
	
	@Autowired AdRefundApplyService adRefundApplyService;
	
	// 관리자 광고신청환불상세(액션) 페이지 요청
	@RequestMapping(value = "/ad/adminAdRefundApplyDetail", method = RequestMethod.POST)
	public String adRefundApplyDetail(Model model, AdRefundApplyVo adRefundApplyVo, SalesLogVo salesLogVo) {
		
		log.info("adRefundApplyDetail 요청 확인");
		log.info(adRefundApplyVo.getAdRefundApplyCode());
		int result = adRefundApplyService.adRefundApplyAndUserTotalCashAndSalesLogTransaction(adRefundApplyVo, salesLogVo);
		if(result == 0){
			log.info("트랜잭션처리 완료");
		}
		
		return "redirect:/ad/adminAdRefundApplySearch";
	}
		
	// 관리자 광고신청환불상세 페이지 요청
	@RequestMapping(value = "/ad/adminAdRefundApplyDetail", method = RequestMethod.GET)
	public String adRefundApplyDetail(Model model, AdApplyAndAdImageAndAdUnitPriceAndAuctionGoodsVo adVo
										,@RequestParam(value="adRefundApplyCode", required=true) String adRefundApplyCode) {
		
		log.info("adRefundApplyDetail 요청 확인");
		
		adVo.setAdRefundApplyCode(adRefundApplyCode);
		AdApplyAndAdImageAndAdUnitPriceAndAuctionGoodsVo adRefundDetailList = 
				adRefundApplyService.getAdRefundDetailList(adVo);
		model.addAttribute("adRefundDetailList", adRefundDetailList);
		
		return "/admin/ad/admin_adRefundApply_detail";
	}
		
	// 관리자 광고신청환불리스트 페이지 요청
	@RequestMapping(value = "/ad/adminAdRefundApplySearch", method = RequestMethod.GET)
	public String adRefundApplySearch(Model model) {
		
		log.info("adRefundApplySearch 요청 확인");
		List<AdApplyAndAdImageAndAdUnitPriceAndAuctionGoodsVo> adRefundApplyList = 
				adRefundApplyService.getAdRefundList();
		model.addAttribute("adRefundApplyList", adRefundApplyList);
		
		return "/admin/ad/admin_adRefundApply_search";
	}
	
	// 광고환불신청 페이지 요청
	@RequestMapping(value = "/mypage/adRefundApplyInsertForm", method = RequestMethod.GET)
	public String adRefundApplyAdd(Model model
									,@RequestParam (value="adPaymentCode", required=true) String adPaymentCode) {
			
		log.info("adRefundApplyAdd");
		log.info(adPaymentCode+"<--- 결제코드 확인");
		AdApplyAndAdImageAndAdUnitPriceAndAuctionGoodsVo adRefundDetailList = adRefundApplyService.getAdRefundList(adPaymentCode);
		double adRefundPercent = 0.9;
		int adPaymentPrice = adRefundDetailList.getAdPaymentVo().getAdPaymentPrice();
		int adRefundPrice = (int) (adPaymentPrice*adRefundPercent);
		log.info(adRefundPrice+"<-- 환불 금액");
		adRefundDetailList.getAdPaymentVo().setAdPaymentPrice(adRefundPrice);
		
		model.addAttribute("adRefundDetailList", adRefundDetailList);		
		
		return "/mypage/mypage_adRefundApply_insertForm";
	}
	
	// 광고환불신청 페이지(액션) 요청
	@RequestMapping(value = "/mypage/adRefundApplyInsertForm", method = RequestMethod.POST)
	public String adRefundApplyAdd(HttpSession session, AdRefundApplyVo adRefundApplyVo) {
			
		log.info("adRefundApplyAdd");
		String userId = (String) session.getAttribute("userId");
		adRefundApplyVo.setUserId(userId);
		adRefundApplyService.addAdRefundApply(adRefundApplyVo);
		
		return "redirect:/mypage/adApplyList";
	}
	
}
