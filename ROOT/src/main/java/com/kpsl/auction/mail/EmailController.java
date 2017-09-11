package com.kpsl.auction.mail;

import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;

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
	   //이메일찾기
		@RequestMapping(value = "/user/userFindEmailForm", method = RequestMethod.POST)
		public String userFindEmail(@RequestParam Map<String, Object> paramMap,UserDetailVo userDetailVo,Model model) throws Exception{
			log.info("이메일찾기");
			String userName=(String) paramMap.get("userName");
	        String userBirth=(String) paramMap.get("userBirth");
	        log.info(userName);
	        log.info(userBirth);
	        
	        userDetailVo = userDetailService.getUserFind("", "",userName,userBirth);
	        if(userName != null) {
	        	log.info(userDetailVo.getUserName());
	        	model.addAttribute("user", userDetailVo);
			 }
	        return "/user/user_find_email_form";
		}
	   
	   //아이디 찾기(메일발송)
		@RequestMapping(value = "/user/userFindIdForm", method = RequestMethod.POST)
		public String userFindId(@RequestParam Map<String, Object> paramMap,UserDetailVo userDetailVo) throws Exception{
			log.info("아이디찾기");
			String userName=(String) paramMap.get("userName");
	        String userBirth=(String) paramMap.get("userBirth");
	        log.info(userName);
	        log.info(userBirth);
	        
	        userDetailVo = userDetailService.getUserFind("", "",userName,userBirth);
	        if(userName != null) {
				log.info(userDetailVo.getUserName());
				log.info(userDetailVo.getUserPassword());
				email.setContent(userName+"님의 아이디는 "+ userDetailVo.getUserId()+" 입니다.\n좋은하루되십시오.");
				email.setReceiver(userDetailVo.getUserEmail());
	            email.setSubject(userDetailVo.getUserName()+"님 강박송이 경매사이트 아이디 찾기 메일입니다.");
	            emailSender.SendEmail(email);
		           
		            return "redirect:/user/userLogin";
		        }else{
		        	return "/user/user_findId_form";
		        }
			
		}
	  //비밀번호 찾기(메일발송)
		@RequestMapping(value = "/user/userFindPwForm", method = RequestMethod.POST)
		public String userFindPw(@RequestParam Map<String, Object> paramMap,UserDetailVo userDetailVo) throws Exception{
			log.info("비밀번호찾기");
			String userId=(String) paramMap.get("userId");
	        String userEmail=(String) paramMap.get("userEmail");
	        userDetailVo = userDetailService.getUserFind(userId, userEmail,"","");
	        if(userId != null) {
				log.info(userId);
				log.info(userDetailVo.getUserName());
				log.info(userDetailVo.getUserPassword());
				email.setContent(userId+"님의 비밀번호는 "+ userDetailVo.getUserPassword()+" 입니다.\n접속후 비밀번호를 수정해주세요.\n좋은하루되십시오.  ");
				email.setReceiver(userEmail);
	            email.setSubject(userDetailVo.getUserName()+"님 강박송이 경매사이트 비밀번호 찾기 메일입니다.");
	            emailSender.SendEmail(email);
		           
		            return "redirect:/user/userLogin";
		        }else{
		        	return "/user/user_findPw_form";
		        }
			
		}
}
