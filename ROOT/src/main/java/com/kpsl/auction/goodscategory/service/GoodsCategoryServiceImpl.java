package com.kpsl.auction.goodscategory.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kpsl.auction.goodscategory.vo.LargeCategoryVo;

@Service
public class GoodsCategoryServiceImpl implements GoodsCategoryService {
	@Autowired
	private LargeCategoryDao largeCategoryDao;
	@Override
	public List<LargeCategoryVo> getAllLargeCategory() {
		// TODO Auto-generated method stub
		System.out.println("GoodsCategoryServiceImpl.java");
		
		return largeCategoryDao.selectAllLargeCategory();
	}

}
