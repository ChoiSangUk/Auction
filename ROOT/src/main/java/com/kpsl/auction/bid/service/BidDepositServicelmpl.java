package com.kpsl.auction.bid.service;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kpsl.auction.bid.vo.BidDepositVo;
import com.kpsl.auction.user.vo.UserDetailVo;
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
	//보증금 update (차감)
	@Override
	public int modifyUserCashWithdraw(BidDepositVo BidDepositVo) {
		log.info("BidDepostiServicelmpl의 modifyUserCashWithdraw 메서드");
		return bidDepositDao.updateUserCashWithdraw(BidDepositVo);
	}
	//보증금을 위한 유저 캐쉬 select
	@Override
	public UserDetailVo getTotalCash(String userId) {
		log.info("BidDepostiServicelmpl의 getTotalCash 메서드");
		return bidDepositDao.selectTotalCash(userId);
	}

}
