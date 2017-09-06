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


import com.kpsl.auction.auctiongoods.service.AuctionGoodsService;
import com.kpsl.auction.auctiongoods.vo.AuctionGoodsVo;
import com.kpsl.auction.bid.service.BidService;
import com.kpsl.auction.bid.vo.BidVo;

@Controller
public class BidController {
	@Autowired BidService bidService;
	@Autowired AuctionGoodsService auctiongoodsservice;
	
	Logger log = Logger.getLogger(this.getClass());

	
	
	//입찰자 리스트(각각의 물품마다의 입찰자 리스트, 전체리스트)
	@RequestMapping(value = "/bid/bidform", method =  {RequestMethod.GET, RequestMethod.POST})
  	public String bidList(Model model, AuctionGoodsVo AuctionGoodsVo, BidVo bidvo){
		//물품코드
		String auctionGoodsCode = AuctionGoodsVo.getAuctionGoodsCode();
  		model.addAttribute("auctionGoodsCode",auctionGoodsCode);
  		//물품명
  		String auctionGoodsName = AuctionGoodsVo.getAuctionGoodsName();
  		model.addAttribute("auctionGoodsName",auctionGoodsName);
 		//시작가
 		int auctionGoodsStartPrice =  AuctionGoodsVo.getAuctionGoodsStartPrice();
 		model.addAttribute("auctionGoodsStartPrice", auctionGoodsStartPrice);
 		//입찰단위
 		int auctionGoodsBidUnit = AuctionGoodsVo.getAuctionGoodsBidUnit();
 		model.addAttribute("auctionGoodsBidUnit",auctionGoodsBidUnit);
 		//물품 등록자
 		String userId = AuctionGoodsVo.getUserId();
 		model.addAttribute("userId",userId);
 		//품목별 입찰자 리스트(물품코드를 통한 쿼리실행)
 		List<BidVo> goodsbidlist = bidService.goodsSelectBidList(bidvo);
 		model.addAttribute("goodsbidlist", goodsbidlist);
 		
 		//전체입찰자 리스트
 		List<BidVo> list = bidService.getBidList();
 		model.addAttribute("list",list);
 		//=====================
 		
 		log.info(auctionGoodsStartPrice+"시작가");
 		log.info(auctionGoodsName+"품목명");
 		log.info(auctionGoodsBidUnit+"입찰단위");
 		log.info(list + "배열에 들어간 list 값");
 		log.info(model+"model addAttribute 메서드 호출");
 		log.info("입찰자 리스트 ");
 		return "/bid/bid_form";
 	}
 	//입찰자 입찰버튼 클릭시 
 		@RequestMapping(value = "/bid/price", method = RequestMethod.GET)
 		public String bidPrice(BidVo bidvo, HttpSession session, AuctionGoodsVo AuctionGoodsVo){
 			String buyerId = (String)session.getAttribute("userId");
 			String auctionGoodsCode = AuctionGoodsVo.getAuctionGoodsCode();
 			String userSellerID  = AuctionGoodsVo.getUserId();
 			
 			log.info(auctionGoodsCode + "<== form 에서 code 값이 들어왔어여?");
 			log.info(userSellerID+"<-- form 에서 userId 값이 들어왔나여?");
 			
 			
			bidvo.setUserSellerID(userSellerID);
 			bidvo.setAuctionGoodsCode(auctionGoodsCode);
 			log.info(bidvo);
 			log.info(bidvo.getBidPrice()+"<--bidPrice form 에서 오는 값");
 			bidvo.setUserBuyerId(buyerId);				//입찰자 아이디
 			bidService.setBidPrice(bidvo);				//입찰가격을 bidprice 에 set
 		
 			log.info("입찰자 입찰하기");
 			return "redirect:/bid/bidform";
 					 	}
 		//본인이 입찰한 물품 리스트 보여주는 controller
 		@RequestMapping(value = "/bid/bidusergoodsbidlist", method = RequestMethod.GET)
 		public String user(HttpSession session,  BidVo bidvo,Model model){
 			
 			//개인 입찰품목 리스트(session을 통해 가져온 아이디로 쿼리실행)
 			String buyerId = (String)session.getAttribute("userId");	
 			bidvo.setUserBuyerId(buyerId);
 			log.info(buyerId+"세션을 통해 들어온 아이디");
 			List<BidVo> usergoodsbidlist = bidService.userSelectGoodsBidsList(bidvo);
 			model.addAttribute("usergoodsbidlist",usergoodsbidlist);
 			
 			return "/bid/bid_usergoodsbidlist";	 
 	}
 }