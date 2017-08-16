package com.kpsl.auction.bid.service;

import java.util.List;

import com.kpsl.auction.bid.vo.BidVo;

public interface BidDao {

	/**입찰자 리스트 조회 하는 인터페이스**/
	List<BidVo> selectBidList();
	
}
