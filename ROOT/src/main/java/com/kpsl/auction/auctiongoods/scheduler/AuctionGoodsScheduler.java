package com.kpsl.auction.auctiongoods.scheduler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.kpsl.auction.auctiongoods.service.AuctionGoodsDao;

@Component
public class AuctionGoodsScheduler {
	@Autowired AuctionGoodsDao auctionGoodsDao;
	
	@Scheduled(cron= "0 0 0 * * *")
	public void schedulerText(){
		//매 일 정각이 되면 물품 상태 확인하여 업데이트
		
		
		System.out.println("스케줄러 동작 시작");
		auctionGoodsDao.updateAuctionGoodsState();
		System.out.println("중간");
		auctionGoodsDao.updateAuctionGoodsStateEnd();
		System.out.println("스케줄러 동작 종료");
	}
}
