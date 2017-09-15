package com.kpsl.auction.successfullBid.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kpsl.auction.successfullBid.vo.SuccessBidAndBidAndAuctionGoodsVo;

@Repository
public class SuccessBidDaolmpl implements SuccessBidDao {

	Logger log = Logger.getLogger(this.getClass());
	final String SuccessfullBidMapperNS = "com.kpsl.auction.successfullBid.service.SuccessfullBidMapper.";
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<SuccessBidAndBidAndAuctionGoodsVo> selectMaxBid() {
		
		log.info("selectMaxBid");
		
		return sqlSessionTemplate.selectList(SuccessfullBidMapperNS+"selectMaxBid");
	}

}
