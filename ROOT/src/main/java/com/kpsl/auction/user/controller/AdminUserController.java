package com.kpsl.auction.user.controller;

import java.util.List;
import java.util.Locale;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kpsl.auction.user.service.AdminUserService;
import com.kpsl.auction.user.vo.AdminUserSearchVo;
import com.kpsl.auction.user.vo.UserDetailVo;

@Controller
public class AdminUserController {
	Logger log = Logger.getLogger(this.getClass());
	@Autowired 
	AdminUserService adminUserService;
	
	//유저검색폼
	@RequestMapping(value = "/user/adminUserSearch", method = RequestMethod.GET)
	public String adminUserSearchForm(Locale locale, Model model) {

		log.info("회원검색폼 ");
		return "/admin/user/admin_user_search";
	}
	//유저검색
	@RequestMapping(value = "/user/adminUserSearch", method = RequestMethod.POST)
	public String adminUserSearch(Locale locale, Model model,AdminUserSearchVo adminUserSearchVo,UserDetailVo userDetailVo
								,@RequestParam String sk
								,@RequestParam String sv) {
	
		log.debug(userDetailVo.getUserAddr());
		adminUserService.getUserSearch(userDetailVo,sk,sv);
		List<AdminUserSearchVo> userSearch = adminUserService.getUserSearch(userDetailVo,sk,sv);
		model.addAttribute("userSearch", userSearch);
		
		log.info("회원검색");
		return "/admin/user/admin_user_search";
	}
}
