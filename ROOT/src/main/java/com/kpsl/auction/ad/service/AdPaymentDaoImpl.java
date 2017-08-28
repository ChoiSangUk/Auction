package com.kpsl.auction.ad.service;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kpsl.auction.ad.vo.AdPaymentVo;

@Repository
public class AdPaymentDaoImpl implements AdPaymentDao {
	
	Logger log = Logger.getLogger(this.getClass());
	final String AdPaymentMapperNS = "com.kpsl.auction.ad.service.AdPaymentMapper.";
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public int insertAdPayment(AdPaymentVo adPaymentVo) {
		
		log.info("insertAdPayment 호출 확인");
		
		return sqlSessionTemplate.insert(AdPaymentMapperNS+"insertAdPayment", adPaymentVo);
	}

}
