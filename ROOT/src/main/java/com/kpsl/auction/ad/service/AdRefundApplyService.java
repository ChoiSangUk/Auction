package com.kpsl.auction.ad.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.kpsl.auction.ad.vo.AdApplyAndAdImageAndAdUnitPriceAndAuctionGoodsVo;
import com.kpsl.auction.ad.vo.AdRefundApplyVo;
import com.kpsl.auction.saleslog.vo.SalesLogVo;

@Transactional
public interface AdRefundApplyService {
	// 광고환불신청 아이템 상세정보 DAO 호출 메서드
	AdApplyAndAdImageAndAdUnitPriceAndAuctionGoodsVo getAdRefundList(String adPaymentCode);
	// 광고환불신청 INSERT DAO 호출 메서드
	int addAdRefundApply(AdRefundApplyVo adRefundApplyVo);
	// 광고환불신청 전체리스트 DAO 호출 메서드
	List<AdApplyAndAdImageAndAdUnitPriceAndAuctionGoodsVo> getAdRefundList();
	// 광고환불신청 상세정보 DAO 호출 메서드
	AdApplyAndAdImageAndAdUnitPriceAndAuctionGoodsVo getAdRefundDetailList(AdApplyAndAdImageAndAdUnitPriceAndAuctionGoodsVo adVo);
	// 광고환불신청 수정 DAO 호출 메서드
	int modifyRefundApply(AdRefundApplyVo adRefundApplyVo);
	// 광고환불신청 승인완료시 유저토탈캐쉬 수정 DAO 호출 메서드
	int modifyUserTotalCashByUserId(AdRefundApplyVo adRefundApplyVo);
	// 광고환불신청 승인완료시 회사매입매출테이블 INSERT DAO 메서드 호출
	int addSalesLog(SalesLogVo salesLogVo, AdRefundApplyVo adRefundApplyVo);
	// 광고환불신청 승인완료시 환불신청,회원캐쉬,회사매입매출테이블 트랜잭션 DAO호출 메서드
	int adRefundApplyAndUserTotalCashAndSalesLogTransaction(AdRefundApplyVo adRefundApplyVo, SalesLogVo salesLogVo);
}
