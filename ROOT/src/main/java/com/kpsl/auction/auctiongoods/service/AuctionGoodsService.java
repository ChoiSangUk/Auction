package com.kpsl.auction.auctiongoods.service;

import java.util.List;

import com.kpsl.auction.auctiongoods.vo.AuctionGoodsVo;

public interface AuctionGoodsService {
	public AuctionGoodsVo getAuctionGoods();
	
	//등록품목 리트스
	List<AuctionGoodsVo> getAuctionGoodss();
}
