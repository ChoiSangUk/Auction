package com.kpsl.auction.bid.service;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kpsl.auction.bid.vo.BidDepositVo;
@Service
public class BidDepositServicelmpl implements BidDepositService {
	Logger log = Logger.getLogger(this.getClass());
	@Autowired private BidDepositDao bidDepositDao;
	//보증금 insert
	@Override
	public int setBidDeposit(BidDepositVo BidDepositVo) {
		log.info("BidServicelmpl 부분의 setBidDeposit 메서드");
		return bidDepositDao.insertBidDeposit(BidDepositVo);
	}

}
