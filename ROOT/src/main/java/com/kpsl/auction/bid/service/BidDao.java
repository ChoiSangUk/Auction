package com.kpsl.auction.bid.service;

import java.util.List;

import org.springframework.ui.Model;

import com.kpsl.auction.bid.vo.BidVo;
import com.kpsl.auction.user.vo.UserDetailVo;

public interface BidDao{

	/**입찰자 리스트 조회 **/
	List<BidVo> selectBidList();
	/**품목별 입찰자 리스트 조회**/
	List<BidVo> selectGoodsBidList(BidVo bidvo);
	/**개인 물품 입찰 리스트**/
	List<BidVo> selectUserGoodsBidsList(BidVo bidvo);
	/**입찰 버튼 클릭 시 insert  **/
	int instertBidPrice(BidVo bidvo);
    /**최고입찰금액**/
	public BidVo selectBidHighBidPrice(String auctionGoodsCode);
	/**중복확인**/
	BidVo selectOverlapUser(BidVo bidvo); 
	/**재입찰시 입찰금액 수정**/
	int updateBidPrice(BidVo bidvo);
}
