package com.kpsl.auction.bid.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kpsl.auction.auctiongoods.vo.AuctionGoodsVo;
import com.kpsl.auction.bid.service.BidService;
import com.kpsl.auction.bid.vo.BidVo;

@Controller
public class BidController {
	@Autowired BidService bidService;
	
	Logger log = Logger.getLogger(this.getClass());

	//모든 물품의 입찰자 리스트
	/*@RequestMapping(value = "/bid/bidform", method = RequestMethod.GET)
	public String allbidList(Model model){
		List<BidVo> list = bidService.getBidList();
		model.addAttribute("list",list);
		return "/bid/bid_form";
		
	}*/
	
	//입찰자 리스트(각각의 물품마다의 입찰자 리스트)
	@RequestMapping(value = "/bid/bidform", method = RequestMethod.GET)
	public String bidList(Model model, AuctionGoodsVo AuctionGoodsVo, BidVo bidvo){
	
		//물품명
		String auctionGoodsName = AuctionGoodsVo.getAuctionGoodsName();
		model.addAttribute("auctionGoodsName",auctionGoodsName);
		//시작가
		int auctionGoodsStartPrice =  AuctionGoodsVo.getAuctionGoodsStartPrice();
		model.addAttribute("auctionGoodsStartPrice", auctionGoodsStartPrice);
		//입찰단위
		int auctionGoodsBidUnit = AuctionGoodsVo.getAuctionGoodsBidUnit();
		model.addAttribute("auctionGoodsBidUnit",auctionGoodsBidUnit);
		
		String auctionGoodsCode = AuctionGoodsVo.getAuctionGoodsCode();
		bidvo.setAuctionGoodsCode(auctionGoodsCode);
		
		log.info(auctionGoodsCode + "물품코드");
		List<BidVo> list = bidService.getBidList();
		model.addAttribute("list",list);
		log.info(auctionGoodsStartPrice+"시작가");
		log.info(auctionGoodsName+"품목명");
		log.info(auctionGoodsBidUnit+"입찰단위");
		log.info(list + "배열에 들어간 list 값");
		log.info(model+"model addAttribute 메서드 호출");
		log.info("입찰자 리스트 ");
		return "/bid/bid_form";
	}
	//입찰자 입찰버튼 클릭시 
		@RequestMapping(value = "/bid/price", method =RequestMethod.POST)
		public String bidPrice(BidVo bidvo, HttpSession session, AuctionGoodsVo AuctionGoodsVo){
			String buyerId = (String)session.getAttribute("userId");
				
			log.info(bidvo);
			log.info(bidvo.getBidPrice()+"<--bidPrice form 에서 오는 값");
			bidvo.setUserBuyerId(buyerId);				//입찰자 아이디
			bidService.setBidPrice(bidvo);				//입찰가격을 bidprice 에 set
			log.info("입찰자 입찰하기");
			return "redirect:/bid/bidform";	 
	}
}
	