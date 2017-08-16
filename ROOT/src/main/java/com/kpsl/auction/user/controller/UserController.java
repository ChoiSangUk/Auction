package com.kpsl.auction.user.controller;

import java.util.Locale;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kpsl.auction.user.service.UserDao;
import com.kpsl.auction.user.service.UserDetailDao;
import com.kpsl.auction.user.service.UserDetailService;
import com.kpsl.auction.user.vo.UserDetailVo;
import com.kpsl.auction.user.vo.UserVo;


@Controller
public class UserController {
	Logger log = Logger.getLogger(this.getClass());
	@Autowired
    private UserDetailService userDetailService;

	
	
	@RequestMapping(value = "/user/userJoin", method = RequestMethod.GET)
	public String join(Locale locale, Model model) {
		
		log.info("회원가입");
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

	@RequestMapping(value = "/user/test", method = RequestMethod.GET)
	public String test(Locale locale, Model model) {
		
		log.info("회원가입약관");
		return "/user/test";
	}
/*	@RequestMapping(value = "/user/userBuyerInsertForm", method = RequestMethod.GET)
	public String buyerInsert(Locale locale, Model model) {
		
		log.info("구매자회원가입");
		return "/user/user_buyer_insertForm";
	}*/
	@RequestMapping(value = "/user/userBuyerInsertForm", method = RequestMethod.GET)
	public String buyerInsert(Locale locale, Model model) {
		
		log.info("구매자회원가입");
		return "/user/user_buyer_insertForm";
	}
	@RequestMapping(value = "/user/userBuyerInsertForm", method = RequestMethod.POST)
	public String buyerInsert(UserDetailVo userDetailVo,UserVo userVo) {
		userDetailService.setUserBuyer(userDetailVo);
		userDetailService.setUser(userVo);
		log.info("구매자회원가입액션");
		return "redirect:/user/userLogin";
	}

}
