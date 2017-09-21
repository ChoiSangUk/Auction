package com.kpsl.auction.ad.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kpsl.auction.ad.vo.AdUnitPriceVo;

@Service
public class AdUnitPriceServiceImpl implements AdUnitPriceService {
	Logger log = Logger.getLogger(this.getClass());	
	@Autowired private AdUnitPriceDao adUnitPriceDao;
	
	@Override
	public List<AdUnitPriceVo> getAdUnitPirceList() {
			
		log.info("getAdUnitPirceList 호출 확인");
		
		return adUnitPriceDao.selectAdUnitPriceList();
	}

	@Override
	public AdUnitPriceVo getAdUnitPriceByAdUnitPriceCode(String adUnitPriceCode) {
		
		log.info("getAdUnitPriceByAdUnitPriceCode 호출 확인");
		
		return adUnitPriceDao.selectAdUnitPriceByAdUnitPriceCode(adUnitPriceCode);
	}

	@Override
	public int modifyAdUnitPrice(AdUnitPriceVo adUnitPriceVo) {
		
		log.info("modifyAdUnitPrice 호출 확인");
		
		return adUnitPriceDao.updateAdUnitPrice(adUnitPriceVo);
	}

	@Override
	public List<AdUnitPriceVo> getAdUnitPirceListByAdUnitPriceState() {

		log.info("getAdUnitPirceListByAdUnitPriceState 호출 확인");
		
		return adUnitPriceDao.selectAdUnitPriceListByAdUnitPriceState();
	}
}