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
	
	@RequestMapping(value = "/bid/bidform", method = RequestMethod.GET)
	public String bidList(Model model){

		List<BidVo> list = bidService.getBidList();
		return "/bid/bid_form";
	
	}
}
	


