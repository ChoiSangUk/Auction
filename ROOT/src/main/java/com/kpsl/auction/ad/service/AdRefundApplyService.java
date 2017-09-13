package com.kpsl.auction.ad.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.kpsl.auction.ad.vo.AdApplyAndAdImageAndAdUnitPriceAndAuctionGoodsVo;
import com.kpsl.auction.ad.vo.AdRefundApplyVo;

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
}
