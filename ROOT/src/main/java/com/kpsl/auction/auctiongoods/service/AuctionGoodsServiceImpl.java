package com.kpsl.auction.auctiongoods.service;

import java.util.List;
import org.apache.log4j.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kpsl.auction.auctiongoods.vo.AuctionGoodsImageVo;
import com.kpsl.auction.auctiongoods.vo.AuctionGoodsVo;
@Transactional
@Service
public class AuctionGoodsServiceImpl implements AuctionGoodsService {
	Logger log = Logger.getLogger(this.getClass());
	@Autowired
	private AuctionGoodsDao auctionGoodsDao;
	@Autowired
	private AuctionGoodsImageDao auctionGoodsImageDao;
	
	@Override
	public AuctionGoodsVo getAuctionGoods() {
		// TODO Auto-generated method stub
		return auctionGoodsDao.selectAuctionGoods();
	}
//등록품목 리스트
	@Override
	public List<AuctionGoodsVo> getAuctionGoodss() {
		log.info("ServiceImpl goods list 메소드");
		return auctionGoodsDao.selectAuctionGoodss();
	}
	
	
	@Override
	public int addAuctionGoods(AuctionGoodsVo auctionGoodsVo, List<String> imgList) {
		// TODO Auto-generated method stub
		System.out.println("AuctionGoodsServiceImpl.addAuctionGoods에서 imgList가 잘 받아지나");
	    for(int i=0; i<imgList.size(); i++){
	    	System.out.println(imgList.get(i));
	    }
	    //System.out.println("AuctionGoodsServiceImpl.addAuctionGoods에서 auctionGoodsVo가 잘 받아지나");
	    //System.out.println(auctionGoodsVo.toString());
		auctionGoodsDao.insertAuctionGoods(auctionGoodsVo);
		System.out.println("물품코드 :"+auctionGoodsVo.getAuctionGoodsCode());
		
		for(int i=0; i<imgList.size(); i++){
			AuctionGoodsImageVo auctionGoodsImageVo = new AuctionGoodsImageVo();
			auctionGoodsImageVo.setAuctionGoodsCode(auctionGoodsVo.getAuctionGoodsCode());
			auctionGoodsImageVo.setAuctionGoodsImagePath(imgList.get(i));
			auctionGoodsImageDao.insertAuctionGoodsImage(auctionGoodsImageVo);
		}
		
		 return 0;
	}
	
}
