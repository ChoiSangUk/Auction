package com.kpsl.auction.ad.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.kpsl.auction.ad.vo.AdApplyAndAdImageAndAdPaymentVo;
import com.kpsl.auction.ad.vo.AdPaymentVo;
import com.kpsl.auction.saleslog.vo.SalesLogVo;

@Transactional
public interface AdPaymentService {

	// 광고결제 DAO 호출 메서드
	int addAdPayment(AdPaymentVo adPaymentVo);
	// 광고결제시 회사매입매출 INSERT 호출 메서드
	int addSalesLog(SalesLogVo salesLogVo);
	// 광고결제 트랜잭션 
	void adPaymentAndSalesLogTransaction(AdPaymentVo adPaymentVo, SalesLogVo salesLogVo);
	// 유저토탈캐쉬 업데이트 DAO 호출 메서드
	int modifyUserTotalcash(AdPaymentVo adPaymentVo);
	// 광고결제리스트 DAO 호출 메서드
	List<AdApplyAndAdImageAndAdPaymentVo> getPaymentSuccessList();
}
