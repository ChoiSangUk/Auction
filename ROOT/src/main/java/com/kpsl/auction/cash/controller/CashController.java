package com.kpsl.auction.cash.controller;

import org.springframework.stereotype.Controller;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kpsl.auction.user.service.UserService;
import com.kpsl.auction.user.vo.GradeVo;


@SessionAttributes("userLoginInfo")
@Controller
public class CashController {
	Logger log = Logger.getLogger(this.getClass());
	
	//캐쉬충전
	@RequestMapping(value = "/mypage/myinfo/Cash", method = RequestMethod.GET)
	public String cashForm() {

		return "/mypage/mypage_myinfo_cash";
	}
	@RequestMapping(value = "/mypage/myinfo/Cash", method = RequestMethod.POST)
	public String cashInput() {

		return "redirect:/mypage/mypageMain";
	}
	

}
