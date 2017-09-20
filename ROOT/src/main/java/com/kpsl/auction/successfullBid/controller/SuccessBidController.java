package com.kpsl.auction.successfullBid.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kpsl.auction.successfullBid.service.SuccessfullBidService;
import com.kpsl.auction.successfullBid.vo.SuccessfullBidVoANDauctionGoodsVo;

@Controller
public class SuccessBidController {
	Logger log = Logger.getLogger(this.getClass());
	@Autowired SuccessfullBidService successfullBidService;
	
	//
	// 본인 낙찰 물품 리스트
	@RequestMapping(value = "/bid/bidsuccessfull", method = RequestMethod.GET)
	public String successbid(HttpSession session,SuccessfullBidVoANDauctionGoodsVo successfullbidVoANDauctiongoodsvo, Model model) {

		/** 개인 입찰품목 리스트(session을 통해 가져온 아이디로 쿼리실행) **/
		String buyerId = (String) session.getAttribute("userId");
		successfullbidVoANDauctiongoodsvo.setUserBuyerId(buyerId);
		log.info(buyerId + "세션을 통해 들어온 아이디");
		List<SuccessfullBidVoANDauctionGoodsVo> usersuccessbidlist = successfullBidService.getSuccessBidList(successfullbidVoANDauctiongoodsvo);
		model.addAttribute("usersuccessbidlist", usersuccessbidlist);

		return "/bid/bid_successfullist";
	}
	@RequestMapping(value = "/mypage/purchasePaymentInserForm", method = RequestMethod.GET)
	public String purchasePayment(Model model) {

		/** 개인 입찰품목 리스트(session을 통해 가져온 아이디로 쿼리실행) **/
		log.info("purchasePayment 요청");

		return "/mypage/mypage_purchase_payment_insertForm";
	}
	
}
