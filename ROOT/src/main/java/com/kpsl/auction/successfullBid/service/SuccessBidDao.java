package com.kpsl.auction.successfullBid.service;

import java.util.List;

import com.kpsl.auction.successfullBid.vo.SuccessBidAndBidAndAuctionGoodsVo;

public interface SuccessBidDao {
	List<SuccessBidAndBidAndAuctionGoodsVo> selectMaxBid();
}
