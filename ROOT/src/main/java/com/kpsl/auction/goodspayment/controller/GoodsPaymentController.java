package com.kpsl.auction.goodspayment.controller;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kpsl.auction.goodspayment.service.GoodsPaymentService;
import com.kpsl.auction.goodspayment.vo.GoodsPaymentVo;
import com.kpsl.auction.successfullBid.vo.SuccessBidVo;

@Controller
public class GoodsPaymentController {
	Logger log = Logger.getLogger(this.getClass());
	@Autowired GoodsPaymentService goodsPaymentService;
	
	@RequestMapping(value = "/goodsPaymentInsert", method = RequestMethod.POST)
	public String goodsPaymentInsert(Model model, HttpSession session, GoodsPaymentVo goodsPaymentVo, SuccessBidVo successBidVo) {
		
		log.info("goodsPaymentInsert 요청 확인");
		String userId = (String)session.getAttribute("userId");
		goodsPaymentVo.setUserId(userId);
		successBidVo.setUserBuyerId(userId);
		goodsPaymentService.addGoodsPayment(goodsPaymentVo, successBidVo);
		
		return "redirect:/bid/bidsuccessfull";
	}
}
