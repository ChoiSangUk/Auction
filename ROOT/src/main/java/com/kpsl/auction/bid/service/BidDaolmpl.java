package com.kpsl.auction.bid.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.kpsl.auction.bid.vo.BidVo;

@Repository
public class BidDaolmpl implements BidDao {
	Logger log = Logger.getLogger(this.getClass());
	
	final String NS = "com.kpsl.auction.bid.service.BidMapper.";
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	//입찰자 리스트
	@Override
	public List<BidVo> selectBidList(){
		log.info("BidDao selectBidList 확인");
		return sessionTemplate.selectList(NS+"selectBidList");
	}
	//물품별입찰자 리스트
	@Override
	public List<BidVo> goodsSelectBidList(BidVo bidvo){
		//log.info(auctionGoodsCode +" --> BidDao 물품코드 들어오는 것인가.?");
		log.info("BidDao goodsselectBidList 확인");
		return sessionTemplate.selectList(NS+"selectBidList",bidvo);
	}
	//입찰하기
	@Override
	public int instertBidPrice(BidVo bidvo) {
		log.info("BidDao insertBidPrice 확인");
		/*log.debug(sessionTemplate.insert(NS+"insertBidPrice" , bidvo));*/
		return sessionTemplate.insert(NS+"insertBidPrice", bidvo);
	
	}
	
}
