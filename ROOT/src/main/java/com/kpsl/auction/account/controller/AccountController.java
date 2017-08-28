package com.kpsl.auction.account.controller;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kpsl.auction.account.service.AccountService;
import com.kpsl.auction.account.vo.AccountVo;

@Controller
public class AccountController {
	Logger log = Logger.getLogger(this.getClass());
	@Autowired
	private AccountService accountservice;

		//계좌관리폼
		@RequestMapping(value = "/mypage/myinfo/MyinfoAccount", method = RequestMethod.GET)
		public String accountForm() {

			return "/mypage/mypage_myinfo_account";
		}
		@RequestMapping(value = "/mypage/myinfo/MyinfoAccountInsert", method = RequestMethod.GET)
		public String accountInsertForm(HttpSession session) {
			session.getAttribute("userLoginInfo");
			return "/mypage/mypage_myinfo_account_insert";
		}
		@RequestMapping(value = "/mypage/myinfo/MyinfoAccountInsert", method = RequestMethod.POST)
		public String accountInsert(HttpSession session,Model model,AccountVo accountVo) {
			session.getAttribute("userLoginInfo");
			String userId = (String) session.getAttribute("userId");
			accountVo.setUserId(userId);
			
			accountservice.setAccount(accountVo);
			return "redirect:/mypage/mypageMain";
		}
		
}
