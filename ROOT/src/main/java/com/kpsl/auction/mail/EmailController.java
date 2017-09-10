package com.kpsl.auction.mail;

import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kpsl.auction.user.service.UserDetailService;
import com.kpsl.auction.user.vo.UserDetailVo;

@Controller
public class EmailController {
		Logger log = Logger.getLogger(this.getClass());
	   @Autowired
	   private EmailSender emailSender;
	   @Autowired
	   private Email email;
	   @Autowired
	   private UserDetailService userDetailService;

	  //비밀번호 찾기 폼
		@RequestMapping(value = "/user/userFindPwForm", method = RequestMethod.POST)
		public String userFindPw(@RequestParam Map<String, Object> paramMap,UserDetailVo userDetailVo) throws Exception{
			log.info("123확인123");
			String userId=(String) paramMap.get("userId");
	        String userEmail=(String) paramMap.get("userEmail");
	        userDetailVo = userDetailService.getUserPwFind(userId, userEmail);
	        if(userId !=null) {
				log.info(userId);
				log.info(userDetailVo.getUserName());
				log.info(userDetailVo.getUserPassword());
				email.setContent(userId+"님의 비밀번호는 "+ userDetailVo.getUserPassword()+" 입니다.\n접속후 비밀번호를 수정해주세요!  ");
				email.setReceiver(userEmail);
	            email.setSubject(userDetailVo.getUserName()+"님 강박송이 경매사이트 비밀번호 찾기 메일입니다.");
	            emailSender.SendEmail(email);
		           
		            return "redirect:/user/userLogin";
		        }
			return "/user/user_findPw_form";
			
		}
}
