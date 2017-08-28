package com.kpsl.auction.ad.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kpsl.auction.ad.vo.AdApplyAndAdImageAndAdPaymentVo;
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

	@Override
	public int modifyUserTotalcash(AdPaymentVo adPaymentVo) {
		
		log.info("modifyUserTotalcash 호출 확인");
		
		return adPaymentDao.updateUserTotalcashByUserId(adPaymentVo);
	}

	@Override
	public List<AdApplyAndAdImageAndAdPaymentVo> getPaymentSuccessList() {

		log.info("getPaymentSuccessList 호출 확인");
		
		return adPaymentDao.selectAdApplyAndAdImageAndAdPaymentByUserIdAndAdApplyEndDate();
	}
}
