package com.kpsl.auction.goodspayment.service;

import java.util.List;

import com.kpsl.auction.goodspayment.vo.GoodsPaymentVo;
import com.kpsl.auction.goodspayment.vo.GoodsPaymentVoANDAuctionGoodsVoANDSuccessBidVo;
import com.kpsl.auction.successfullBid.vo.SuccessBidVo;

public interface GoodsPaymentDao {
	//결제 inster
	int insertGoodsPayment(GoodsPaymentVo goodsPaymentVo);
	//판매자 캐쉬 update
	int updateSellerTotalcash(SuccessBidVo successBidVo);
	//구매자 캐쉬 update
	int updateBuyerTotalcash(SuccessBidVo successBidV);
	//결제 완료 된 리스트
	List<GoodsPaymentVoANDAuctionGoodsVoANDSuccessBidVo> selectGoodsPaymentlist
	(GoodsPaymentVoANDAuctionGoodsVoANDSuccessBidVo goodspaymentvoANDauctiongoodsvoANDsuccessbidvo);
}
