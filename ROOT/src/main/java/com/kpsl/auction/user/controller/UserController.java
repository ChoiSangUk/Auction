package com.kpsl.auction.user.controller;

import java.util.Locale;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class UserController {
	Logger log = Logger.getLogger(this.getClass());
	
	@RequestMapping(value = "/user/userJoin", method = RequestMethod.GET)
	public String join(Locale locale, Model model) {
		
		log.info("로그확인");
		return "/user/user_join";
	}
	@RequestMapping(value = "/user/userBuyerClause", method = RequestMethod.GET)
	public String buyerclause(Locale locale, Model model) {
		
		log.info("구매자가입");
		return "/user/user_buyerClause";
	}
	@RequestMapping(value = "/user/userSellerClause", method = RequestMethod.GET)
	public String sellerclause(Locale locale, Model model) {
		
		log.info("판매자가입");
		return "/user/user_sellerClause";
	}
	@RequestMapping(value = "/user/userLogin", method = RequestMethod.GET)
	public String login(Locale locale, Model model) {
		
		log.info("회원로그인");
		return "/user/user_login";
	}
/*	// 입력(액션) 요청
    @RequestMapping(value="user/userLogin", method = RequestMethod.POST)
    public String login() { // 커맨드 객체

        return "redirect:/main"; // 글입력후 "/main"로 리다이렉트(재요청)
    }
    
    * 구현해야됨 로그인받아서 리다이렉트 
    */
	@RequestMapping(value = "/user/test", method = RequestMethod.GET)
	public String test(Locale locale, Model model) {
		
		log.info("회원가입약관");
		return "/user/test";
	}
	@RequestMapping(value = "/user/userBuyerInsertForm", method = RequestMethod.GET)
	public String buyerInsert(Locale locale, Model model) {
		
		log.info("회원가입약관");
		return "/user/user_buyer_insertForm";
	}
}
