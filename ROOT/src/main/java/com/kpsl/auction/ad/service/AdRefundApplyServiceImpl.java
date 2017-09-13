package com.kpsl.auction.ad.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kpsl.auction.ad.vo.AdApplyAndAdImageAndAdUnitPriceAndAuctionGoodsVo;
import com.kpsl.auction.ad.vo.AdRefundApplyVo;

@Service
public class AdRefundApplyServiceImpl implements AdRefundApplyService {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Autowired AdRefundApplyDao adRefundApplyDao;
	
	@Override
	public AdApplyAndAdImageAndAdUnitPriceAndAuctionGoodsVo getAdRefundList(String adPaymentCode) {

		log.info("getAdRefundList 호출 확인");
		
		return adRefundApplyDao.selectAdRefundListByAdPaymentCode(adPaymentCode);
	}

	@Override
	public int addAdRefundApply(AdRefundApplyVo adRefundApplyVo) {
		
		log.info("addAdRefundApply 호출 확인");
		
		return adRefundApplyDao.insertAdRefundApply(adRefundApplyVo);
	}

	@Override
	public List<AdApplyAndAdImageAndAdUnitPriceAndAuctionGoodsVo> getAdRefundList() {

		log.info("getAdRefundList 호출 확인");
		
		return adRefundApplyDao.selectAdRefundList();
	}

	@Override
	public AdApplyAndAdImageAndAdUnitPriceAndAuctionGoodsVo getAdRefundDetailList(AdApplyAndAdImageAndAdUnitPriceAndAuctionGoodsVo adVo) {

		log.info("getAdRefundDetailList 호출 확인");
		
		return adRefundApplyDao.selectAdRefundDetailList(adVo);
	}

}
