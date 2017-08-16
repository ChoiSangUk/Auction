package com.kpsl.auction.auctiongoods.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.apache.log4j.Logger;
import com.kpsl.auction.auctiongoods.vo.AuctionGoodsVo;

@Repository
public class AuctionGoodsDaoImpl implements AuctionGoodsDao {
	Logger log = Logger.getLogger(this.getClass());
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public AuctionGoodsVo selectAuctionGoods() {
		// TODO Auto-generated method stub
		log.info("selectAdUnitPriceList 확인");
		
		return sqlSessionTemplate.selectOne("com.kpsl.auction.auctiongoods.service.AuctionGoodsMapper.selectAuctionGoods");
	}

}
