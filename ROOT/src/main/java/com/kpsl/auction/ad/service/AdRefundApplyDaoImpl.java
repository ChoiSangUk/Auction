package com.kpsl.auction.ad.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kpsl.auction.ad.vo.AdApplyAndAdImageAndAdUnitPriceAndAuctionGoodsVo;
import com.kpsl.auction.ad.vo.AdRefundApplyVo;

@Repository
public class AdRefundApplyDaoImpl implements AdRefundApplyDao {

	Logger log = Logger.getLogger(this.getClass());
	final String AdRefundApplyMapperNS = "com.kpsl.auction.ad.service.AdRefundApplyMapper.";
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public AdApplyAndAdImageAndAdUnitPriceAndAuctionGoodsVo selectAdRefundListByAdPaymentCode(String adPaymentCode) {
		
		log.info("selectAdRefundListByAdPaymentCode 호출 확인");
		
		return sqlSessionTemplate.selectOne(AdRefundApplyMapperNS+"selectAdRefundListByAdPaymentCode", adPaymentCode);
	}

	@Override
	public int insertAdRefundApply(AdRefundApplyVo adRefundApplyVo) {
		
		log.info("insertAdRefundApply 호출 확인");
		
		return sqlSessionTemplate.insert(AdRefundApplyMapperNS+"insertAdRefundApply", adRefundApplyVo);
	}

	@Override
	public List<AdApplyAndAdImageAndAdUnitPriceAndAuctionGoodsVo> selectAdRefundList() {

		log.info("selectAdRefundList 호출 확인");
		
		return sqlSessionTemplate.selectList(AdRefundApplyMapperNS+"selectAdRefundList");
	}

	@Override
	public AdApplyAndAdImageAndAdUnitPriceAndAuctionGoodsVo selectAdRefundDetailList(AdApplyAndAdImageAndAdUnitPriceAndAuctionGoodsVo adVo) {
		
		log.info("selectAdRefundDetailList 호출 확인");
		
		return sqlSessionTemplate.selectOne(AdRefundApplyMapperNS+"selectAdRefundList", adVo);
	}

}
