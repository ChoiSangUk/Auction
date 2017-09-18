package com.kpsl.auction.auctiongoods.scheduler;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.kpsl.auction.auctiongoods.service.AuctionGoodsDao;
import com.kpsl.auction.successfullBid.service.SuccessfullBidService;
import com.kpsl.auction.successfullBid.vo.SuccessBidAndBidAndAuctionGoodsVo;
import com.kpsl.auction.successfullBid.vo.SuccessBidVo;

@Component
public class AuctionGoodsScheduler {
	Logger log = Logger.getLogger(this.getClass());
	@Autowired AuctionGoodsDao auctionGoodsDao;
	@Autowired SuccessfullBidService successfullBidService;

	@Scheduled(cron= "0 0 0 * * *")
	public void schedulerText(){
		//매 일 정각이 되면 물품 상태 확인하여 업데이트
		
		List<SuccessBidAndBidAndAuctionGoodsVo> list = successfullBidService.getMaxBid();
		SuccessBidVo successBidVo = new SuccessBidVo();
		
		for(int i=0; i<list.size(); i++){
			successBidVo.setBidCode(list.get(i).getBidVo().getBidCode());
			successBidVo.setUserBuyerId(list.get(i).getBidVo().getUserBuyerId());
			successBidVo.setSuccessfulBidPrice(list.get(i).getBidVo().getBidPrice());
			successBidVo.setAuctionGoodsCode(list.get(i).getAuctionGoodsVo().getAuctionGoodsCode());
			successBidVo.setUserSellerId(list.get(i).getBidVo().getUserSellerID());
			successfullBidService.addSuccessfulBid(successBidVo);
			log.info("낙찰테이블 INSERT 확인");
			String auctionGoodsCode = list.get(i).getAuctionGoodsVo().getAuctionGoodsCode();
			if(!auctionGoodsCode.equals("")){
			successfullBidService.modifyAuctionGoodsState(auctionGoodsCode);
			log.info("경매물품테이블 UPDATE 확인");
			}
		}
		
		System.out.println("스케줄러 동작 시작");
		auctionGoodsDao.updateAuctionGoodsState();
		System.out.println("중간");
		auctionGoodsDao.updateAuctionGoodsStateEnd();
		System.out.println("스케줄러 동작 종료");
	}
}
