package com.kpsl.auction.cash.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kpsl.auction.account.service.AccountService;
import com.kpsl.auction.account.vo.AccountVo;
import com.kpsl.auction.cash.service.CashService;
import com.kpsl.auction.cash.vo.CashVo;
import com.kpsl.auction.user.service.UserService;
import com.kpsl.auction.user.vo.UserDetailVo;

@Controller
public class CashController {
	Logger log = Logger.getLogger(this.getClass());
	@Autowired
	private CashService cashService;
	@Autowired
	private AccountService accountservice;

	// 캐쉬충전폼
	@RequestMapping(value = "/mypage/myinfo/Cash", method = RequestMethod.GET)
	public String cashForm() {

		return "/mypage/mypage_myinfo_cash";
	}

	// 캐쉬충전
	@RequestMapping(value = "/mypage/myinfo/Cash", method = RequestMethod.POST)
	public String cashInput(UserDetailVo userDetailVo, CashVo cashVo, HttpSession session,Model model) {
		String userId = (String) session.getAttribute("userId");
		//1. 캐쉬테이블에 충전내역 insert
		cashVo.setUserId(userId);
		cashService.setCash(cashVo);
		log.info("testtest CASH");
		//2. 유저테이블에 캐쉬 update
		userDetailVo.setUserId(userId);
		log.info(userId);
		log.info(userDetailVo.toString());
		cashService.modifyUserCash(userDetailVo);
		session.getAttribute("userLoginInfo");
		session.getAttribute("userDetailInfo");
		return "redirect:/mypage/mypageMain";
	}

	// 캐쉬출금폼
	@RequestMapping(value = "/mypage/myinfo/CashWithdraw", method = RequestMethod.GET)
	public String cashWithdrawForm(HttpSession session,AccountVo accountVo) {
		//출금계좌 받아오기
		String userId = (String) session.getAttribute("userId");
		accountVo.setUserId(userId);			
		accountVo = accountservice.getAccount(userId);
		session.setAttribute("account", accountVo);
		return "/mypage/mypage_myinfo_cashWithdraw";
	}

	// 캐쉬출금
	@RequestMapping(value = "/mypage/myinfo/CashWithdraw", method = RequestMethod.POST)
	public String cashWithdraw(UserDetailVo userDetailVo, CashVo cashVo, HttpSession session,Model model) {
		String userId = (String) session.getAttribute("userId");
		//1. 캐쉬테이블에 출금내역 insert
		cashVo.setUserId(userId);
		cashService.setCashWithdraw(cashVo);
		log.info("testtest CASH");
		//2.유저테이블에 캐쉬출금 update
		userDetailVo.setUserId(userId);
		log.info(userId);
		log.info(userDetailVo.toString());
		cashService.modifyUserCashWithdraw(userDetailVo);
		session.getAttribute("userLoginInfo");
		session.getAttribute("userDetailInfo");
		
		return "redirect:/mypage/mypageMain";
	}
	//캐쉬 관리폼
	@RequestMapping(value = "/mypage/myinfo/CashDetail", method = RequestMethod.GET)
	public String cashDetailForm(HttpSession session) {
				
		return "/mypage/mypage_myinfo_cashDetail";
	}
	//캐쉬 관리
	@RequestMapping(value = "/mypage/myinfo/CashDetail", method = RequestMethod.POST)
	public String cashDetail(HttpSession session,CashVo cashVo,Model model
							,@RequestParam String cashState) {
		String userId = (String) session.getAttribute("userId");
		
		List<CashVo> cashDetail = cashService.getCashDetail(userId,cashState);
		model.addAttribute("cashDetail", cashDetail);
		log.info(userId);
		log.info(cashState);
		return "/mypage/mypage_myinfo_cashDetail";
	}
}
