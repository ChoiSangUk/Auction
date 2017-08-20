package com.kpsl.auction.bid.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kpsl.auction.bid.vo.BidVo;

@Service
public class BidServicelmpl implements BidService {
	@Autowired private BidDao bidDao;
	//입찰자 리스트
	@Override
	public List<BidVo> getBidList(){
	
		return bidDao.selectBidList();
	}
	
}
