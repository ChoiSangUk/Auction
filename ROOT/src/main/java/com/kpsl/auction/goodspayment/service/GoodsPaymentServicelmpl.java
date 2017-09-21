package com.kpsl.auction.goodspayment.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kpsl.auction.goodspayment.vo.GoodsPaymentVo;
import com.kpsl.auction.goodspayment.vo.GoodsPaymentVoANDAuctionGoodsVoANDSuccessBidVo;
import com.kpsl.auction.successfullBid.vo.SuccessBidVo;

@Service
public class GoodsPaymentServicelmpl implements GoodsPaymentService {
	Logger log = Logger.getLogger(this.getClass());
	@Autowired GoodsPaymentDao goodsPaymentDao;
	
	@Override
	public int addGoodsPayment(GoodsPaymentVo goodsPaymentVo, SuccessBidVo successBidVo) {
		//결제 버튼 클릭시 
		log.info("addGoodsPayment 호출 확인");
		int goodsPaymentPrice = goodsPaymentVo.getGoodsPaymentPrice();
		if(goodsPaymentPrice >= 100000) {
			int goodsPaymentFees = (int) (goodsPaymentPrice*0.9);
			goodsPaymentVo.setGoodsPaymentFees(goodsPaymentFees);
			goodsPaymentDao.insertGoodsPayment(goodsPaymentVo);
			successBidVo.setSuccessfulBidPrice(goodsPaymentPrice);
			goodsPaymentDao.updateBuyerTotalcash(successBidVo);
			int goodsPaymentPriceSubFees = goodsPaymentPrice-goodsPaymentFees;
			successBidVo.setSuccessfulBidPrice(goodsPaymentPriceSubFees);
			goodsPaymentDao.updateSellerTotalcash(successBidVo);
			return 0;
		}else {
			int goodsPaymentFees = (int) (goodsPaymentPrice*0.5);
			goodsPaymentVo.setGoodsPaymentFees(goodsPaymentFees);
			goodsPaymentDao.insertGoodsPayment(goodsPaymentVo);
			successBidVo.setSuccessfulBidPrice(goodsPaymentPrice);
			goodsPaymentDao.updateBuyerTotalcash(successBidVo);
			int goodsPaymentPriceSubFees = goodsPaymentPrice-goodsPaymentFees;
			successBidVo.setSuccessfulBidPrice(goodsPaymentPriceSubFees);
			goodsPaymentDao.updateSellerTotalcash(successBidVo);
			return 0;
		}
	}
	//결제 완료 된 리스트
	@Override
	public List<GoodsPaymentVoANDAuctionGoodsVoANDSuccessBidVo> selectuserpaymentlist(
			GoodsPaymentVoANDAuctionGoodsVoANDSuccessBidVo goodspaymentvoANDauctiongoodsvoANDsuccessbidvo) {
		log.info("GoodsPaymentServicelmpl의 selectuserpaymentlist 메서드");
		return goodsPaymentDao.selectGoodsPaymentlist(goodspaymentvoANDauctiongoodsvoANDsuccessbidvo);
	}

}
