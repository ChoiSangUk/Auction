package com.kpsl.auction.restController;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kpsl.auction.ad.service.AdApplyService;
import com.kpsl.auction.ad.service.AdPaymentService;
import com.kpsl.auction.ad.service.AdUnitPriceService;
import com.kpsl.auction.ad.vo.AdApplyAndAdImageAndAdPaymentVo;

@RestController
public class AdRestController {	
	@Autowired AdUnitPriceService adUnitPriceService;
	@Autowired AdApplyService adApplyService;
	@Autowired AdPaymentService adPaymentService;
		
	Logger log = Logger.getLogger(this.getClass());
	
	// 신청한 광고가 3개 이상이면 첫번째 광고의 종료날짜를 리턴
	@RequestMapping(value = "/dateAjax", method = RequestMethod.POST)
	public String dateAjax() {
		
		log.info("ajax 호출 확인");
		List<AdApplyAndAdImageAndAdPaymentVo> currentAdList = adPaymentService.getPaymentSuccessList();
		String endDate = currentAdList.get(0).getAdApplyVo().getAdApplyEndDate();
		log.info(currentAdList.size()+"<--- size");
		
		if(currentAdList.size() >= 3) {
			return endDate;
		}else {
			return null;
		}
	}
}
