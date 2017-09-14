package com.kpsl.auction.ad.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kpsl.auction.ad.vo.AdApplyAndAdImageAndAdUnitPriceAndAuctionGoodsVo;
import com.kpsl.auction.ad.vo.AdRefundApplyVo;
import com.kpsl.auction.saleslog.service.SalesLogDao;
import com.kpsl.auction.saleslog.vo.SalesLogVo;

@Service
public class AdRefundApplyServiceImpl implements AdRefundApplyService {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Autowired AdRefundApplyDao adRefundApplyDao;
	@Autowired SalesLogDao salesLogDao;
	
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

	@Override
	public int modifyRefundApply(AdRefundApplyVo adRefundApplyVo) {
		
		log.info("modifyRefundApply 호출 확인");
		
		return adRefundApplyDao.updateAdRefund(adRefundApplyVo);
	}

	@Override
	public int modifyUserTotalCashByUserId(AdRefundApplyVo adRefundApplyVo) {

		log.info("modifyUserTotalCashByUserId 호출 확인");
		String adRefundApplyState = adRefundApplyVo.getAdRefundApplyState();
		log.info(adRefundApplyState+"<-- 광고환불신청 상태");
		if(adRefundApplyState.equals("승인완료")) {
			log.info("승인완료");
		return adRefundApplyDao.updateUserTotalCashByUserId(adRefundApplyVo);
		}else {
		return 0;
		}
	}

	@Override
	public int addSalesLog(SalesLogVo salesLogVo, AdRefundApplyVo adRefundApplyVo) {
		
		log.info("addSalesLog 호출 확인");
		String adRefundApplyState = adRefundApplyVo.getAdRefundApplyState();
		if(adRefundApplyState.equals("승인완료")) {
			return salesLogDao.insertIncomeSalesLog(salesLogVo);
		}else {
			return 0;
		}		
	}

	@Override
	public int adRefundApplyAndUserTotalCashAndSalesLogTransaction(AdRefundApplyVo adRefundApplyVo,
			SalesLogVo salesLogVo) {
		
		log.info("adRefundApplyAndUserTotalCashAndSalesLogTransaction 호출 확인");
		modifyRefundApply(adRefundApplyVo);
		modifyUserTotalCashByUserId(adRefundApplyVo);
		String salesLogRelationCode = adRefundApplyVo.getAdRefundApplyCode();
		String salesLogRelation = "ad_refund_apply_tb";
		String salesLogDepositAndWithdrawal = "출금";
		String userId = adRefundApplyVo.getUserId();
		int salesLogPrice = adRefundApplyVo.getAdRefundApplyPrice();
		String salesLogRemarks = "광고환불";
		salesLogVo.setSalesLogRelationCode(salesLogRelationCode);
		salesLogVo.setSalesLogRelation(salesLogRelation);
		salesLogVo.setSalesLogDepositAndWithdrawal(salesLogDepositAndWithdrawal);
		salesLogVo.setSalesLogUserId(userId);
		salesLogVo.setSalesLogPrice(salesLogPrice);
		salesLogVo.setSalesLogRemarks(salesLogRemarks); 
		addSalesLog(salesLogVo, adRefundApplyVo);
		return 0;
	}
}
