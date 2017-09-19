package com.kpsl.auction.board.controller;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class BoardController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@RequestMapping(value = "/board/boardOtoInsertForm", method = RequestMethod.GET)
	public String myBoardOtoInsert(Model model, HttpSession session) {
			
		log.info("myAdApplyModify 요청 확인");
		String userId = (String) session.getAttribute("userId");	
		log.info(userId+"<--- 확인");
		if(userId == null){
			log.info("메인으로 redirect");
			return "redirect:/user/userLogin";
		}else {
			log.info(userId+"<-- id확인");
			model.addAttribute("userId");		
			return "/board/board_oto_insertForm";
		}		
	}
}
