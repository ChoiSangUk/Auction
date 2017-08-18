package com.kpsl.auction.ad.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kpsl.auction.auctiongoods.vo.AuctionGoodsVo;

@Repository
public class AdApplyDaoImpl implements AdApplyDao {
	Logger log = Logger.getLogger(this.getClass());
	final String AGNS = "com.kpsl.auction.auctiongoods.service.AuctionGoodsMapper.";
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<AuctionGoodsVo> selectAuctionGoodsListForAdApply(String userId) {
		log.info("selectAuctionGoodsListForAdApply 호출 확인");
		log.info(userId+"<---AdApplyDao 아이디확인");
		log.info(sqlSessionTemplate.selectList(AGNS+"selectAuctionGoodsListByUserId",userId));
		return sqlSessionTemplate.selectList(AGNS+"selectAuctionGoodsListByUserId",userId);
	}
}
