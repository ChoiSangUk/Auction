package com.kpsl.auction.goodscategory.service;

import java.util.List;

import com.kpsl.auction.goodscategory.vo.SmallCategoryVo;

public interface SmallCategoryDao {
	public List<SmallCategoryVo> selectSmallCategoryList(String largeCategoryCode, String middleCategoryCode);
}
