package com.kpsl.auction.account.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AccountController {
		//계좌관리폼
		@RequestMapping(value = "/mypage/myinfo/MyinfoAccount", method = RequestMethod.GET)
		public String accountForm() {

			return "/mypage/mypage_myinfo_account";
		}
}
