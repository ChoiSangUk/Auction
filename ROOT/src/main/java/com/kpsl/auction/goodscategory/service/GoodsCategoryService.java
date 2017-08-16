package com.kpsl.auction.goodscategory.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kpsl.auction.goodscategory.vo.LargeCategoryVo;

@Service
public interface GoodsCategoryService {
		List<LargeCategoryVo> getAllLargeCategory(); //대분류 카테고리를 출력하기 위한 메소드 
}
