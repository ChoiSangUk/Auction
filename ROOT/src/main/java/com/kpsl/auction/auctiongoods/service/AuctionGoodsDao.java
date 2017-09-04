package com.kpsl.auction.auctiongoods.service;

import java.util.List;

import com.kpsl.auction.auctiongoods.vo.AuctionGoodsVo;


public interface AuctionGoodsDao {
	public AuctionGoodsVo selectAuctionGoods();
	
	int insertAuctionGoods(AuctionGoodsVo auctionGoodsVo);
	
	//품목 리스트
	List<AuctionGoodsVo> selectAuctionGoodss();
	
	
}
