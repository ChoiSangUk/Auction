package com.kpsl.auction.ad.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.kpsl.auction.ad.vo.AdApplyAndAdImageAndAdPaymentVo;
import com.kpsl.auction.ad.vo.AdPaymentVo;

@Transactional
public interface AdPaymentService {

	// 광고신청 DAO 호출 메서드
	int addAdPayment(AdPaymentVo adPaymentVo);
	// 유저토탈캐쉬 업데이트 DAO 호출 메서드
	int modifyUserTotalcash(AdPaymentVo adPaymentVo);
	// 광고결제리스트 DAO 호출 메서드
	List<AdApplyAndAdImageAndAdPaymentVo> getPaymentSuccessList();
}
