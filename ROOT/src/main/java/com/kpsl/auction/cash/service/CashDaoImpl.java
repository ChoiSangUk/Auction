package com.kpsl.auction.cash.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kpsl.auction.cash.vo.CashVo;
import com.kpsl.auction.user.vo.UserDetailVo;

@Repository
public class CashDaoImpl implements CashDao {
	final String NS = "com.kpsl.auction.cash.service.CashMapper."; 
	Logger log = Logger.getLogger(this.getClass());
	@Autowired
    private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public int insertCash(CashVo cashVo) {
		log.info("CashDao Class"+ cashVo);
		return sqlSessionTemplate.insert(NS+"insertCash",cashVo);
	}

	@Override
	public int updateUserCash(UserDetailVo userDetailVo) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update(NS+"updateUserCash", userDetailVo);
	}

	@Override
	public int insertCashWithdraw(CashVo cashVo) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert(NS+"insertCashWithdraw",cashVo);
	}

	@Override
	public int updateUserCashWithdraw(UserDetailVo userDetailVo) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update(NS+"updateUserCashWithdraw", userDetailVo);
	}

	@Override
	public List<CashVo> selectCashDetail(String userId,String cashState) {
		log.info("CashDao Class selectCashDetail : "+ userId);
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("userId", userId);
		paramMap.put("cashState", cashState);
		
		return sqlSessionTemplate.selectList(NS+"selectCashDetail", paramMap);
	}

}
