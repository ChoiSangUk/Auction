package com.kpsl.auction.auctiongoods.service;

import java.util.List;
import org.apache.log4j.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kpsl.auction.auctiongoods.vo.AuctionGoodsAndFirstImageVo;
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
	public AuctionGoodsVo getAuctionGoods(String auctionGoodsCode) {
		// TODO Auto-generated method stub
		return auctionGoodsDao.selectAuctionGoods(auctionGoodsCode);
	}
//등록품목 리스트(임시)
	@Override
	public List<AuctionGoodsVo> getAuctionGoodss() {
		log.info("ServiceImpl goods list 메소드");
		return auctionGoodsDao.selectAuctionGoodss();
	}
	
	//물품 등록 액션
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
			auctionGoodsImageVo.setAuctionGoodsImageNum(i);
			auctionGoodsImageDao.insertAuctionGoodsImage(auctionGoodsImageVo);
		}
		
		 return 0;
	}
	
	//모든 물품 리스트
	@Override
	public List<AuctionGoodsAndFirstImageVo> getAllAuctionGoods() {
		// TODO Auto-generated method stub
		System.out.println("serviceimpl까지");
		List<AuctionGoodsAndFirstImageVo> list =auctionGoodsDao.selectAllAuctionGoods();
		System.out.println("옥션굿즈서비스"+list.toString());
		return auctionGoodsDao.selectAllAuctionGoods();
	}
	
	//물품에 대한 모든 이미지 리스트
	@Override
	public List<AuctionGoodsImageVo> getAllAuctionGoodsImages(String auctionGoodsCode) {
		// TODO Auto-generated method stub
		return auctionGoodsImageDao.selectAllAuctionGoodsImages(auctionGoodsCode);
	}
	
	//물품 수정
	@Override
	public int updateAuctionGoods(AuctionGoodsVo auctionGoodsVo, List<String> imgList) {
		
		//기존의 이미지를 삭제함
		auctionGoodsImageDao.deleteAllAuctionGoodsImages(auctionGoodsVo.getAuctionGoodsCode());
		for(int i=0; i<imgList.size(); i++){
	    	System.out.println(imgList.get(i));
	    }
	    //System.out.println("AuctionGoodsServiceImpl.addAuctionGoods에서 auctionGoodsVo가 잘 받아지나");
	    //System.out.println(auctionGoodsVo.toString());
		auctionGoodsDao.updateAuctionGoods(auctionGoodsVo);
		AuctionGoodsVo auctionGoods = auctionGoodsDao.selectAuctionGoods(auctionGoodsVo.getAuctionGoodsCode());
		System.out.println("물품코드 :"+auctionGoods.getAuctionGoodsCode());
		
		for(int i=0; i<imgList.size(); i++){
			AuctionGoodsImageVo auctionGoodsImageVo = new AuctionGoodsImageVo();
			auctionGoodsImageVo.setAuctionGoodsCode(auctionGoods.getAuctionGoodsCode());
			auctionGoodsImageVo.setAuctionGoodsImagePath(imgList.get(i));
			auctionGoodsImageVo.setAuctionGoodsImageNum(i);
			auctionGoodsImageDao.insertAuctionGoodsImage(auctionGoodsImageVo);
		}
		
		 return 0;
	}
	
}
