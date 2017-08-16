package com.kpsl.auction.goodscategory.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kpsl.auction.goodscategory.vo.LargeCategoryVo;

@Repository
public class LargeCategoryDaoImpl implements LargeCategoryDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<LargeCategoryVo> selectAllLargeCategory() {
		// TODO Auto-generated method stub
		System.out.println("LargeCategoryDaoImpl.java");
		 List<LargeCategoryVo> largevo =	sqlSessionTemplate.selectList("com.kpsl.auction.goodscategory.service.LargeCategoryMapper.selectAllLargeCategory");
		   largevo.toString();
		return largevo;
	}
}
