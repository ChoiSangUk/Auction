package com.kpsl.auction.goodspayment.service;

import com.kpsl.auction.goodspayment.vo.GoodsPaymentVo;
import com.kpsl.auction.successfullBid.vo.SuccessBidVo;

public interface GoodsPaymentDao {
	int insertGoodsPayment(GoodsPaymentVo goodsPaymentVo);
	
	int updateSellerTotalcash(SuccessBidVo successBidVo);
	
	int updateBuyerTotalcash(SuccessBidVo successBidV);
}
