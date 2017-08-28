package com.kpsl.auction.ad.service;

import org.springframework.transaction.annotation.Transactional;

import com.kpsl.auction.ad.vo.AdPaymentVo;

@Transactional
public interface AdPaymentService {

	// 광고신청 DAO 호출 메서드
	int addAdPayment(AdPaymentVo adPaymentVo);
}
