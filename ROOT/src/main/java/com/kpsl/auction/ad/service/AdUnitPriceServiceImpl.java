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
			
		return adUnitPriceDao.selectAdUnitPriceList();
	}

	@Override
	public AdUnitPriceVo getAdUnitPriceByAdUnitPriceCode(String adUnitPriceCode) {
		log.info(adUnitPriceDao.selectAdUnitPriceByAdUnitPriceCode(adUnitPriceCode));
		return adUnitPriceDao.selectAdUnitPriceByAdUnitPriceCode(adUnitPriceCode);
	}

	@Override
	public int modifyAdUnitPrice(AdUnitPriceVo adUnitPriceVo) {

		return adUnitPriceDao.updateAdUnitPrice(adUnitPriceVo);
	}
}