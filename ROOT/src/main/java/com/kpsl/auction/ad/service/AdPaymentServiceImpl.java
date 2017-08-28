package com.kpsl.auction.ad.service;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kpsl.auction.ad.vo.AdPaymentVo;

@Service
public class AdPaymentServiceImpl implements AdPaymentService {

	Logger log = Logger.getLogger(this.getClass());
	@Autowired AdPaymentDao adPaymentDao;
	
	@Override
	public int addAdPayment(AdPaymentVo adPaymentVo) {
	
		log.info("addAdPayment 호출 확인");
		
		return adPaymentDao.insertAdPayment(adPaymentVo);
	}
}
