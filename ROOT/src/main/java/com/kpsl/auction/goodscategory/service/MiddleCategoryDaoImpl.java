package com.kpsl.auction.goodscategory.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kpsl.auction.goodscategory.vo.MiddleCategoryVo;
@Repository
public class MiddleCategoryDaoImpl implements MiddleCategoryDao {
	Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	//선택된 대분류의 중분류 리스트를 뿌려주기 위한 Dao 구현
	@Override
	public List<MiddleCategoryVo> selectMiddleCategoryList(String largeCategoryCode) {
		// TODO Auto-generated method stub
		log.info("MiddleCategoryDaoImpl.selectMiddleCategoryList 에서 largeCategoryCode 값 :"+largeCategoryCode);
		return sqlSessionTemplate.selectList("com.kpsl.auction.goodscategory.service.MiddleCategoryMapper.selectMiddleCategoryList", largeCategoryCode);
	}

}
