package com.kpsl.auction.bid.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kpsl.auction.auctiongoods.service.AuctionGoodsService;
import com.kpsl.auction.auctiongoods.vo.AuctionGoodsVo;
import com.kpsl.auction.bid.service.BidService;
import com.kpsl.auction.bid.vo.BidDepositVo;
import com.kpsl.auction.bid.vo.BidVo;
import com.kpsl.auction.cash.service.CashService;
import com.kpsl.auction.user.vo.UserDetailVo;
import com.kpsl.auction.bid.service.BidDepositService;

@Controller
public class BidController {
	@Autowired
	AuctionGoodsService auctiongoodsservice;
	@Autowired
	BidService bidService;
	@Autowired
	BidDepositService biddepositservice;
	@Autowired
	CashService cashservice;

	Logger log = Logger.getLogger(this.getClass());

	// 입찰자 리스트(각각의 물품마다의 입찰자 리스트, 전체리스트)
	@RequestMapping(value = "/bid/bidform", method = { RequestMethod.GET, RequestMethod.POST })
	public String bidList(Model model, AuctionGoodsVo auctiongoodsvo, BidVo bidvo, BidDepositVo biddepositvo,
			HttpSession session, UserDetailVo userdetailvo) {
		/** 물품코드 **/
		String auctionGoodsCode = auctiongoodsvo.getAuctionGoodsCode();
		model.addAttribute("auctionGoodsCode", auctionGoodsCode);
		/** 물품명 **/
		String auctionGoodsName = auctiongoodsvo.getAuctionGoodsName();
		model.addAttribute("auctionGoodsName", auctionGoodsName);
		/** 시작가 **/
		int auctionGoodsStartPrice = auctiongoodsvo.getAuctionGoodsStartPrice();
		model.addAttribute("auctionGoodsStartPrice", auctionGoodsStartPrice);
		/** 입찰단위 **/
		int auctionGoodsBidUnit = auctiongoodsvo.getAuctionGoodsBidUnit();
		model.addAttribute("auctionGoodsBidUnit", auctionGoodsBidUnit);
		/** 물품 등록자 **/
		String userId = auctiongoodsvo.getUserId();
		model.addAttribute("userId", userId);
		/** 최고 입찰금액 **/
		BidVo highPrice = bidService.getBidHighBidPrice(auctionGoodsCode);
		if (highPrice != null) {
			/** 입찰시 최고입찰 금액 **/
			int highBidPrice = highPrice.getBidPrice();
			model.addAttribute("highBidPrice", highBidPrice);
			log.info(highPrice.getBidPrice() + "최고입찰금액");
			/** 품목별 입찰자 리스트(물품코드를 통한 쿼리실행) **/
			List<BidVo> goodsbidlist = bidService.getGoodsBidList(bidvo);
			model.addAttribute("goodsbidlist", goodsbidlist);
			log.info(goodsbidlist + "물품리스트");
		}
		/** 보증금 을 위한 캐쉬 조회 **/
		String buyerId = (String) session.getAttribute("userId");
		UserDetailVo totalcash = biddepositservice.getTotalCash(buyerId);
		model.addAttribute("totalcash", totalcash.getUserTotalcash());

		/** 전체입찰자 리스트 **/
		List<BidVo> list = bidService.getBidList();
		model.addAttribute("list", list);
		// =====================

		log.info(auctionGoodsStartPrice + "시작가");
		log.info(auctionGoodsName + "품목명");
		log.info(auctionGoodsBidUnit + "입찰단위");
		log.info(list + "배열에 들어간 list 값");
		log.info(model + "model addAttribute 메서드 호출");
		log.info("입찰자 리스트 ");
		return "/bid/bid_form";
	}

