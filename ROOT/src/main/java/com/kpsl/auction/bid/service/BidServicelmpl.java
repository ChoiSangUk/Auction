package com.kpsl.auction.bid.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.kpsl.auction.bid.vo.BidVo;
import com.kpsl.auction.bid.vo.BidVoANDAucntionGoodsVo;


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
	public List<BidVoANDAucntionGoodsVo> getUserGoodsBidsList(BidVoANDAucntionGoodsVo bidvoandaucntiongoodsvo) {
		log.info("BidServicelmpl의 userSelectGoodsBidsList 메서드");
		return bidDao.selectUserGoodsBidsList(bidvoandaucntiongoodsvo);
	}
	//최고입찰금액
	@Override
	public BidVo getBidHighBidPrice(String auctionGoodsCode) {
		log.info("BidServicelmpl의 bidSelectHighBidPrice 메서드");
		return bidDao.selectBidHighBidPrice(auctionGoodsCode);
	}
	//중복확인
	@Override
	public BidVo getOverlapUser(BidVo bidvo) {
		log.info("BidServicelmpl의 getOverlapUser");
		return bidDao.selectOverlapUser(bidvo);
	}
	//입찰금액 수정
	@Override
	public BidVo modifyBidPrcie(BidVo bidvo) {
		log.info("BidServicelmpl의 modifyBidPrcie");
		return bidDao.updateBidPrice(bidvo);
	}
	//입찰 갯수 
	@Override
	public BidVo getBidCount(BidVo bidvo) {
		log.info("BidServicelmpl의 getBidCount");
		return bidDao.slectBidcount(bidvo);
	}
	//입찰 될 때 마다 입찰 수 같이 증가
	@Override
	public int updateGoodsBidHits(String auctionGoodsCode) {
		log.info("updateGoodsBidHits 호출 확인");
		
		int a = bidDao.selectGoodsBidHits(auctionGoodsCode);
		a++;
		Map map = new HashMap();
		map.put("auctionGoodsBidHits", a );
		map.put("auctionGoodsCode", auctionGoodsCode);
		return bidDao.updateGoodsBidHit(map);
	}

}
