package com.kpsl.auction.ad.service;

import com.kpsl.auction.ad.vo.AdPaymentVo;

public interface AdPaymentDao {
	
	// 광고결제 INSERT 메서드
	int insertAdPayment(AdPaymentVo adPaymentVo);
}
