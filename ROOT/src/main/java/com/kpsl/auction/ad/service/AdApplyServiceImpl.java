package com.kpsl.auction.ad.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kpsl.auction.auctiongoods.vo.AuctionGoodsVo;

@Service
public class AdApplyServiceImpl implements AdApplyService {
	Logger log = Logger.getLogger(this.getClass());
	@Autowired private AdApplyDao adApplyDao;
	
	@Override
	public List<AuctionGoodsVo> getAuctionGoodsListByUserId(String userId) {
		log.info(userId+"확인");
		log.info("getAuctionGoodsListByUserId 호출 확인");
		return adApplyDao.selectAuctionGoodsListForAdApply(userId);
	}
}
