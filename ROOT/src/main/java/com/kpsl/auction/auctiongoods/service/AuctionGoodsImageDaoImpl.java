package com.kpsl.auction.auctiongoods.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kpsl.auction.auctiongoods.vo.AuctionGoodsImageVo;

@Repository
public class AuctionGoodsImageDaoImpl implements AuctionGoodsImageDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	final String NS = "com.kpsl.auction.auctiongoods.service.AuctionGoodsImageMapper.";
	
	@Override
	public int insertAuctionGoodsImage(AuctionGoodsImageVo auctionGoodsImageVo) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert(NS+"insertAuctionGoodsImage", auctionGoodsImageVo);
	}

	@Override
	public List<AuctionGoodsImageVo> selectAllAuctionGoodsImages(String auctionGoodsCode) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList(NS+"selectAllAuctionGoodsImages", auctionGoodsCode);
	}

}
