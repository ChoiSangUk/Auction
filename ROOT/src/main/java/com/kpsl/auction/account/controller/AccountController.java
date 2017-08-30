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
		public String accountForm(HttpSession session,Model model,AccountVo accountVo) {
			String userId = (String) session.getAttribute("userId");
			accountVo.setUserId(userId);			
			accountVo = accountservice.getAccount(userId);
			session.setAttribute("account", accountVo);
			
			return "/mypage/mypage_myinfo_account";
		}
		@RequestMapping(value = "/mypage/myinfo/MyinfoAccount", method = RequestMethod.POST)
		public String accountDelete(HttpSession session,Model model,AccountVo accountVo) {
			String userId = (String) session.getAttribute("userId");
			accountVo.setUserId(userId);			
			accountservice.removeAccount(accountVo);
			
			return "redirect:/mypage/myinfo/MyinfoAccount";
		}
		//계좌등록폼
		@RequestMapping(value = "/mypage/myinfo/MyinfoAccountInsert", method = RequestMethod.GET)
		public String accountInsertForm(HttpSession session) {
			session.getAttribute("userLoginInfo");
			return "/mypage/mypage_myinfo_account_insert";
		}
		//계좌등록
		@RequestMapping(value = "/mypage/myinfo/MyinfoAccountInsert", method = RequestMethod.POST)
		public String accountInsert(HttpSession session,Model model,AccountVo accountVo) {
			session.getAttribute("userLoginInfo");
			String userId = (String) session.getAttribute("userId");
			accountVo.setUserId(userId);
			log.debug(accountVo);
			accountservice.setAccount(accountVo);
			return "redirect:/mypage/myinfo/MyinfoAccount";
		}
		//계좌수정폼
		@RequestMapping(value = "/mypage/myinfo/MyinfoAccountUpdate", method = RequestMethod.GET)
		public String accountUpdateForm(HttpSession session,Model model,AccountVo accountVo) {
			String userId = (String) session.getAttribute("userId");
			accountVo.setUserId(userId);			
			accountVo = accountservice.getAccount(userId);
			model.addAttribute("account", accountVo);
			
			return "/mypage/mypage_myinfo_account_update";
		}
		//계좌수정
		@RequestMapping(value = "/mypage/myinfo/MyinfoAccountUpdate", method = RequestMethod.POST)
		public String accountUpdate(HttpSession session,Model model,AccountVo accountVo) {
			String userId = (String) session.getAttribute("userId");
			accountVo.setUserId(userId);			
			
			accountservice.modifyAccount(accountVo);
			
			return "redirect:/mypage/myinfo/MyinfoAccount";
		}
		
}
