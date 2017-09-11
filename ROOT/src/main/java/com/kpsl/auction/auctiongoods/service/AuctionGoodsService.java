package com.kpsl.auction.auctiongoods.service;

import java.util.List;

import com.kpsl.auction.auctiongoods.vo.AuctionGoodsAndFirstImageVo;
import com.kpsl.auction.auctiongoods.vo.AuctionGoodsImageVo;
import com.kpsl.auction.auctiongoods.vo.AuctionGoodsVo;

public interface AuctionGoodsService {
	//단일 물품
	public AuctionGoodsVo getAuctionGoods(String auctionGoodsCode);
	
	//등록품목 리트스
	List<AuctionGoodsVo> getAuctionGoodss();
	
	//물품등록
	int addAuctionGoods(AuctionGoodsVo auctionGoodsVo, List<String> imgList);
	
	//물품 리스트
	List<AuctionGoodsAndFirstImageVo> getAllAuctionGoods();
	
	//물품 이미지 리스트
	List<AuctionGoodsImageVo> getAllAuctionGoodsImages(String auctionGoodsCode);
	
	//물품 수정
	int updateAuctionGoods(AuctionGoodsVo auctionGoodsVo, List<String> imgList);
}
