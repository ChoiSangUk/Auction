package com.kpsl.auction.bid.service;

import org.springframework.transaction.annotation.Transactional;

import com.kpsl.auction.bid.vo.BidDepositVo;
@Transactional
public interface BidDepositService {

 /**보증금 insert**/
	int setBidDeposit(BidDepositVo BidDepositVo);
}
