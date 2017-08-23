package com.kpsl.auction.bid.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kpsl.auction.bid.service.BidService;
import com.kpsl.auction.bid.vo.BidVo;

@Controller
public class BidController {
	@Autowired BidService bidService;

	Logger log = Logger.getLogger(this.getClass());
	
	//입찰자 리스트
	@RequestMapping(value = "/bid/bidform", method = RequestMethod.GET)
	public String bidList(Model model){

		List<BidVo> list = bidService.getBidList();
		model.addAttribute("list",list);
		log.info(model);
		log.info(list);
		log.info("입찰자 리스트 ");
		return "/bid/bid_form";
	}
	//입찰자 입찰버튼 클릭시 
		@RequestMapping(value = "/bid/price", method =RequestMethod.POST)
		public String bidPrice(BidVo bidvo){
			log.info(bidvo);
			log.info(bidvo.getBidPrice()+"<--bidPrice");
			bidService.setBidPrice(bidvo);
			log.info("입찰자 입찰하기");
			return "redirect:/bid/bidform";	 
	}
}
	