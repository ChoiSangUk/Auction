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
import com.kpsl.auction.user.service.UserService;
import com.kpsl.auction.user.vo.UserDetailVo;
import com.kpsl.auction.user.vo.UserVo;


@Controller
public class UserController {
	Logger log = Logger.getLogger(this.getClass());
	@Autowired
    private UserDetailService userDetailService;
	private UserService userService;

	
	
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
/*	@RequestMapping(value = "/user/userLogin", method = RequestMethod.GET)
	public String login(Locale locale, Model model) {
		
		log.info("회원로그인창");
		return "/user/user_login";
	}*/
	@RequestMapping(value = "/user/userLogin", method = RequestMethod.POST)
	public String login(Model model, UserDetailVo userDetailVo) {
		UserDetailVo sessionUser = userService.getUserLogin(userDetailVo);
		log.info("회원로그인");
	        if(sessionUser==null){
	        	log.info("회원로그인성공");
	            return "/user/userLogin";
	        }else{
	        	log.info("회원로그인실패");
	            model.addAttribute("UserId", sessionUser);
	            return "redirect:/main";
	        }
	    }

	@RequestMapping(value = "/user/test", method = RequestMethod.GET)
	public String test(Locale locale, Model model) {
		
		log.info("회원가입약관");
		return "/user/test";
	}
	@RequestMapping(value = "/user/userSellerInsertForm", method = RequestMethod.GET)
	public String sellerInsert(Locale locale, Model model) {
		
		log.info("판매자회원가입");
		return "/user/user_seller_insertForm";
	}
	@RequestMapping(value = "/user/userSellerInsertForm", method = RequestMethod.POST)
	public String sellerInsert(UserDetailVo userDetailVo,UserVo userVo) {
		userDetailService.setUserSeller(userDetailVo);
		userDetailService.setUser(userVo);
		log.info("판매자회원가입액션");
		return "redirect:/user/userLogin";
	}
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
