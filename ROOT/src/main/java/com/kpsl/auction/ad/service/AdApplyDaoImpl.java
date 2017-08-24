package com.kpsl.auction.ad.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kpsl.auction.ad.vo.AdApplyAndAdImageAndAdUnitPriceAndAuctionGoodsVo;
import com.kpsl.auction.ad.vo.AdApplyVo;
import com.kpsl.auction.ad.vo.AdImageVo;
import com.kpsl.auction.auctiongoods.vo.AuctionGoodsVo;

@Repository
public class AdApplyDaoImpl implements AdApplyDao {
	
	Logger log = Logger.getLogger(this.getClass());
	final String AuctionGoodsMapperNS = "com.kpsl.auction.auctiongoods.service.AuctionGoodsMapper.";
	final String AdApplyMapperNS = "com.kpsl.auction.ad.service.AdApplyMapper.";
	final String AdImageMapperNS = "com.kpsl.auction.ad.service.AdImageMapper.";
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<AuctionGoodsVo> selectAuctionGoodsListForAdApply(String userId) {
		
		log.info("selectAuctionGoodsListForAdApply 호출 확인");
		log.info(userId+"<---AdApplyDao 아이디확인");
		
		return sqlSessionTemplate.selectList(AuctionGoodsMapperNS+"selectAuctionGoodsListByUserId",userId);
	}

	@Override
	public int insertAdApply(AdApplyVo adApplyVo) {
		log.info("insertAdApply 호출 확인");
		return sqlSessionTemplate.insert(AdApplyMapperNS+"insertAdApply",adApplyVo);
	}

	@Override
	public int insertAdImage(AdImageVo adImageVo) {
		log.info("insertAdImage 호출 확인");
		
		return sqlSessionTemplate.insert(AdImageMapperNS+"insertAdImage",adImageVo);
	}

	@Override
	public List<AdApplyVo> selectAdApplyList() {
		log.info("selectAdApplyList 호출 확인");
		return sqlSessionTemplate.selectList(AdApplyMapperNS+"selectAdApply");
	}

	@Override
	public AdApplyAndAdImageAndAdUnitPriceAndAuctionGoodsVo selectAdApplyAndAdImageAndAdUnitPriceByAdApplyCode(String adApplyCode) {
		log.info("selectAdApplyAndAdImageByAdApplyCode 호출 확인");
		log.info(adApplyCode+"<--- selectAdApplyAndAdImageByAdApplyCode adApplyCode 확인");
		return sqlSessionTemplate.selectOne(AdApplyMapperNS+"selectAdApplyAndAdImageAndAdUnitPriceByAdApplyCode",adApplyCode);
	}

	@Override
	public int updateAdApply(AdApplyVo adApplyVo) {
		log.info("updateAdApply 호출 확인");
		return sqlSessionTemplate.update(AdApplyMapperNS+"updateAdApply",adApplyVo);
	}
	
	@Override
	public int updateAdImage(AdImageVo adImageVo) {
		log.info("updateAdImage 호출 확인");
		return sqlSessionTemplate.update(AdImageMapperNS+"updateAdImage",adImageVo);
	}
	
	@Override
	public List<AdApplyAndAdImageAndAdUnitPriceAndAuctionGoodsVo> selectAdApplyAndAdImageAndAdUnitPriceAndAuctionGoodsByUserId(String userId) {
		log.info("selectAdApplyAndAdUnitPriceAndAuctionGoodsByUserId 호출 확인");
		return sqlSessionTemplate.selectList(AdApplyMapperNS+"selectAdApplyAndAdImageAndAdUnitPriceAndAuctionGoodsByUserId",userId);
	}
}
