package com.kpsl.auction.bid.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.kpsl.auction.bid.vo.BidVo;

@Transactional
public interface BidService {

		/**입찰자 리스트 인터페이스 **/
	List<BidVo> getBidList();
}
