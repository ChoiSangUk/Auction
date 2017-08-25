package com.kpsl.auction.ad.controller;

import static org.hamcrest.CoreMatchers.instanceOf;

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
import com.kpsl.auction.ad.vo.AdApplyAndAdImageAndAdUnitPriceAndAuctionGoodsVo;
import com.kpsl.auction.user.service.UserService;
import com.kpsl.auction.user.vo.UserDetailVo;

@Controller
public class AdPaymentController {
	@Autowired AdPaymentService adPaymentService;
	@Autowired UserService userService;
	@Autowired AdApplyService adApplyService;
	
	Logger log = Logger.getLogger(this.getClass());
	
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
	
	@RequestMapping(value = "/mypage/adPaymentInsertForm", method = RequestMethod.POST)
	public String adPaymentInsertForm(HttpSession session
									, @RequestParam(value="adApplyCode", required=true) String adApplyCode) {
		
		log.info("adPaymentInsertForm 요청 확인");
		log.info(adApplyCode+"<--- adApplyCode 확인");
		
		return "redirect:/main";
	}
}
