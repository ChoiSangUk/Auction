package com.kpsl.auction.ad.service;

import java.util.List;

import com.kpsl.auction.ad.vo.AdApplyVo;
import com.kpsl.auction.auctiongoods.vo.AuctionGoodsVo;

public interface AdApplyDao {
	
	// 판매자가 등록한 물품을 SELECT하는 메서드
	List<AuctionGoodsVo> selectAuctionGoodsListForAdApply(String userId);
	// 광고신청 INSERT 메서드
	int insertAdApply(AdApplyVo adApplyVo);
}
