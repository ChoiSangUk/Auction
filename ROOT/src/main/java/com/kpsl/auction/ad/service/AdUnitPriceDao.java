package com.kpsl.auction.ad.service;

import java.util.List;

import com.kpsl.auction.ad.vo.AdUnitPriceVo;

public interface AdUnitPriceDao {
	/** 광고단가 테이블을 조회하는 인터페이스 */
	List<AdUnitPriceVo> selectAdUnitPriceList();
	
	AdUnitPriceVo selectAdUnitPriceByAdUnitPriceCode(String adUnitPriceCode);
}
