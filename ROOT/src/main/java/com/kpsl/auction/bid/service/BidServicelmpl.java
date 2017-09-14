package com.kpsl.auction.bid.service;

import java.util.List;
import org.apache.log4j.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.kpsl.auction.bid.vo.BidVo;


@Service
public class BidServicelmpl implements BidService {
	Logger log = Logger.getLogger(this.getClass());
	@Autowired private BidDao bidDao;
	//전체입찰자 리스트
	@Override
	public List<BidVo> getBidList(){
	
		return bidDao.selectBidList();
	}
	//물품별 입찰자 리스트 
	@Override
	public List<BidVo> getGoodsBidList(BidVo bidvo) {
		//log.info(auctionGoodsCode+ "<<==BidService 에 들어오는 물품코드의 값이 있는가?");
		log.info("BidServicelmpl 부분의 물품별 입찰자 리스트 메서드");
		return bidDao.selectGoodsBidList(bidvo);
	}
	//입찰하기
	@Override
	public int setBidPrice(BidVo bidvo) {
		log.info("bidServicelmpl의 setBidPrice 메서드 ");
		return bidDao.instertBidPrice(bidvo);
	}
	//개인 입찰 리스트
	@Override
	public List<BidVo> getUserGoodsBidsList(BidVo bidvo) {
		log.info("BidServicelmpl의 userSelectGoodsBidsList 메서드");
		return bidDao.selectUserGoodsBidsList(bidvo);
	}
	//최고입찰금액
	@Override
	public BidVo getBidHighBidPrice(String auctionGoodsCode) {
		log.info("BidServicelmpl의 bidSelectHighBidPrice 메서드");
		return bidDao.selectBidHighBidPrice(auctionGoodsCode);
	}

}
