package com.kpsl.auction.ad.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.kpsl.auction.auctiongoods.vo.AuctionGoodsVo;

@Transactional
public interface AdApplyService {
	
	// 회원이 등록한 삼품리스트를 보기 위한 메서드
	List<AuctionGoodsVo> getAuctionGoodsListByUserId(String userId);
	
	int addAdApply();
}
