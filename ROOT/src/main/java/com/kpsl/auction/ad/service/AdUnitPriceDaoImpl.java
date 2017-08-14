package com.kpsl.auction.ad.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kpsl.auction.ad.vo.AdUnitPriceVo;

@Repository
public class AdUnitPriceDaoImpl implements AdUnitPriceDao {
	Logger log = Logger.getLogger(this.getClass());
	
	final String NS = "com.kpsl.auction.ad.service.AdUnitPriceMapper.";
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	/** 광고단가 리스트를 조회하는 메서드 구현*/
	public List<AdUnitPriceVo> selectAdUnitPriceList() {
		log.info("selectAdUnitPriceList 확인");
		
		return sqlSessionTemplate.selectList(NS+"getAdUnitPriceList");
	}

}
