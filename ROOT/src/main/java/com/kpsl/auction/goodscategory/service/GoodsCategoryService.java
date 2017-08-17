package com.kpsl.auction.goodscategory.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kpsl.auction.goodscategory.vo.LargeCategoryVo;
import com.kpsl.auction.goodscategory.vo.MiddleCategoryVo;

@Service
public interface GoodsCategoryService {
	//대분류 카테고리를 출력하기 위한 메소드 	
	List<LargeCategoryVo> getAllLargeCategory(); 
		
	//선택된 대분류의 중분류 리스트를 출력하기 위한 메소드	
	List<MiddleCategoryVo> getMiddleCategoryList(String largeCategoryCode);
}
