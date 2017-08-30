package com.kpsl.auction.user.controller;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kpsl.auction.user.service.UserDetailService;
import com.kpsl.auction.user.service.UserService;

@Controller
public class UserRemoveController {
	Logger log = Logger.getLogger(this.getClass());
	@Autowired
	private UserService userService;
	@Autowired
	private UserDetailService userDetailService;
	//회원탈퇴
	@RequestMapping(value = "/mypage/mypageMyinfoDelete", method = RequestMethod.GET)
	public String userDeleteForm(HttpSession session) {
				
		log.info("회원탈퇴폼");
		return "/mypage/mypage_myinfo_delete";
	}
}
