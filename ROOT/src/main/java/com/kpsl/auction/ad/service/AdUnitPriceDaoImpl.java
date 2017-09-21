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
	final String AdUnitPriceMapperNS = "com.kpsl.auction.ad.service.AdUnitPriceMapper.";
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	/** 광고단가 리스트를 조회하는 메서드 */
	public List<AdUnitPriceVo> selectAdUnitPriceList() {
		
		log.info("selectAdUnitPriceList 호출 확인");
		
		return sqlSessionTemplate.selectList(AdUnitPriceMapperNS+"selectAdUnitPriceList");
	}

	@Override
	/** 광고단가 업데이트를 위한 조회 */
	public AdUnitPriceVo selectAdUnitPriceByAdUnitPriceCode(String adUnitPriceCode) {
		
		log.info("selectAdUnitPriceByAdUnitPriceCode 호출 확인");
		
		return sqlSessionTemplate.selectOne(AdUnitPriceMapperNS+"selectAdUnitPriceByAdUnitPirceCode",adUnitPriceCode);
	}

	@Override
	public int updateAdUnitPrice(AdUnitPriceVo adUnitPriceVo) {
		
		log.info("updateAdUnitPrice 호출 확인");
		
		return sqlSessionTemplate.update(AdUnitPriceMapperNS+"updateAdUnitPrice", adUnitPriceVo);
	}

	@Override
	public List<AdUnitPriceVo> selectAdUnitPriceListByAdUnitPriceState() {

		log.info("selectAdUnitPriceListByAdUnitPriceState 호출 확인");
		
		return sqlSessionTemplate.selectList(AdUnitPriceMapperNS+"selectAdUnitPriceListByAdUnitPriceState");
	}
	
}
