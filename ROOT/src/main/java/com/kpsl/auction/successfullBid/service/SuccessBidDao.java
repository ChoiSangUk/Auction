package com.kpsl.auction.successfullBid.service;

import java.util.List;

import com.kpsl.auction.successfullBid.vo.SuccessBidAndBidAndAuctionGoodsVo;
import com.kpsl.auction.successfullBid.vo.SuccessBidVo;
import com.kpsl.auction.successfullBid.vo.SuccessfullBidVoANDauctionGoodsVo;
import com.kpsl.auction.successfullBid.vo.SuccessfullBidVoANDauctionGoodsVoANDgoodsPaymentVo;

public interface SuccessBidDao {
	// 판매중인물품중 입찰최고가 SELECT 쿼리
	List<SuccessBidAndBidAndAuctionGoodsVo> selectMaxBid();
	// 낙찰테이블 INSERT 쿼리
	int insertSuccessfulBid(SuccessBidVo successBidVo);
	// 경매물품테이블 등록상태 UPDATE 쿼리
	int updateAuctionGoodsState(String auctionGoodsCode);
	//개인 낙찰 상태 리스트 
	List<SuccessfullBidVoANDauctionGoodsVo> selectSuccessbidList(SuccessfullBidVoANDauctionGoodsVoANDgoodsPaymentVo successfullbidvoANDauctiongoodsVoANDgoodspaymentvo);
	
	SuccessfullBidVoANDauctionGoodsVo selectSuccessbid(SuccessfullBidVoANDauctionGoodsVo successfullbidVoANDauctiongoodsvo);
	
	
}
