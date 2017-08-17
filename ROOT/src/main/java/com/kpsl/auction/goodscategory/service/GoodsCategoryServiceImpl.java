package com.kpsl.auction.goodscategory.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kpsl.auction.goodscategory.vo.LargeCategoryVo;
import com.kpsl.auction.goodscategory.vo.MiddleCategoryVo;
import com.kpsl.auction.goodscategory.vo.SmallCategoryVo;

@Service
public class GoodsCategoryServiceImpl implements GoodsCategoryService {
	Logger log = Logger.getLogger(this.getClass());
	@Autowired private LargeCategoryDao largeCategoryDao;
	@Autowired private MiddleCategoryDao middleCategoryDao;
	@Autowired private SmallCategoryDao smallCategoryDao;
	
	@Override
	public List<LargeCategoryVo> getAllLargeCategory() {
		// TODO Auto-generated method stub
		System.out.println("GoodsCategoryServiceImpl.java");
		
		return largeCategoryDao.selectAllLargeCategory();
	}
	
	
	@Override
	public List<MiddleCategoryVo> getMiddleCategoryList(String largeCategoryCode) {
		// TODO Auto-generated method stub
			log.info("getMiddleCategoryList 실행 largeCategory 값 : "+largeCategoryCode );
			return middleCategoryDao.selectMiddleCategoryList(largeCategoryCode);
	}


	@Override
	public List<SmallCategoryVo> getSmallCategoryList(String largeCategoryCode, String middleCategoryCode) {
		// TODO Auto-generated method stub
		return smallCategoryDao.selectSmallCategoryList(largeCategoryCode, middleCategoryCode);
	}

}
