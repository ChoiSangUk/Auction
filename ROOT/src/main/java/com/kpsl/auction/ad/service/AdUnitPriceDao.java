package com.kpsl.auction.ad.service;

import java.util.List;

import com.kpsl.auction.ad.vo.AdUnitPriceVo;

public interface AdUnitPriceDao {
	// 광고단가 테이블 전체 조회를 위한 SELECT쿼리문 호출 인터페이스
	List<AdUnitPriceVo> selectAdUnitPriceList();
	// 광고단가 테이블 광고상태가 on SELECT쿼리문 호출 인터페이스
	List<AdUnitPriceVo> selectAdUnitPriceListByAdUnitPriceState();
	// 광고단가 테이블 업데이트를 위한 SELECT쿼리문 호출 인터페이스
	AdUnitPriceVo selectAdUnitPriceByAdUnitPriceCode(String adUnitPriceCode);
	// 광고단가 테이블 업데이트를 위한 UPDATE쿼리문 호출 인터페이스
	int updateAdUnitPrice(AdUnitPriceVo adUnitPriceVo); 
	
}
