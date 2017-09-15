package com.kpsl.auction.auctiongoods.scheduler;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.kpsl.auction.auctiongoods.service.AuctionGoodsDao;
import com.kpsl.auction.successfullBid.service.SuccessfullBidService;
import com.kpsl.auction.successfullBid.vo.SuccessBidAndBidAndAuctionGoodsVo;

@Component
public class AuctionGoodsScheduler {
	Logger log = Logger.getLogger(this.getClass());
	@Autowired AuctionGoodsDao auctionGoodsDao;
	@Autowired SuccessfullBidService successfullBidService;

	@Scheduled(cron= "0 0 0 * * *")
	public void schedulerText(){
		//매 일 정각이 되면 물품 상태 확인하여 업데이트
		
		List<SuccessBidAndBidAndAuctionGoodsVo> list = successfullBidService.getMaxBid();
		for(int i=0; i<list.size(); i++){
			log.info(list.get(i).getAuctionGoodsVo().getAuctionGoodsCode());
			log.info(list.get(i).getBidVo().getBidPrice());
		}
		
		System.out.println("스케줄러 동작 시작");
		auctionGoodsDao.updateAuctionGoodsState();
		System.out.println("중간");
		auctionGoodsDao.updateAuctionGoodsStateEnd();
		System.out.println("스케줄러 동작 종료");
	}
}
