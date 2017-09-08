package com.kpsl.auction.bid.service;

import java.util.List;

import org.springframework.ui.Model;

import com.kpsl.auction.bid.vo.BidVo;
import com.kpsl.auction.user.vo.UserDetailVo;

public interface BidDao{

	/**입찰자 리스트 조회 **/
	List<BidVo> selectBidList();
	/**품목별 입찰자 리스트 조회**/
	List<BidVo> goodsSelectBidList(BidVo bidvo);
	/**개인 물품 입찰 리스트**/
	List<BidVo> userSelectGoodsBidsList(BidVo bidvo);
	/**입찰 버튼 클릭 시 insert  **/
	int instertBidPrice(BidVo bidvo);
   /**보증금 차감 **/
	int updateUserCashWithdraw(UserDetailVo userDetailVo);

}
