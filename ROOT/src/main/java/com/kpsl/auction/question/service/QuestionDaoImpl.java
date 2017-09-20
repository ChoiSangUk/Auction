package com.kpsl.auction.question.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kpsl.auction.question.vo.QuestionVo;

@Repository
public class QuestionDaoImpl implements QuestionDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	final String NS = "com.kpsl.auction.question.service.QuestionMapper.";
	@Override
	public void insertQuestion(QuestionVo questionVo) {
		// TODO Auto-generated method stub
		System.out.println("dao 에서");
		System.out.println(questionVo.toString());
		sqlSessionTemplate.insert(NS+"insertQuestion", questionVo);
	}
	@Override
	public List<QuestionVo> getQuestions(String auctionGoodsCode) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList(NS+"selectQuestions", auctionGoodsCode);
	}
	
}
