package com.kpsl.auction.successfullBid.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kpsl.auction.successfullBid.vo.SuccessBidAndBidAndAuctionGoodsVo;

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

	
	
}
