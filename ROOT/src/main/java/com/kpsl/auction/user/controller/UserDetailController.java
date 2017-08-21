package com.kpsl.auction.user.controller;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kpsl.auction.user.service.UserDetailService;
import com.kpsl.auction.user.service.UserService;
import com.kpsl.auction.user.vo.GradeVo;
import com.kpsl.auction.user.vo.UserDetailVo;

@Controller
public class UserDetailController {
	Logger log = Logger.getLogger(this.getClass());
	@Autowired
	private UserService userService;
	@Autowired
	private UserDetailService userDetailService;

	// 유저로그인
	@RequestMapping(value = "/user/userLogin", method = RequestMethod.POST)
	public String login(UserDetailVo userDetailVo, HttpSession session,Model model) {
		// UserDetailVo sessionUser = userService.getUserLogin(userDetailVo);
		UserDetailVo loginUser = userService.getUserLogin(userDetailVo.getUserId(), userDetailVo.getUserPassword());
		
		
		String userId = userDetailVo.getUserId();
		
		
		log.info(userId+"<---- login 확인");
		log.info(userDetailVo.getUserPassword());
		
		
		if (loginUser != null) {
			session.setAttribute("userId", userId);
			session.setAttribute("userLoginInfo", loginUser);
			return "redirect:/main";
		} else {

			return "/user/user_login";
		}

	}

	// 유저로그아웃
	@RequestMapping("**/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/main";
	}
	
	
	
}
