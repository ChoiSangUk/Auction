package com.kpsl.auction.auctiongoods.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kpsl.auction.auctiongoods.vo.AuctionGoodsVo;

@Service
public class AuctionGoodsServiceImpl implements AuctionGoodsService {
	@Autowired
	private AuctionGoodsDao auctionGoodsDao;
	@Override
	public AuctionGoodsVo getAuctionGoods() {
		// TODO Auto-generated method stub
		return auctionGoodsDao.selectAuctionGoods();
	}
}
