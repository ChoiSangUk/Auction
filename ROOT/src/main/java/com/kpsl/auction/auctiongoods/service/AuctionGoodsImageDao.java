package com.kpsl.auction.auctiongoods.service;

import com.kpsl.auction.auctiongoods.vo.AuctionGoodsImageVo;

public interface AuctionGoodsImageDao {
	final String NS = "com.kpsl.auction.auctiongoods.service.AuctionGoodsImageMapper.";
	public int insertAuctionGoodsImage(AuctionGoodsImageVo auctionGoodsImageVo);
}
