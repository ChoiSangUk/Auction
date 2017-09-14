package com.kpsl.auction.auctiongoods.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kpsl.auction.auctiongoods.vo.AuctionGoodsAndFirstImageVo;
import com.kpsl.auction.auctiongoods.vo.AuctionGoodsImageVo;
import com.kpsl.auction.auctiongoods.vo.AuctionGoodsVo;
import com.kpsl.auction.saleslog.service.SalesLogDao;
import com.kpsl.auction.saleslog.vo.SalesLogVo;
@Transactional
@Service
public class AuctionGoodsServiceImpl implements AuctionGoodsService {
	Logger log = Logger.getLogger(this.getClass());
	@Autowired
	private AuctionGoodsDao auctionGoodsDao;
	@Autowired
	private AuctionGoodsImageDao auctionGoodsImageDao;
	@Autowired 
	private SalesLogDao salesLogDao;
	//매입매출에 등록
	@Override
	public int addSalesLog(SalesLogVo salesLogVo) {
			
		log.info("addSalesLog 호출 확인");
		return salesLogDao.insertIncomeSalesLog(salesLogVo);
	}
	
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
	public int addAuctionGoods(AuctionGoodsVo auctionGoodsVo, List<String> imgList, int userTotalCash) {
		// TODO Auto-generated method stub
		System.out.println("AuctionGoodsServiceImpl.addAuctionGoods에서 imgList가 잘 받아지나");
	    for(int i=0; i<imgList.size(); i++){
	    	System.out.println(imgList.get(i));
	    }
	    //System.out.println("AuctionGoodsServiceImpl.addAuctionGoods에서 auctionGoodsVo가 잘 받아지나");
	    //System.out.println(auctionGoodsVo.toString());
	    System.out.println("토탈캐쉬 : "+userTotalCash);
		auctionGoodsDao.insertAuctionGoods(auctionGoodsVo);
		System.out.println("물품코드 :"+auctionGoodsVo.getAuctionGoodsCode());
		String auctionGoodsCode =auctionGoodsVo.getAuctionGoodsCode();
		
		//유저의 캐쉬에서 보증금을 뺀 값을 캐쉬에 다시 업데이트
		int depositPrice=auctionGoodsDao.getDepositPrice(auctionGoodsCode);
		int resultCash = userTotalCash-depositPrice;
		Map map = new HashMap();
		map.put("userId", auctionGoodsVo.getUserId());
		map.put("resultCash", resultCash);
		map.put("auctionGoodsCode", auctionGoodsCode);
		auctionGoodsDao.addDepositPrice(map);
		
		//매입매출에 등록
		SalesLogVo salesLogVo = new SalesLogVo();
		String salesLogRelationCode = auctionGoodsCode;
		String salesLogRelation = "auction_goods_tb";
		String salesLogDepositAndWithdrawal = "입금";
		int salesLogPrice = depositPrice;
		String salesLogRemarks = "판매보증금등록";
		salesLogVo.setSalesLogRelationCode(salesLogRelationCode);
		salesLogVo.setSalesLogRelation(salesLogRelation);
		salesLogVo.setSalesLogDepositAndWithdrawal(salesLogDepositAndWithdrawal);
		salesLogVo.setSalesLogPrice(salesLogPrice);
		salesLogVo.setSalesLogRemarks(salesLogRemarks);
		salesLogVo.setSalesLogUserId(auctionGoodsVo.getUserId());
		addSalesLog(salesLogVo);
		
		for(int i=0; i<imgList.size(); i++){
			AuctionGoodsImageVo auctionGoodsImageVo = new AuctionGoodsImageVo();
			auctionGoodsImageVo.setAuctionGoodsCode(auctionGoodsCode);
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
	
	@Override
	 public int increaseHits(String auctionGoodsCode) {
	 		
	 	int hits =  auctionGoodsDao.selectIncreaseHits(auctionGoodsCode);
	 	hits++;
	 	Map map=new HashMap();
	 	map.put("auctionGoodsHits", hits);
	 	map.put("auctionGoodsCode", auctionGoodsCode);
	 	auctionGoodsDao.increaseHits(map);
	 	return 0;
	 }
	
	//유저 캐쉬 가져오기
	@Override
	public int getUserCash(String userId) {
		return auctionGoodsDao.selectUserCash(userId);
	}
	
}
