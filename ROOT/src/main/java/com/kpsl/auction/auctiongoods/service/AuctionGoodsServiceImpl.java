package com.kpsl.auction.auctiongoods.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.kpsl.auction.auctiongoods.vo.AuctionGoodsVo;

public class AuctionGoodsServiceImpl implements AuctionGoodsService {
	@Autowired
	AuctionGoodsDao auctionGoodsDao;
	@Override
	public AuctionGoodsVo getAuctionGoods() {
		// TODO Auto-generated method stub
		return auctionGoodsDao.selectAuctionGoods();
	}
}
