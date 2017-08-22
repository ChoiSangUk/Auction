package com.kpsl.auction.cash.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kpsl.auction.cash.service.CashService;
import com.kpsl.auction.cash.vo.CashVo;



@Controller
public class CashController {
	Logger log = Logger.getLogger(this.getClass());
	@Autowired
	private CashService cashService;
			
	//캐쉬충전
	@RequestMapping(value = "/mypage/myinfo/Cash", method = RequestMethod.GET)
	public String cashForm() {

		return "/mypage/mypage_myinfo_cash";
	}
	@RequestMapping(value = "/mypage/myinfo/Cash", method = RequestMethod.POST)
	public String cashInput(CashVo cashVo,HttpSession session) {
		String userId = (String)session.getAttribute("userId");
		cashVo.setUserId(userId);
		
		
		cashService.setCash(cashVo);
			
		return "redirect:/mypage/mypageMain";
	}
	

}
