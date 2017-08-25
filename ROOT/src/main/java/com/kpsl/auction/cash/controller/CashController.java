package com.kpsl.auction.cash.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kpsl.auction.cash.service.CashService;
import com.kpsl.auction.cash.vo.CashVo;
import com.kpsl.auction.user.vo.UserDetailVo;

@Controller
public class CashController {
	Logger log = Logger.getLogger(this.getClass());
	@Autowired
	private CashService cashService;


	// 캐쉬충전폼
	@RequestMapping(value = "/mypage/myinfo/Cash", method = RequestMethod.GET)
	public String cashForm() {

		return "/mypage/mypage_myinfo_cash";
	}

	// 캐쉬충전
	@RequestMapping(value = "/mypage/myinfo/Cash", method = RequestMethod.POST)
	public String cashInput(UserDetailVo userDetailVo, CashVo cashVo, HttpSession session) {
		String userId = (String) session.getAttribute("userId");

		cashVo.setUserId(userId);
		cashService.setCash(cashVo);
		log.info("testtest CASH");

		userDetailVo.setUserId(userId);
		log.info(userId);
		log.info(userDetailVo.toString());
		cashService.modifyUserCash(userDetailVo);
		session.getAttribute("userLoginInfo");

		return "redirect:/mypage/mypageMain";
	}

	// 캐쉬출금폼
	@RequestMapping(value = "/mypage/myinfo/CashWithdraw", method = RequestMethod.GET)
	public String cashWithdrawForm() {

		return "/mypage/mypage_myinfo_cashWithdraw";
	}

	// 캐쉬출금
	@RequestMapping(value = "/mypage/myinfo/CashWithdraw", method = RequestMethod.POST)
	public String cashWithdraw(UserDetailVo userDetailVo, CashVo cashVo, HttpSession session) {
		String userId = (String) session.getAttribute("userId");

		cashVo.setUserId(userId);
		cashService.setCashWithdraw(cashVo);
		log.info("testtest CASH");

		userDetailVo.setUserId(userId);
		log.info(userId);
		log.info(userDetailVo.toString());
		cashService.modifyUserCashWithdraw(userDetailVo);
		session.getAttribute("userLoginInfo");
		return "redirect:/mypage/mypageMain";
	}

}
