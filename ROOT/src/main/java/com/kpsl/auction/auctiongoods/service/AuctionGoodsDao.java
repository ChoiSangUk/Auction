package com.kpsl.auction.auctiongoods.service;

import java.util.List;
import java.util.Map;

import com.kpsl.auction.auctiongoods.vo.AuctionGoodsAndFirstImageVo;
import com.kpsl.auction.auctiongoods.vo.AuctionGoodsVo;
import com.kpsl.auction.saleslog.vo.SalesLogVo;


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
	 
	 //물품등록 보증금
	 int addDepositPrice(Map map);
	 
	 //보증금 가격 가져오기
	int getDepositPrice(String auctionGoodsCode);
	
	//유저 캐쉬 가져오기
	int selectUserCash(String userId);
	
	//매 일 0시마다 상태 확인하여 변경
	int updateAuctionGoodsState();
	int updateAuctionGoodsStateEnd();
	
	
}
