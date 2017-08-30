package com.kpsl.auction.auctiongoods.service;

import java.util.List;
import org.apache.log4j.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kpsl.auction.auctiongoods.vo.AuctionGoodsVo;

@Service
public class AuctionGoodsServiceImpl implements AuctionGoodsService {
	Logger log = Logger.getLogger(this.getClass());
	@Autowired
	private AuctionGoodsDao auctionGoodsDao;
	@Override
	public AuctionGoodsVo getAuctionGoods() {
		// TODO Auto-generated method stub
		return auctionGoodsDao.selectAuctionGoods();
	}
//등록품목 리스트
	@Override
	public List<AuctionGoodsVo> getAuctionGoodss() {
		log.info("ServiceImpl goods list 메소드");
		return auctionGoodsDao.selectAuctionGoodss();
	}
	
}
