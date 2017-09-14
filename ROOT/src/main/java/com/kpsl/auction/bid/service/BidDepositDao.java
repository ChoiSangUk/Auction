package com.kpsl.auction.bid.service;

import com.kpsl.auction.bid.vo.BidDepositVo;
import com.kpsl.auction.user.vo.UserDetailVo;

public interface BidDepositDao {

	/**보증금 insert 하는  인터페이스**/
	int insertBidDeposit(BidDepositVo BidDepositVo);
	/**보증금 차감 **/
	int updateUserCashWithdraw(BidDepositVo BidDepositVo);
	/**보증금 차감을 위한 캐쉬 조회**/
	UserDetailVo selectTotalCash(String userId);
	/**재입찰 **/
	BidDepositVo selectselectoverlapuserid(String auctionGoodsCode);
}
