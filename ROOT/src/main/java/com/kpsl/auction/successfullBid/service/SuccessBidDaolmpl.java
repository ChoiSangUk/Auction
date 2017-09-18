package com.kpsl.auction.successfullBid.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kpsl.auction.successfullBid.vo.SuccessBidAndBidAndAuctionGoodsVo;
import com.kpsl.auction.successfullBid.vo.SuccessBidVo;

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

	@Override
	public int insertSuccessfulBid(SuccessBidVo successBidVo) {
		
		log.info("insertSuccessfulBid");
		
		return sqlSessionTemplate.insert(SuccessfullBidMapperNS+"insertSuccessfulBid",successBidVo);
	}

	@Override
	public int updateAuctionGoodsState(String auctionGoodsCode) {
		
		log.info("updateAuctionGoodsState 호출 확인");
		
		return sqlSessionTemplate.update(SuccessfullBidMapperNS+"updateAuctionGoodsState", auctionGoodsCode);
	}

}
