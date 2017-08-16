package com.kpsl.auction.ad.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kpsl.auction.ad.vo.AdUnitPriceVo;

@Service
public class AdUnitPriceServiceImpl implements AdUnitPriceService {
	@Autowired private AdUnitPriceDao adUnitPriceDao;
	
	@Override
	public List<AdUnitPriceVo> getAdUnitPirceList() {
			
		return adUnitPriceDao.selectAdUnitPriceList();
	}

	@Override
	public AdUnitPriceVo getAdUnitPriceByAdUnitPriceCode(String adUnitPriceCode) {

		return adUnitPriceDao.selectAdUnitPriceByAdUnitPriceCode(adUnitPriceCode);
	}
}