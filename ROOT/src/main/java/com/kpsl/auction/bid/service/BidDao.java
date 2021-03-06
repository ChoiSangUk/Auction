package com.kpsl.auction.bid.service;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.kpsl.auction.bid.vo.BidVo;
import com.kpsl.auction.bid.vo.BidVoANDAucntionGoodsVo;
import com.kpsl.auction.user.vo.UserDetailVo;

public interface BidDao{

	/**입찰자 리스트 조회 **/
	List<BidVo> selectBidList();
	/**품목별 입찰자 리스트 조회**/
	List<BidVo> selectGoodsBidList(BidVo bidvo);
	/**개인 물품 입찰 리스트**/
	List<BidVoANDAucntionGoodsVo> selectUserGoodsBidsList(BidVoANDAucntionGoodsVo bidvoandaucntiongoodsvo);
	/**입찰 버튼 클릭 시 insert  **/
	int instertBidPrice(BidVo bidvo);
    /**최고입찰금액**/
	public BidVo selectBidHighBidPrice(String auctionGoodsCode);
	/**중복확인**/
	BidVo selectOverlapUser(BidVo bidvo); 
	/**재입찰시 입찰금액 수정**/
	BidVo updateBidPrice(BidVo bidvo);
	/**개인 입찰 갯수 **/
	BidVo slectBidcount(BidVo bidvo);
	/**경매물품 하나 당 총 입찰 갯수 **/
	int selectGoodsBidHits(String auctionGoodsCode);
	/**입찰 수 증가**/
	int updateGoodsBidHit(Map map);
}
