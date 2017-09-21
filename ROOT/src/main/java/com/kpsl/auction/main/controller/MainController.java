package com.kpsl.auction.main.controller;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kpsl.auction.ad.service.AdPaymentService;
import com.kpsl.auction.ad.vo.AdApplyAndAdImageAndAdPaymentVo;
import com.kpsl.auction.auctiongoods.service.AuctionGoodsService;
import com.kpsl.auction.auctiongoods.vo.AuctionGoodsAndFirstImageVo;
import com.kpsl.auction.auctiongoods.vo.AuctionGoodsVo;

import com.kpsl.auction.saleslog.service.SalesLogService;
import com.kpsl.auction.saleslog.vo.SalesLogVo;
import com.kpsl.auction.user.service.UserDetailService;
import com.kpsl.auction.user.service.UserService;
import com.kpsl.auction.bid.service.BidService;
import com.kpsl.auction.bid.vo.BidVo;
import com.kpsl.auction.user.vo.GradeVo;
import com.kpsl.auction.user.vo.UserDetailVo;
import com.sun.org.apache.bcel.internal.classfile.DescendingVisitor;

@Controller
public class MainController {
	Logger log = Logger.getLogger(this.getClass());
	@Autowired private UserService userService;
	@Autowired private AdPaymentService adPaymentService;
	@Autowired private AuctionGoodsService auctionGoodsService;
	@Autowired private BidService bidService;
	// 프로젝트 소개페이지 요청
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index() {

		log.info("로그확인");
		return "index";
	}
	
	// 프로젝트 메인페이지 요청
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(Model model, AuctionGoodsVo auctionGoodsVo) {
		
		log.info("로그확인");
		List<AdApplyAndAdImageAndAdPaymentVo> adPaymentSuccessList = adPaymentService.getPaymentSuccessList();
		//List<AuctionGoodsAndFirstImageVo> auctionGoodsList = auctionGoodsService.getAllAuctionGoods();
		
		// 메인페이지 인기순위(조회수)
		String auctionGoodsHits = "auction_goods_hits";
		auctionGoodsVo.setSortSeperator(auctionGoodsHits);
		List<AuctionGoodsAndFirstImageVo> auctionGoodsListByHits = auctionGoodsService.getAllAuctionGoodsOrderBy(auctionGoodsVo);
		String auctionGoodsBidHits = "auction_goods_bid_hits";
		auctionGoodsVo.setSortSeperator(auctionGoodsBidHits);
		List<AuctionGoodsAndFirstImageVo> auctionGoodsListByBidHits = auctionGoodsService.getAllAuctionGoodsOrderBy(auctionGoodsVo);
		model.addAttribute("adPaymentSuccessList", adPaymentSuccessList);
		model.addAttribute("auctionGoodsListByHits", auctionGoodsListByHits);
		model.addAttribute("auctionGoodsListByBidHits", auctionGoodsListByBidHits);
		
		return "main";
	}
	
	@RequestMapping(value = "/main", method = RequestMethod.POST)
	public String main(Model model) {
		
		log.info("로그확인");
		
		return "redirect:/main";
	}
	
	// 관리자 로그인페이지 요청
	@RequestMapping(value = "/admin/adminLogin", method = RequestMethod.GET)
	public String adminLogin(Model model) {
		
		log.info("adminLogin 확인");
		
		return "/admin/admin_login";
	}
	
	// 관리자 메인페이지 요청
	@RequestMapping(value = "/admin/adminMain", method = RequestMethod.GET)
	public String adminMain(Model model) {
		
		log.info("adminMain 확인");
		
		return "/admin/admin_main";
	}

	// 관리자 로그인(액션) 요청
	@RequestMapping(value = "/admin/adminLogin", method = RequestMethod.POST)
	public String adminLogin(UserDetailVo userDetailVo, HttpSession session, Model model) {
		// UserDetailVo sessionUser = userService.getUserLogin(userDetailVo);
		UserDetailVo loginUser = userService.getUserLogin(userDetailVo.getUserId(), userDetailVo.getUserPassword());
		log.info(userDetailVo.getUserId());
		log.info(userDetailVo.getUserPassword());

		if (loginUser != null && loginUser.getUserLevel().equals("관리자")) {
			log.info("로그인성공");
			session.setAttribute("userLoginInfo", loginUser);
			return "redirect:/admin/adminMain";
		} else {
			log.info("로그인실패");
			return "/admin/admin_login";
		}

	}
	
	// 관리자 로그아웃
	@RequestMapping("**/admin/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/admin/adminLogin";
	}
	
	// 마이페이지 메인 요청
	@RequestMapping(value = "/mypage/mypageMain", method = RequestMethod.GET)
	public String mypage(Model model, HttpSession session, AuctionGoodsVo auctionGoodsVo
						,BidVo bidvo) {
		String userId = (String) session.getAttribute("userId");
		log.info(userId + "<----- page1 확인");
		session.getAttribute("userLoginInfo");
		UserDetailVo userDetailInfo = userService.getUser(userId);
		session.setAttribute("userDetailInfo", userDetailInfo);
		GradeVo gradeVo = userService.getUserGrade(userId);
		log.info(gradeVo.getGradeName() + "<---- 확인");
		auctionGoodsVo.setUserId(userId);
		auctionGoodsVo.setAuctionGoodsState("판매중");
		int salesIngCount = auctionGoodsService.getAllAuctionGoodsByUserIdAndAuctionGoodsState(auctionGoodsVo).size();
		auctionGoodsVo.setAuctionGoodsState("판매종료");
		int salesStopCount = auctionGoodsService.getAllAuctionGoodsByUserIdAndAuctionGoodsState(auctionGoodsVo).size();
		auctionGoodsVo.setAuctionGoodsState("낙찰");
		int salesSuccessCount = auctionGoodsService.getAllAuctionGoodsByUserIdAndAuctionGoodsState(auctionGoodsVo).size();
		session.setAttribute("grade", gradeVo);
		model.addAttribute("ingCount", salesIngCount);
		model.addAttribute("stopCount", salesStopCount);
		model.addAttribute("successCount", salesSuccessCount);
		bidvo.setUserBuyerId(userId);
		//입찰 갯수
		BidVo  bidingcount= bidService.getBidCount(bidvo);
		int bidIngCount  = Integer.parseInt(bidingcount.getBidCode());
		model.addAttribute("bidIngCount", bidIngCount);
		//낙찰완료 갯수 
		
		//결재완료 갯수
		
		
		return "/mypage/mypage_main";
	}
	// 구매자신용도 요청
	@RequestMapping(value = "/mypage/mypageMyinfoCredit", method = RequestMethod.GET)
	public String mypageCredit(HttpSession session) {
		String userId = (String) session.getAttribute("userId");

		return "/mypage/mypage_myinfo_credit";
	}
	// 구매안내
	@RequestMapping(value = "/BuyInfo", method = RequestMethod.GET)
	public String mypageBuyInfo(HttpSession session) {
		
		return "/mypage/mypage_buy_info";
	}
}