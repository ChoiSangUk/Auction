package com.kpsl.auction.auctiongoods.service;

import java.util.List;
import java.util.Map;

import com.kpsl.auction.auctiongoods.vo.AuctionGoodsAndFirstImageVo;
import com.kpsl.auction.auctiongoods.vo.AuctionGoodsVo;


public interface AuctionGoodsDao {
	
	int insertAuctionGoods(AuctionGoodsVo auctionGoodsVo);
	
	//품목 리스트
	List<AuctionGoodsVo> selectAuctionGoodss();
	
	//모든 물픔 리스트
	List<AuctionGoodsAndFirstImageVo> selectAllAuctionGoods();
	
	//단일 물품
	public AuctionGoodsVo selectAuctionGoods(String auctionGoodsCode);
	
	//물품 수정
	int updateAuctionGoods(AuctionGoodsVo auctionGoodsVo);
	
	//조회수 증가
	 int selectIncreaseHits(String auctionGoodsCode);
	 int increaseHits(Map map);
	
}
