package com.kpsl.auction.main.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {
	Logger log = Logger.getLogger(this.getClass());

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index() {
		
		log.info("로그확인");
		return "index";
	}
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(Model model) {
		
		log.info("로그확인");
		return "main";
	}

	@RequestMapping(value = "/admin/adminLogin", method = RequestMethod.GET)
	public String adminLogin(Model model) {
		
		log.info("adminLogin 확인");
		return "/admin/admin_login";
	}
	
	@RequestMapping(value = "/admin/adminMain", method = RequestMethod.POST)
	public String adminMain(Model model) {
		/** 회원테이블에서 관리자아이디 받아서 비교하고 성공했을때 로그인구현 추가*/
		log.info("adminMain 확인");
		return "/admin/admin_main";
	}

	@RequestMapping(value = "/mypage/mypageMain", method = RequestMethod.GET)
	public String myPageMain() {
		
		log.info("myPageMain 확인");
		return "/mypage/mypage_main";
	}
}