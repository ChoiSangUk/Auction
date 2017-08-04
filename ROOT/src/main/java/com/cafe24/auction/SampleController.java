package com.cafe24.auction;

import java.util.Locale;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SampleController {
	Logger log = Logger.getLogger(this.getClass());

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		log.debug("인터셉터 테스트");
		log.info("로그확인");
		return "home";
	}
}
