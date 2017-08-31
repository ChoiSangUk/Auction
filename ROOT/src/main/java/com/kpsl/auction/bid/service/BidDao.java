package com.kpsl.auction.bid.service;

import java.util.List;

import org.springframework.ui.Model;

import com.kpsl.auction.bid.vo.BidVo;

public interface BidDao{

	/**입찰자 리스트 조회 하는 인터페이스**/
	List<BidVo> selectBidList();
	/**품목별 입찰자 리스트 조회 하는 인터페이스**/
	List<BidVo> goodsSelectBidList(BidVo bidvo);
	
	/**입찰 버튼 클릭 시 입찰 하는 인터페이스 **/
	int instertBidPrice(BidVo bidvo);

		
}
