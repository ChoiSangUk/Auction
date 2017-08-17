package com.kpsl.auction.goodscategory.service;

import java.util.List;

import com.kpsl.auction.goodscategory.vo.MiddleCategoryVo;

public interface MiddleCategoryDao {
	public List<MiddleCategoryVo> selectMiddleCategoryList(String largeCategoryCode);
	
}
