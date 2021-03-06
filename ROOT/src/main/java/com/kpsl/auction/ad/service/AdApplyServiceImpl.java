package com.kpsl.auction.ad.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kpsl.auction.ad.vo.AdApplyAndAdImageAndAdUnitPriceAndAuctionGoodsVo;
import com.kpsl.auction.ad.vo.AdApplyVo;
import com.kpsl.auction.ad.vo.AdImageVo;
import com.kpsl.auction.auctiongoods.vo.AuctionGoodsVo;

@Service
@Transactional
public class AdApplyServiceImpl implements AdApplyService {
	
	Logger log = Logger.getLogger(this.getClass());
	@Autowired private AdApplyDao adApplyDao;
	
	@Override
	// adApplyVo에 셋팅된 adApplyCode를 겟팅후 adImageVo의 adApplyCode에 셋팅해준다.
	public void adApplyTransaction(AdApplyVo adApplyVo, AdImageVo adImageVo) {
		
		log.info("adApplyTransaction 확인");
		addAdApply(adApplyVo);
		String adApplyCode = adApplyVo.getAdApplyCode();
		adImageVo.setAdApplyCode(adApplyCode);
		addAdImage(adImageVo);		
	}
	
	@Override
	public List<AuctionGoodsVo> getAuctionGoodsListByUserId(String userId) {
		
		log.info("getAuctionGoodsListByUserId 호출 확인");
		
		return adApplyDao.selectAuctionGoodsListForAdApply(userId);
	}

	@Override
	public int addAdApply(AdApplyVo adApplyVo) {
		
		log.info("addAdApply 호출 확인");
		
		return adApplyDao.insertAdApply(adApplyVo);
	}

	@Override
	public int addAdImage(AdImageVo adImageVo) {
		
		log.info("adAdImage 호출 확인");
		
		return adApplyDao.insertAdImage(adImageVo);
	}
	
	@Override
	public int getAdApplyCount(AdApplyVo adApplyVo, String sk, String sv, String sDate, String eDate) {
		
		log.info("AdApplyCount 호출 확인1");
		adApplyVo.setAdApplyRegistDate(sDate+" 00:00:00"+eDate+" 23:59:59");
		if(sk == null){			
			return adApplyDao.selectAdApplyCount(adApplyVo);
		}else if(sk.equals("adApplyCode")) {
			adApplyVo.setAdApplyCode("%"+sv+"%");
			log.info(sk+"<-- sk확인");
			log.info(sv+"<-- sv확인");
		}else if(sk.equals("userId")) {
			adApplyVo.setUserId("%"+sv+"%");
			log.info(sk+"<-- sk확인");
			log.info(sv+"<-- sv확인");
		}else if(sk.equals("adApplyState")) {
			adApplyVo.setAdApplyState("%"+sv+"%");
			log.info(sk+"<-- sk확인");
			log.info(sv+"<-- sv확인");
		}

		return adApplyDao.selectAdApplyCount(adApplyVo);
	}

	@Override
	public List<AdApplyVo> searchAdApplyList(AdApplyVo adApplyVo, String sk, String sv 
											,String sDate, String eDate, int currentPage, int pagePerRow) {
		
		log.info("getAdApplyListBySv 호출 확인");
		int beginRow = (currentPage-1)*pagePerRow;
		log.info(beginRow+"<-- 시작");
		adApplyVo.setBeginRow(beginRow);
		adApplyVo.setPagePerRow(pagePerRow);
		adApplyVo.setAdApplyRegistDate(sDate+" 00:00:00"+eDate+" 23:59:59");
		if(sk == null){
			return adApplyDao.selectAdApplyList(adApplyVo);
		}else if(sk.equals("adApplyCode")) {
			adApplyVo.setAdApplyCode("%"+sv+"%");
			log.info(sk+"<-- sk확인");
			log.info(sv+"<-- sv확인");
		}else if(sk.equals("userId")) {
			adApplyVo.setUserId("%"+sv+"%");
			log.info(sk+"<-- sk확인");
			log.info(sv+"<-- sv확인");
		}else if(sk.equals("adApplyState")) {
			adApplyVo.setAdApplyState("%"+sv+"%");
			log.info(sk+"<-- sk확인");
			log.info(sv+"<-- sv확인");
		}
		
		return adApplyDao.selectAdApplyList(adApplyVo);
	}
	
	@Override
	public AdApplyAndAdImageAndAdUnitPriceAndAuctionGoodsVo getAdApplyDetail(String adApplyCode) {
		
		log.info("getAdApplyAndAdImageByAdApplyCode 호출 확인");
		
		return adApplyDao.selectAdApplyAndAdImageAndAdUnitPriceByAdApplyCode(adApplyCode);
	}

	@Override
	public int modifyAdApply(AdApplyVo adApplyVo) {
		
		log.info("modifyAdApply 호출 확인");
		
		return adApplyDao.updateAdApply(adApplyVo);
	}
	
	@Override
	public int modifyAdImage(AdImageVo adImageVo) {
		
		log.info("modifyAdImage 호출 확인");
		
		return adApplyDao.updateAdImage(adImageVo);
	}
	
	@Override
	public List<AdApplyAndAdImageAndAdUnitPriceAndAuctionGoodsVo> getMyAdApplyList(String userId) {
		
		log.info("getMyAdApplyList 호출 확인");
		
		return adApplyDao.selectAdApplyAndAdImageAndAdUnitPriceAndAuctionGoodsByUserId(userId);
	}
}
