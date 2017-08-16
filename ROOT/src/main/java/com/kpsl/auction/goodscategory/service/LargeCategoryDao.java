package com.kpsl.auction.goodscategory.service;

import java.util.List;

import com.kpsl.auction.goodscategory.vo.LargeCategoryVo;

public interface LargeCategoryDao {
	public List<LargeCategoryVo> selectAllLargeCategory();
	 
}
