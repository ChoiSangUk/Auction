package com.kpsl.auction.successfullBid.service;

import java.util.List;

import com.kpsl.auction.successfullBid.vo.SuccessBidAndBidAndAuctionGoodsVo;
import com.kpsl.auction.successfullBid.vo.SuccessBidVo;

public interface SuccessfullBidService {
	
	// 입찰최고가 호출 메서드
	List<SuccessBidAndBidAndAuctionGoodsVo> getMaxBid();
	// 낙찰테이블 insert DAO 호출 메서드
	int addSuccessfulBid(SuccessBidVo successBidVo);
	// 경매물품상태 UPDATE DAO 호출 메서드
	int modifyAuctionGoodsState(String auctionGoodsCode);
}
