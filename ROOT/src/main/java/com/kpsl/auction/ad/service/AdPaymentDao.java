package com.kpsl.auction.ad.service;

import java.util.List;

import com.kpsl.auction.ad.vo.AdApplyAndAdImageAndAdPaymentVo;
import com.kpsl.auction.ad.vo.AdPaymentVo;

public interface AdPaymentDao {
	
	// 광고결제 INSERT 메서드
	int insertAdPayment(AdPaymentVo adPaymentVo);
	// 광고결제 후 회원토탈캐쉬 UPDATE 메서드
	int updateUserTotalcashByUserId(AdPaymentVo adPaymentVo);
	// 광고신청, 광고이미지, 광고결제 SELECT메서드
	List<AdApplyAndAdImageAndAdPaymentVo> selectAdApplyAndAdImageAndAdPaymentByUserIdAndAdApplyEndDate();
	// 광고결제, 광고신청, 광고이미지 전체SELECT 메서드
	List<AdApplyAndAdImageAndAdPaymentVo> selectAdApplyAndAdImageAndAdPaymentList();
	// 광고결제 조회 SELECT 메서드
	List<AdApplyAndAdImageAndAdPaymentVo> selectAdPaymentListByAdPaymentVo(AdPaymentVo adPaymentVo);
	// 광고결제 조회 COUNT SELECT 메서드
	int selectAdPaymentCount(AdPaymentVo adPaymentVo);
}
