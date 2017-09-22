package com.kpsl.auction.bid.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.kpsl.auction.bid.vo.BidVo;
import com.kpsl.auction.bid.vo.BidVoANDAucntionGoodsVo;
import com.kpsl.auction.user.vo.UserDetailVo;

@Transactional
public interface BidService {
	
	/**입찰자 리스트 인터페이스 **/
	List<BidVo> getBidList();
	/**물품별 입찰자 리스트 인터페이스**/
	List<BidVo> getGoodsBidList(BidVo bidvo);
	/**개인 입찰 리스트**/
	List<BidVoANDAucntionGoodsVo> getUserGoodsBidsList(BidVoANDAucntionGoodsVo bidvoandaucntiongoodsvo);
	/**입찰버튼 클릭시 인터페이스**/
	int setBidPrice(BidVo bidvo);
	/**최고입찰금액**/
	public BidVo getBidHighBidPrice(String auctionGoodsCode);
	/**중복확인**/
	BidVo getOverlapUser(BidVo bidvo);
	/**재입찰시 입찰금액 수정**/
	BidVo modifyBidPrcie(BidVo bidvo);
	/**개인 입찰 갯수 **/
	BidVo getBidCount(BidVo bidvo);
	/**입찰 수 증가**/
	int updateGoodsBidHits(String auctionGoodsCode);
}

