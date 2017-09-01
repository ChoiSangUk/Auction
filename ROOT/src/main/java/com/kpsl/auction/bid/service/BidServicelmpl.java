package com.kpsl.auction.bid.service;

import java.util.List;
import org.apache.log4j.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

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
	public List<BidVo> goodsSelectBidList(BidVo bidvo) {
		//log.info(auctionGoodsCode+ "<<==BidService 에 들어오는 물품코드의 값이 있는가?");
		log.info("BidServicelmpl 부분의 물품별 입찰자 리스트 method");
		return bidDao.goodsSelectBidList(bidvo);
	}
	//입찰하기
	@Override
	public int setBidPrice(BidVo bidvo) {
		log.info("bidServicelmpl의 setBidPrice method ");
		return bidDao.instertBidPrice(bidvo);
	}
}
