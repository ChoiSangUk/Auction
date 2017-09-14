package com.kpsl.auction.ad.service;

import java.util.List;

import com.kpsl.auction.ad.vo.AdApplyAndAdImageAndAdUnitPriceAndAuctionGoodsVo;
import com.kpsl.auction.ad.vo.AdRefundApplyVo;

public interface AdRefundApplyDao {
	// 광고환불신청할 아이템 상세정보 SELECT 쿼리
	AdApplyAndAdImageAndAdUnitPriceAndAuctionGoodsVo selectAdRefundListByAdPaymentCode(String adPaymentCode);
	// 광고환불신청 INSERT 쿼리
	int insertAdRefundApply(AdRefundApplyVo adRefundApplyVo);
	// 광고환불신청 전체리스트 SELECT 쿼리
	List<AdApplyAndAdImageAndAdUnitPriceAndAuctionGoodsVo> selectAdRefundList();
	// 광고환불신청 상세정보 SELECT 쿼리
	AdApplyAndAdImageAndAdUnitPriceAndAuctionGoodsVo selectAdRefundDetailList(AdApplyAndAdImageAndAdUnitPriceAndAuctionGoodsVo adVo);
	// 광고환불신청 UPDATE 쿼리
	int updateAdRefund(AdRefundApplyVo adRefundApplyVo);
	// 광고환불신청 UPDATE시 회원상세테이블 유저토탈캐쉬 UPDATE 쿼리
	int updateUserTotalCashByUserId(AdRefundApplyVo adRefundApplyVo);
}
