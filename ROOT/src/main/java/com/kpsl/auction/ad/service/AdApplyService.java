package com.kpsl.auction.ad.service;

import java.util.List;

import com.kpsl.auction.ad.vo.AdApplyAndAdImageAndAdUnitPriceAndAuctionGoodsVo;
import com.kpsl.auction.ad.vo.AdApplyVo;
import com.kpsl.auction.ad.vo.AdImageVo;
import com.kpsl.auction.auctiongoods.vo.AuctionGoodsVo;

public interface AdApplyService {
	
	// 회원이 등록한 삼품리스트를 보기 위한 메서드
	List<AuctionGoodsVo> getAuctionGoodsListByUserId(String userId);
	// 광고신청 트랜잭션 처리를 위한 메서드
	void adApplyTransaction(AdApplyVo adApplyVo, AdImageVo adImageVo);
	// 광고신청DAO를 호출하기 위한 메서드
	int addAdApply(AdApplyVo adApplyVo);
	// 광고이미지 등록DAO를 호출하기 위한 메서드
	int addAdImage(AdImageVo adImageVo);
	// 광고신청 리스트DAO를 호출하기 위한 메서드
	List<AdApplyVo> getAdApplyList(AdApplyVo adApplyVo);
	// 광고신청 리스트조건검색 DAO를 호출하기 위한 메서드
	List<AdApplyVo> getAdApplyListBySv(AdApplyVo adApplyVo,String sk, String sv, String sDate, String eDate);
	// 광고신청,광고이미지,광고단가 조인DAO를 호출하기 위한 메서드
	AdApplyAndAdImageAndAdUnitPriceAndAuctionGoodsVo getAdApplyDetail(String adApplyCode);
	// 광고신청업데이트 DAO를 호출하기 위한 메서드
	int modifyAdApply(AdApplyVo adApplyVo);
	// 광고이미지업데이트 DAO를 호출하기 위한 메서드
	int modifyAdImage(AdImageVo adImageVo);
	// 나의광고신청리스트 DAO를 호출하기 위한 메서드
	List<AdApplyAndAdImageAndAdUnitPriceAndAuctionGoodsVo> getMyAdApplyList(String userId);
}
