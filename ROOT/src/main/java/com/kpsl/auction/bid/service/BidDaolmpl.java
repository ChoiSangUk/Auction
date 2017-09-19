package com.kpsl.auction.bid.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.kpsl.auction.bid.vo.BidVo;
import com.kpsl.auction.bid.vo.BidVoANDAucntionGoodsVo;
import com.kpsl.auction.user.vo.UserDetailVo;

@Repository
public class BidDaolmpl implements BidDao {
	Logger log = Logger.getLogger(this.getClass());

	final String NS = "com.kpsl.auction.bid.service.BidMapper.";
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	// 입찰자 리스트
	@Override
	public List<BidVo> selectBidList() {
		log.info("BidDao selectBidList 확인");
		return sessionTemplate.selectList(NS + "selectBidList");
	}
	// 물품별입찰자 리스트
	@Override
	public List<BidVo> selectGoodsBidList(BidVo bidvo) {
		// log.info(auctionGoodsCode +" --> BidDao 물품코드 들어오는 것인가.?");
		log.info("BidDao goodsselectBidList 확인");
		return sessionTemplate.selectList(NS + "selectBidList", bidvo);
	}
	// 개인 입찰 리스트
	@Override
	public List<BidVoANDAucntionGoodsVo> selectUserGoodsBidsList(BidVoANDAucntionGoodsVo bidvoandaucntiongoodsvo) {
		log.info("BidDao userSelectGoodsBidsList 확인");
		return sessionTemplate.selectList(NS + "selectUserBidList", bidvoandaucntiongoodsvo);
	}
	// 입찰하기
	@Override
	public int instertBidPrice(BidVo bidvo) {
		log.info("BidDao insertBidPrice 확인");
		/* log.debug(sessionTemplate.insert(NS+"insertBidPrice" , bidvo)); */
		return sessionTemplate.insert(NS + "insertBidPrice", bidvo);
	
	//최고입찰금액
	}
	@Override
	public BidVo selectBidHighBidPrice(String auctionGoodsCode) {
		log.info("BidDao bidselecthighbiduserprice 확인");
		return sessionTemplate.selectOne(NS + "highbiduserprice", auctionGoodsCode);
	}	
	//중복확인
	@Override
	public BidVo selectOverlapUser(BidVo bidvo) {
		log.info("BidDao selectOverlapUser 확인");
		return sessionTemplate.selectOne(NS + "selectbiduercount", bidvo);
	}
	//재입찰시 입찰금액 수정
	@Override
	public BidVo updateBidPrice(BidVo bidvo) {
		log.info("BidDao updateBidPrice 확인");
		return sessionTemplate.selectOne(NS + "updateRebid", bidvo);
	}

}
