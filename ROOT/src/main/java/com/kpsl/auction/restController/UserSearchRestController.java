package com.kpsl.auction.restController;


import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kpsl.auction.cash.service.CashService;
import com.kpsl.auction.cash.vo.CashVo;


@RestController
public class UserSearchRestController {
	Logger log = Logger.getLogger(this.getClass());
	@Autowired CashService cashService;
	
	@RequestMapping(value = "/userIdAjax", method = RequestMethod.POST)
	public List<CashVo> dateAjax(@RequestParam String userId,CashVo cashVo,Model model) {
		
		log.info("ajax 호출 확인");
		log.info(userId);
		
		cashVo.setUserId(userId);
		List<CashVo> userList= cashService.getCashDetail(cashVo);
		model.addAttribute("userList", userList);
		return userList;
	}
}

