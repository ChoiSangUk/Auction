package com.kpsl.auction.user.controller;

import java.util.List;
import java.util.Locale;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.SessionAttributes;

import com.kpsl.auction.ad.service.AdPaymentService;
import com.kpsl.auction.ad.vo.AdApplyAndAdImageAndAdPaymentVo;
import com.kpsl.auction.user.service.UserDetailService;
import com.kpsl.auction.user.service.UserService;
import com.kpsl.auction.user.vo.UserDetailVo;
import com.kpsl.auction.user.vo.UserVo;

@SessionAttributes("userLoginInfo")
@Controller
public class UserController {
	Logger log = Logger.getLogger(this.getClass());
	@Autowired
	private UserService userService;
	@Autowired
	private UserDetailService userDetailService;
	@Autowired
	private AdPaymentService adPaymentService;
	//회원가입폼
	@RequestMapping(value = "/user/userJoin", method = RequestMethod.GET)
	public String join(Locale locale, Model model) {
		log.info("회원가입");
		return "/user/user_join";
	}
	//구매자가입 약관
	@RequestMapping(value = "/user/userBuyerClause", method = RequestMethod.GET)
	public String buyerclause(Locale locale, Model model) {

		log.info("구매자가입");
		return "/user/user_buyerClause";
	}
	//판매자가입 약관
	@RequestMapping(value = "/user/userSellerClause", method = RequestMethod.GET)
	public String sellerclause(Locale locale, Model model) {

		log.info("판매자가입");
		return "/user/user_sellerClause";
	}
	//로그인폼
	@RequestMapping(value = "/user/userLogin", method = RequestMethod.GET)
	public String login(Locale locale, Model model) {
		
		log.info("회원로그인창");
		List<AdApplyAndAdImageAndAdPaymentVo> adPaymentSuccessList = adPaymentService.getPaymentSuccessList();
		model.addAttribute("adPaymentSuccessList", adPaymentSuccessList);		
		
		return "/user/user_login";
	}

	// 세션테스트 화면
	@RequestMapping("page1")
	public String page1(HttpSession session,Model model) {
		String userId = (String) session.getAttribute("userId");
		UserDetailVo userDetailInfo = userService.getUser(userId);
		model.addAttribute("userDetailInfo", userDetailInfo);

		return "/user/session_test1";
	}
	
	//회원가입약관
	@RequestMapping(value = "/user/test", method = RequestMethod.GET)
	public String test(Locale locale, Model model) {
		
		log.info("회원가입약관");
		return "/user/test";
	}
	//판매자회원가입폼
	@RequestMapping(value = "/user/userSellerInsertForm", method = RequestMethod.GET)
	public String sellerInsert(Locale locale, Model model) {

		log.info("판매자회원가입폼");
		return "/user/user_seller_insertForm";
	}
	//판매자회원가입
	@RequestMapping(value = "/user/userSellerInsertForm", method = RequestMethod.POST)
	public String sellerInsert(UserDetailVo userDetailVo, UserVo userVo) {
		userDetailService.setUser(userVo);
		userDetailService.setUserSeller(userDetailVo);
		log.info("판매자회원가입액션");
		return "redirect:/user/userLogin";
	}
	//구매자회원가입폼
	@RequestMapping(value = "/user/userBuyerInsertForm", method = RequestMethod.GET)
	public String buyerInsert(Locale locale, Model model) {

		log.info("구매자회원가입폼");
		return "/user/user_buyer_insertForm";
	}
	//구매자회원가입
	@RequestMapping(value = "/user/userBuyerInsertForm", method = RequestMethod.POST)
	public String buyerInsert(UserDetailVo userDetailVo, UserVo userVo) {
		userDetailService.setUser(userVo);
		userDetailService.setUserBuyer(userDetailVo);		
		log.info("구매자회원가입액션");
		return "redirect:/user/userLogin";
	}
	//마이페이지 구매자->판매자 전환
	@RequestMapping(value = "/mypage/mypageMain", method = RequestMethod.POST)
	public String mypage(HttpSession session,UserDetailVo userDetailVo) {
	
		String userId = (String) session.getAttribute("userId");
		log.info(userId + "<----- page1 확인");
		session.getAttribute("userLoginInfo");
		UserDetailVo userDetailInfo = userService.getUser(userId);
		userDetailService.modifyUserTrans(userDetailInfo);
		log.info(userDetailVo.getUserLevel());

		return "redirect:**/logout";
	}
	//회원수정폼
	@RequestMapping(value = "/mypage/mypageMyinfoUpdate", method = RequestMethod.GET)
	public String userUpdateForm(HttpSession session) {
		session.getAttribute("userDetailInfo");
		
		log.info("회원수정폼");
		return "/mypage/mypage_myinfo_update";
	}
	//회원수정
	@RequestMapping(value = "/mypage/mypageMyinfoUpdate", method = RequestMethod.POST)
	public String userUpdate(HttpSession session,UserDetailVo userDetailVo) {
		String userId = (String) session.getAttribute("userId");
		userDetailVo.setUserId(userId);
		userDetailService.modifyUser(userDetailVo);
		
		log.info("회원수정");
		return "redirect:/mypage/mypageMain";
	}
	//아이디/비밀번호 찾기 
	@RequestMapping(value = "/user/userFindIdPw", method = RequestMethod.GET)
	public String userFindIdPw(){
		
		return "/user/user_findIdPw";
	}
	//아이디 찾기 폼
	@RequestMapping(value = "/user/userFindIdForm", method = RequestMethod.GET)
	public String userFindIdForm(){
		
		return "/user/user_findId_form";
	}
	//비밀번호 찾기 폼
	@RequestMapping(value = "/user/userFindPwForm", method = RequestMethod.GET)
	public String userFindPwForm(){
		
		return "/user/user_findPw_form";
	}
	//이메일 찾기 폼
	@RequestMapping(value = "/user/userFindEmailForm", method = RequestMethod.GET)
	public String userFindEmailForm(){
		
		return "/user/user_find_email_form";
	}
}
