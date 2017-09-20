package com.kpsl.auction.goodspayment.service;

import com.kpsl.auction.goodspayment.vo.GoodsPaymentVo;
import com.kpsl.auction.successfullBid.vo.SuccessBidVo;

public interface GoodsPaymentService {
	int addGoodsPayment(GoodsPaymentVo goodsPaymentVo, SuccessBidVo successBidVo);
}
