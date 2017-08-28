package com.kpsl.auction.main.controller;

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
public class MainController {
	Logger log = Logger.getLogger(this.getClass());
	@Autowired
	private UserService userService;
	@Autowired
	private UserDetailService userDetailService;
	
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

	// 관리자로그인
	@RequestMapping(value = "/admin/adminLogin", method = RequestMethod.POST)
	public String adminLogin(UserDetailVo userDetailVo, HttpSession session, Model model) {
		// UserDetailVo sessionUser = userService.getUserLogin(userDetailVo);
		UserDetailVo loginUser = userService.getUserLogin(userDetailVo.getUserId(), userDetailVo.getUserPassword());
		log.info(userDetailVo.getUserId());
		log.info(userDetailVo.getUserPassword());

		if (loginUser != null && loginUser.getUserLevel().equals("관리자")) {
			log.info("로그인성공");
			session.setAttribute("userLoginInfo", loginUser);
			return "redirect:/admin/adminMain";
		} else {
			log.info("로그인실패");
			return "/admin/admin_login";
		}

	}
	//관리자로그아웃
	@RequestMapping("**/admin/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/admin/adminLogin";
	}
	@RequestMapping(value = "/admin/adminMain", method = RequestMethod.GET)
	public String adminMain(Model model) {
		
		log.info("adminMain 확인");
		return "/admin/admin_main";
	}
	//마이페이지 메인
	@RequestMapping(value = "/mypage/mypageMain", method = RequestMethod.GET)
	public String mypage(HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		log.info(userId + "<----- page1 확인");
		session.getAttribute("userLoginInfo");
		UserDetailVo userDetailInfo = userService.getUser(userId);
		session.setAttribute("userDetailInfo", userDetailInfo);
		GradeVo gradeVo = userService.getUserGrade(userId);
		log.info(gradeVo.getGradeName() + "<---- 확인");
		session.setAttribute("grade", gradeVo);
		return "/mypage/mypage_main";
	}
}