package com.kpsl.auction.ad.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.kpsl.auction.ad.vo.AdUnitPriceVo;

@Transactional
public interface AdUnitPriceService {
	
	/** 광고단가리스트 인터페이스 */
	List<AdUnitPriceVo> getAdUnitPirceList();
	/** 광고업데이트를 위한 인터페이스 */
	AdUnitPriceVo getAdUnitPriceByAdUnitPriceCode(String adUnitPriceCode);
	
	int modifyAdUnitPrice(AdUnitPriceVo adUnitPriceVo);
	
}
