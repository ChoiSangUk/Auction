package com.kpsl.auction.goodspayment.service;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kpsl.auction.goodspayment.vo.GoodsPaymentVo;
import com.kpsl.auction.successfullBid.vo.SuccessBidVo;

@Repository
public class GoodsPaymentDaolmpl implements GoodsPaymentDao {
	final String NS = "com.kpsl.auction.goodspayment.service.GoodsPaymentMapper."; 
	Logger log = Logger.getLogger(this.getClass());
	@Autowired SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public int insertGoodsPayment(GoodsPaymentVo goodsPaymentVo) {
		
		log.info("insertGoodsPayment 호출 확인");
		
		return sqlSessionTemplate.insert(NS+"insertGoodsPayment", goodsPaymentVo);
	}

	@Override
	public int updateSellerTotalcash(SuccessBidVo successBidVo) {
		
		log.info("updateSellerTotalcash 호출 확인");
		
		return sqlSessionTemplate.update(NS+"updateSellerTotalcash", successBidVo);
	}

	@Override
	public int updateBuyerTotalcash(SuccessBidVo successBidVo) {
		
		log.info("updateBuyerTotalcash 호출 확인");
		
		return sqlSessionTemplate.update(NS+"updatebuyerTotalcash", successBidVo);
	}

}
