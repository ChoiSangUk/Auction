package com.kpsl.auction.ad.service;

import java.util.List;

import com.kpsl.auction.auctiongoods.vo.AuctionGoodsVo;

public interface AdApplyDao {

	List<AuctionGoodsVo> selectAuctionGoodsListForAdApply(String userId);
}
