package com.kpsl.auction.goodscategory.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kpsl.auction.goodscategory.vo.SmallCategoryVo;
@Repository
public class SmallCategoryDaoImpl implements SmallCategoryDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	@Override
	public List<SmallCategoryVo> selectSmallCategoryList(String largeCategoryCode, String middleCategoryCode) {
		// TODO Auto-generated method stub
		
		//인자를 두개를 받아서 mapper에 넘기기 위해 맵을 사용
		Map<String, String> map = new HashMap<String,String>();
		map.put("largeCategoryCode", largeCategoryCode);
		map.put("middleCategoryCode", middleCategoryCode);
		return sqlSessionTemplate.selectList("com.kpsl.auction.goodscategory.service.SmallCategoryMapper.selectSmallCategoryList",map);
	}

}
