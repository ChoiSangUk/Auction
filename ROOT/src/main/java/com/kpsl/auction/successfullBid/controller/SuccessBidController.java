package com.kpsl.auction.successfullBid.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kpsl.auction.successfullBid.service.SuccessfullBidService;
import com.kpsl.auction.successfullBid.vo.SuccessBidAndBidAndAuctionGoodsVo;

@Controller
public class SuccessBidController {
	Logger log = Logger.getLogger(this.getClass());
	@Autowired SuccessfullBidService successfullBidService;
	
	@RequestMapping(value = "/mypage/purchaseSuccessfulBidList", method = RequestMethod.GET)
	public String myAdApplyModify(Model model) {
		
		List<SuccessBidAndBidAndAuctionGoodsVo> list = successfullBidService.getMaxBid();
		for(int i=0; i<list.size(); i++){
			log.info(list.get(i).getAuctionGoodsVo().getAuctionGoodsCode());
			log.info(list.get(i).getBidVo().getBidPrice());
		}
		return "/mypage/mypage_purchaseSuccessfulBid_list";
	}
}
