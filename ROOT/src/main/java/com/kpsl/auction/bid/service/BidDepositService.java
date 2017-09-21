package com.kpsl.auction.bid.service;

import org.springframework.transaction.annotation.Transactional;

import com.kpsl.auction.bid.vo.BidDepositVo;
import com.kpsl.auction.user.vo.UserDetailVo;
@Transactional
public interface BidDepositService {

	/**보증금 insert**/
	int setBidDeposit(BidDepositVo BidDepositVo);
	/**입찰버튼 클릭시 보증금 차감 인터페이스**/
	int modifyUserCashWithdraw(BidDepositVo BidDepositVo);
	/**보증금 차감 전 캐쉬 잔액 표시**/
	UserDetailVo getTotalCash(String userId);
	
}
