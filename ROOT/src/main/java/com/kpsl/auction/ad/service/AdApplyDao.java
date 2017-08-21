package com.kpsl.auction.ad.service;

import java.util.List;

import com.kpsl.auction.ad.vo.AdApplyAndAdImageVo;
import com.kpsl.auction.ad.vo.AdApplyVo;
import com.kpsl.auction.ad.vo.AdImageVo;
import com.kpsl.auction.auctiongoods.vo.AuctionGoodsVo;

public interface AdApplyDao {
	
	// 판매자가 등록한 물품을 SELECT 메서드
	List<AuctionGoodsVo> selectAuctionGoodsListForAdApply(String userId);
	// 광고신청 INSERT 메서드
	int insertAdApply(AdApplyVo adApplyVo);
	// 광고 이미지 신청 INSER 메서드
	int insertAdImage(AdImageVo adImageVo);
	// 광고 신청 리스트 SELECT 메서드
	List<AdApplyVo> selectAdApplyList();
	// 광고 신청, 광고이미지 JOIN SELECT 메서드
	List<AdApplyVo> selectAdApplyAndAdImageByAdApplyCode(String adApplyCode);
}
