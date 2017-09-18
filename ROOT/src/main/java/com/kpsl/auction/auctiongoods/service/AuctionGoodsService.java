package com.kpsl.auction.auctiongoods.service;

import java.util.List;
import java.util.Map;

import com.kpsl.auction.auctiongoods.vo.AuctionGoodsAndFirstImageVo;
import com.kpsl.auction.auctiongoods.vo.AuctionGoodsImageVo;
import com.kpsl.auction.auctiongoods.vo.AuctionGoodsVo;
import com.kpsl.auction.saleslog.vo.SalesLogVo;

public interface AuctionGoodsService {
	//id의 판매물품목록
	public List<AuctionGoodsAndFirstImageVo> getAllAuctionGoodsByUserId(String userId);
	//단일 물품
	public AuctionGoodsVo getAuctionGoods(String auctionGoodsCode);
	
	//등록품목 리트스
	public List<AuctionGoodsVo> getAuctionGoodss();
	
	//물품등록
	public int addAuctionGoods(AuctionGoodsVo auctionGoodsVo, List<String> imgList, int userTotalCash);
	
	//물품 리스트
	public List<AuctionGoodsAndFirstImageVo> getAllAuctionGoods(Map map);
	
	//물품 이미지 리스트
	public List<AuctionGoodsImageVo> getAllAuctionGoodsImages(String auctionGoodsCode);
	
	//물품 수정
	public int updateAuctionGoods(AuctionGoodsVo auctionGoodsVo, List<String> imgList);
	
	//조회수 증가
	public int increaseHits(String auctionGoodsCode);
	
	//유저 캐쉬 가져오기
	public int getUserCash(String userId);
	
	//매입매출 내역 등록
	int addSalesLog(SalesLogVo salesLogVo);
	
	//정렬된 물품 
	public List<AuctionGoodsAndFirstImageVo> getAllAuctionGoodsOrderBy(AuctionGoodsVo auctionGoodsVo);
	
	//물품 정렬
	public List<AuctionGoodsAndFirstImageVo> getAllAuctionGoodsSortDesc(Map map);
	public List<AuctionGoodsAndFirstImageVo> getAllAuctionGoodsSortAsc(Map map);
}
