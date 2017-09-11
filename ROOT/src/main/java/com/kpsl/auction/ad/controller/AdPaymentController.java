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
import com.kpsl.auction.ad.service.AdPaymentService;
import com.kpsl.auction.ad.vo.AdApplyAndAdImageAndAdPaymentVo;
import com.kpsl.auction.ad.vo.AdApplyAndAdImageAndAdUnitPriceAndAuctionGoodsVo;
import com.kpsl.auction.ad.vo.AdPaymentVo;
import com.kpsl.auction.saleslog.vo.SalesLogVo;
import com.kpsl.auction.user.service.UserService;
import com.kpsl.auction.user.vo.UserDetailVo;

@Controller
public class AdPaymentController {
	@Autowired AdPaymentService adPaymentService;
	@Autowired UserService userService;
	@Autowired AdApplyService adApplyService;
	
	Logger log = Logger.getLogger(this.getClass());	
	
	// 관리자 광고결제리스트 요청(POST)
	@RequestMapping(value = "/ad/adminAdPaymentSearch", method = RequestMethod.POST)
	public String adPaymentSearch(Model model, AdPaymentVo adPaymentVo
								, @RequestParam(value="sk", required=true) String sk
								, @RequestParam(value="sv", required=true) String sv
								, @RequestParam(value="sDate", required=true) String sDate
								, @RequestParam(value="eDate", required=true) String eDate
								, @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage) {
		
		log.info("adPaymentList 요청 확인");
		int adPaymentCount = adPaymentService.getAdPaymentCount(adPaymentVo, sk, sv, sDate, eDate);
		log.info(adPaymentCount+"<--adApplyCount");
		int pagePerRow = 5;
		// count/pagePerRow시 결과값이 소수점이하는 버리기 때문에 pagePerRow를 double형으로 형변환시킴
		int lastPage = (int) (Math.ceil(adPaymentCount / (double)pagePerRow));
		log.info(lastPage+"<-- lastPage");
		log.info(adPaymentVo.getAdPaymentCode()+"<---");
		List<AdApplyAndAdImageAndAdPaymentVo> adPaymentList = 
				adPaymentService.getPaymentSearchList(adPaymentVo, sk, sv, sDate, eDate, currentPage, pagePerRow);
		model.addAttribute("sk",sk);
		model.addAttribute("sv",sv);
		model.addAttribute("sDate",sDate);
		model.addAttribute("eDate",eDate);
		model.addAttribute("adPaymentCount",adPaymentCount);
		model.addAttribute("lastPage",lastPage);
		model.addAttribute("adPaymentList", adPaymentList);
		
		return "/admin/ad/admin_adPayment_search";
	}
	
	// 관리자 광고결제리스트 요청(GET)
	@RequestMapping(value = "/ad/adminAdPaymentSearch", method = RequestMethod.GET)
	public String adPaymentSearchGet(Model model, AdPaymentVo adPaymentVo
								, @RequestParam(value="sk", required=false, defaultValue="") String sk
								, @RequestParam(value="sv", required=false, defaultValue="") String sv
								, @RequestParam(value="sDate", required=false, defaultValue="") String sDate
								, @RequestParam(value="eDate", required=false, defaultValue="") String eDate
								, @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage) {
		
		log.info("adPaymentList 요청 확인");
		int adPaymentCount = adPaymentService.getAdPaymentCount(adPaymentVo, sk, sv, sDate, eDate);
		log.info(adPaymentCount+"<--adApplyCount");
		int pagePerRow = 5;
		// count/pagePerRow시 결과값이 소수점이하는 버리기 때문에 pagePerRow를 double형으로 형변환시킴
		int lastPage = (int) (Math.ceil(adPaymentCount / (double)pagePerRow));
		log.info(lastPage+"<-- lastPage");
		log.info(adPaymentVo.getAdPaymentCode()+"<---");
		List<AdApplyAndAdImageAndAdPaymentVo> adPaymentList = 
				adPaymentService.getPaymentSearchList(adPaymentVo, sk, sv, sDate, eDate, currentPage, pagePerRow);
		model.addAttribute("sk",sk);
		model.addAttribute("sv",sv);
		model.addAttribute("sDate",sDate);
		model.addAttribute("eDate",eDate);
		model.addAttribute("adPaymentCount",adPaymentCount);
		model.addAttribute("lastPage",lastPage);
		model.addAttribute("adPaymentList", adPaymentList);
		
		return "/admin/ad/admin_adPayment_search";
	}
	
	// 광고결제페이지 요청
	@RequestMapping(value = "/mypage/adPaymentInsertForm", method = RequestMethod.GET)
	public String adPaymentInsertForm(Model model, HttpSession session
									, @RequestParam(value="adApplyCode", required=true) String adApplyCode) {
		
		log.info("adPaymentInsertForm 요청 확인");
		String userId = (String) session.getAttribute("userId");
		AdApplyAndAdImageAndAdUnitPriceAndAuctionGoodsVo adPaymentList
			= adApplyService.getAdApplyDetail(adApplyCode);
		UserDetailVo userDetailList = userService.getUser(userId);		
		model.addAttribute("adPaymentList",adPaymentList);
		model.addAttribute("userDetailList",userDetailList);
		
		return "/mypage/mypage_adPayment_insertForm";
	}
	
	// 광고결제페이지(액션) 요청, 광고결제와 회원캐쉬출금 트랜잭션 처리
	@RequestMapping(value = "/mypage/adPaymentInsertForm", method = RequestMethod.POST)
	public String adPaymentInsertForm(HttpSession session, AdPaymentVo adPaymentVo, SalesLogVo salesLogVo) {
		
		log.info("adPaymentInsertForm 요청 확인");
		String userId = (String) session.getAttribute("userId");
		adPaymentVo.setUserId(userId);
		salesLogVo.setSalesLogUserId(userId);
		adPaymentService.adPaymentAndSalesLogTransaction(adPaymentVo, salesLogVo);
		return "redirect:/main";
	}
}
