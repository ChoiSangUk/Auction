package com.kpsl.auction.auctiongoods.service;

import java.util.List;

import com.kpsl.auction.auctiongoods.vo.AuctionGoodsImageVo;

public interface AuctionGoodsImageDao {
	final String NS = "com.kpsl.auction.auctiongoods.service.AuctionGoodsImageMapper.";
	public int insertAuctionGoodsImage(AuctionGoodsImageVo auctionGoodsImageVo);
	
	public List<AuctionGoodsImageVo> selectAllAuctionGoodsImages(String auctionGoodsCode);
}
