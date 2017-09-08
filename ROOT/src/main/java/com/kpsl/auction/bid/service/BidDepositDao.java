package com.kpsl.auction.bid.service;

import com.kpsl.auction.bid.vo.BidDepositVo;

public interface BidDepositDao {

	/**보증금 insert 하는  인터페이스**/
	int insertBidDeposit(BidDepositVo BidDepositVo);
}
