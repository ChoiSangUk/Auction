package com.kpsl.auction.bid.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kpsl.auction.bid.vo.BidVo;

@Repository
public class BidDaolmpl implements BidDao {
	Logger log = Logger.getLogger(this.getClass());
	
	final String NS = "com.kpsl.auction.bid.service.BidMapper.";
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	@Override
	public List<BidVo> selectBidList(){
		log.info("selectBidList 확인");
		log.debug(sessionTemplate.selectList(NS+"selectBidList"));
		return sessionTemplate.selectList(NS+"selectBidList");
	}
}
