package com.kpsl.auction.successfullBid.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kpsl.auction.successfullBid.vo.SuccessBidAndBidAndAuctionGoodsVo;
import com.kpsl.auction.successfullBid.vo.SuccessBidVo;
import com.kpsl.auction.successfullBid.vo.SuccessfullBidVoANDauctionGoodsVo;
import com.kpsl.auction.successfullBid.vo.SuccessfullBidVoANDauctionGoodsVoANDgoodsPaymentVo;

@Service
@Transactional
public class SuccessfullBidServicelmpl implements SuccessfullBidService {
	
	Logger log = Logger.getLogger(this.getClass());
	@Autowired private SuccessBidDao successBidDao;
	@Override
	public List<SuccessBidAndBidAndAuctionGoodsVo> getMaxBid() {
		
		log.info("getMaxBid 호출 확인");
		
		return successBidDao.selectMaxBid();
	}
	@Override
	public int addSuccessfulBid(SuccessBidVo successBidVo) {
		
		log.info("addSuccessfulBid");
		
		return successBidDao.insertSuccessfulBid(successBidVo);
	}
	@Override
	public int modifyAuctionGoodsState(String auctionGoodsCode) {
		
		log.info("modifyAuctionGoodsState 호출 확인");
		
		return successBidDao.updateAuctionGoodsState(auctionGoodsCode);
	}
	//개인 낙찰 상태 리스트
	@Override
	public List<SuccessfullBidVoANDauctionGoodsVo> getSuccessBidList(
			SuccessfullBidVoANDauctionGoodsVoANDgoodsPaymentVo successfullbidvoANDauctiongoodsVoANDgoodspaymentvo) {
		log.info("SuccessfullBidServicelmpl 부분 getSuccessBidList 메서드 확인");
		return successBidDao.selectSuccessbidList(successfullbidvoANDauctiongoodsVoANDgoodspaymentvo);
	}
	@Override
	public SuccessfullBidVoANDauctionGoodsVo getSuccessBid(SuccessfullBidVoANDauctionGoodsVo successfullbidVoANDauctiongoodsvo) {
		log.info("SuccessfullBidServicelmpl 부분 getSuccessBid 메서드 확인");
		return successBidDao.selectSuccessbid(successfullbidVoANDauctiongoodsvo);
	}
}
