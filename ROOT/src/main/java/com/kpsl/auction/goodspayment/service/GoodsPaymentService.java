package com.kpsl.auction.goodspayment.service;

import java.util.List;

import com.kpsl.auction.goodspayment.vo.GoodsPaymentVo;
import com.kpsl.auction.goodspayment.vo.GoodsPaymentVoANDAuctionGoodsVoANDSuccessBidVo;
import com.kpsl.auction.successfullBid.vo.SuccessBidVo;

public interface GoodsPaymentService {
	int addGoodsPayment(GoodsPaymentVo goodsPaymentVo, SuccessBidVo successBidVo);
	List<GoodsPaymentVoANDAuctionGoodsVoANDSuccessBidVo> selectuserpaymentlist
	(GoodsPaymentVoANDAuctionGoodsVoANDSuccessBidVo goodspaymentvoANDauctiongoodsvoANDsuccessbidvo);
}