	// 입찰자 입찰버튼 클릭시
	@RequestMapping(value = "/bid/price", method = RequestMethod.POST)
	public String bidPrice(Model model, BidVo bidvo, HttpSession session, AuctionGoodsVo auctiongoodsvo,
			UserDetailVo userdetailvo, BidDepositVo biddepositvo) throws UnsupportedEncodingException {

		/** 각 각 가져오는 값들= 구매자, 물품코드, 판매자, 입찰단위, 시작가 **/
		String userbuyerId = (String) session.getAttribute("userId");
		String auctionGoodsCode = auctiongoodsvo.getAuctionGoodsCode();
		String userSellerID = auctiongoodsvo.getUserId();
		int auctionGoodsBidUnit = auctiongoodsvo.getAuctionGoodsBidUnit();
		int auctionGoodsStartPrice = auctiongoodsvo.getAuctionGoodsStartPrice();
		String aucitonGoodsName1 = auctiongoodsvo.getAuctionGoodsName();
		String auctionGoodsName = URLEncoder.encode(aucitonGoodsName1, "UTF-8");

		/** bid mapper 에 set 되는 값들 **/
		bidvo.setUserSellerID(userSellerID);
		bidvo.setAuctionGoodsCode(auctionGoodsCode);
		bidvo.setUserBuyerId(userbuyerId);
		/** biddeposti mapper 에 set 되는 값들 **/
		biddepositvo.setAuctionGoodsCode(auctionGoodsCode);
		biddepositvo.setUserBuyerId(userbuyerId);
		biddepositvo.setUserSellerId(userSellerID);

		log.info(auctionGoodsStartPrice + "<<==auctionGoodsStartPrice 시작가 들어왔나여? ");
		log.info(auctionGoodsCode + "<== form 에서 code 값이 들어왔어여?");
		log.info(userSellerID + "<-- form 에서 userId 값이 들어왔나여?");
		log.info(auctionGoodsBidUnit + "<<==입찰 단위값 왔는가?");
		log.info(bidvo.getBidPrice() + "<--bidPrice form 에서 오는 값");
		
		/*BidDepositVo overlapuserid = biddepositservice.setoverlapuserid(auctionGoodsCode);
		log.info(overlapuserid.getUserBuyerId()+"overlapuserid");*/
 		/**입찰 중복 아이디 계수**/
		BidVo getOverlapbidUsercount = bidService.getOverlapUser(bidvo);
		log.info(getOverlapbidUsercount.getUserBuyerId()+ "중복아이디 계수");
		int i = Integer.parseInt(getOverlapbidUsercount.getUserBuyerId());
		if(i == 0 ){
		
			/** 입찰 서비스 **/
		bidService.setBidPrice(bidvo);

		/** 보증금 insert 하는 서비스(가격에 따라 보증금의 가격) **/
		int DepositPrice1 = 1000; // 5만원 미만
		int DepositPrice2 = 5000; // 5만원 이상 20만원 미만
		int DepositPrice3 = 10000; // 20만원 이상 50만원 미만
		int DepositPrice4 = 30000; // 50만원 이상 200만원 미만
		int DepositPrice5 = 100000;// 200만원 이상

		if (auctionGoodsStartPrice < 50001) {
			biddepositvo.setBidDepositPrice(DepositPrice1);
		} else if (auctionGoodsStartPrice >= 50000 && auctionGoodsStartPrice < 200001) {
			biddepositvo.setBidDepositPrice(DepositPrice2);
		} else if (auctionGoodsStartPrice >= 200000 && auctionGoodsStartPrice < 500001) {
			biddepositvo.setBidDepositPrice(DepositPrice3);
		} else if (auctionGoodsStartPrice >= 500000 && auctionGoodsStartPrice < 2000001) {
			biddepositvo.setBidDepositPrice(DepositPrice4);
		} else {
			biddepositvo.setBidDepositPrice(DepositPrice5);
		}
		String bidCode = bidvo.getBidCode();
		biddepositvo.setBidCode(bidCode);
		biddepositservice.setBidDeposit(biddepositvo);
		
		/** 보증금 차감 되는 서비스 **/
		userdetailvo.setUserId(userbuyerId);
		biddepositservice.modifyUserCashWithdraw(biddepositvo);
		}
		else{
			/**보증금 차감 안되고 본인 입찰금 수정**/
			bidService.modifyBidPrcie(bidvo);
		}
		log.info("입찰자 입찰하기");
		return "redirect:/bid/bidform?auctionGoodsName=" + auctionGoodsName + "&userId=" + userSellerID
				+ "&auctionGoodsBidUnit=" + auctionGoodsBidUnit + "&auctionGoodsStartPrice=" + auctionGoodsStartPrice
				+ "&auctionGoodsCode=" + auctionGoodsCode;
	}	
	// 본인이 입찰한 물품 리스트 보여주는 controller
	@RequestMapping(value = "/bid/bidusergoodsbidlist", method = RequestMethod.GET)
	public String user(HttpSession session, BidVo bidvo, Model model) {

		/** 개인 입찰품목 리스트(session을 통해 가져온 아이디로 쿼리실행) **/
		String buyerId = (String) session.getAttribute("userId");
		bidvo.setUserBuyerId(buyerId);
		log.info(buyerId + "세션을 통해 들어온 아이디");
		List<BidVo> usergoodsbidlist = bidService.getUserGoodsBidsList(bidvo);
		model.addAttribute("usergoodsbidlist", usergoodsbidlist);

		return "/bid/bid_usergoodsbidlist";
	}
}