package com.kpsl.auction.auctiongoods.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

import org.apache.log4j.Logger;
import com.kpsl.auction.auctiongoods.vo.AuctionGoodsVo;

@Repository
public class AuctionGoodsDaoImpl implements AuctionGoodsDao {
	Logger log = Logger.getLogger(this.getClass());
	final String NS = "com.kpsl.auction.auctiongoods.service.AuctionGoodsMapper.";
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public AuctionGoodsVo selectAuctionGoods() {
		// TODO Auto-generated method stub
		log.info("selectAdUnitPriceList 확인");
		
		return sqlSessionTemplate.selectOne(NS+"selectAuctionGoods");
	}
	
	//물품 등록
	@Override
	public int insertAuctionGoods(AuctionGoodsVo auctionGoodsVo) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert(NS+"insertAuctionGoods", auctionGoodsVo);
	}
	
	//등록품목 리스트 
	@Override
	public List<AuctionGoodsVo> selectAuctionGoodss() {
		log.info("goodss !! list DAO쪽 메서드");
		return sqlSessionTemplate.selectList(NS+"selectAuctionGoodss");
	}
	
	

}
