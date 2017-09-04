package com.kpsl.auction.ad.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kpsl.auction.ad.vo.AdApplyAndAdImageAndAdPaymentVo;
import com.kpsl.auction.ad.vo.AdPaymentVo;
import com.kpsl.auction.saleslog.service.SalesLogDao;
import com.kpsl.auction.saleslog.vo.SalesLogVo;

@Service
public class AdPaymentServiceImpl implements AdPaymentService {

	Logger log = Logger.getLogger(this.getClass());
	@Autowired AdPaymentDao adPaymentDao;
	@Autowired SalesLogDao salesLogDao;
	
	@Override
	public int addAdPayment(AdPaymentVo adPaymentVo) {
	
		log.info("addAdPayment 호출 확인");
		
		return adPaymentDao.insertAdPayment(adPaymentVo);
	}

	@Override
	public int addSalesLog(SalesLogVo salesLogVo) {
		
		log.info("addSalesLog 호출 확인");
		
		return salesLogDao.insertIncomeSalesLog(salesLogVo);
	}
	
	@Override
	public int modifyUserTotalcash(AdPaymentVo adPaymentVo) {
		
		log.info("modifyUserTotalcash 호출 확인");
		
		return adPaymentDao.updateUserTotalcashByUserId(adPaymentVo);
	}
	
	@Override
	// 광고결제 테이블에 INSERT후 코드값과 결제금액을 salesLogVo에 셋팅후 회사매입매출 INSERT메서드를 호출한다.
	public void adPaymentAndSalesLogTransaction(AdPaymentVo adPaymentVo, SalesLogVo salesLogVo) {
		addAdPayment(adPaymentVo);
		modifyUserTotalcash(adPaymentVo);
		String salesLogRelationCode = adPaymentVo.getAdPaymentCode();
		String salesLogRelation = "ad_payment_tb";
		String salesLogDepositAndWithdrawal = "입금";
		int salesLogPrice = adPaymentVo.getAdPaymentPrice();
		String salesLogRemarks = "광고결제";
		salesLogVo.setSalesLogRelationCode(salesLogRelationCode);
		salesLogVo.setSalesLogRelation(salesLogRelation);
		salesLogVo.setSalesLogDepositAndWithdrawal(salesLogDepositAndWithdrawal);
		salesLogVo.setSalesLogPrice(salesLogPrice);
		salesLogVo.setSalesLogRemarks(salesLogRemarks);
		addSalesLog(salesLogVo);
	}	

	@Override
	public List<AdApplyAndAdImageAndAdPaymentVo> getPaymentSuccessList() {

		log.info("getPaymentSuccessList 호출 확인");
		
		return adPaymentDao.selectAdApplyAndAdImageAndAdPaymentByUserIdAndAdApplyEndDate();
	}

	@Override
	public List<AdApplyAndAdImageAndAdPaymentVo> getPaymentList() {
		
		log.info("getPaymentList 호출 확인");
		
		return adPaymentDao.selectAdApplyAndAdImageAndAdPaymentList();
	}

	@Override
	public List<AdApplyAndAdImageAndAdPaymentVo> getPaymentSearchList(AdPaymentVo adPaymentVo, String sk, String sv, String sDate, String eDate) {

		log.info("getPaymentSearchList 호출 확인");
		log.info(adPaymentVo.getAdPaymentCode()+"<---2");
		adPaymentVo.setAdPaymentRegistDate(sDate+" 00:00:00"+eDate+" 23:59:59");
		if(sk.equals("adPaymentCode")) {
			adPaymentVo.setAdPaymentCode(sv);
			log.info(sk+"<-- sk확인");
			log.info(sv+"<-- sv확인");
		}else if(sk.equals("adApplyCode")) {
			adPaymentVo.setAdApplyCode(sv);
			log.info(sk+"<-- sk확인");
			log.info(sv+"<-- sv확인");
		}else if(sk.equals("userId")) {
			adPaymentVo.setUserId(sv);
			log.info(sk+"<-- sk확인");
			log.info(sv+"<-- sv확인");
		}else if(sk.equals("adPaymentState")) {
			adPaymentVo.setAdPaymentState(sv);
			log.info(sk+"<-- sk확인");
			log.info(sv+"<-- sv확인");
		}
		
		return adPaymentDao.selectAdPaymentListByAdPaymentVo(adPaymentVo);
	}
}
