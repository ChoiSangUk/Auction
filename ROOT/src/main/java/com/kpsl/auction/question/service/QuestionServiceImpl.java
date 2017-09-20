package com.kpsl.auction.question.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kpsl.auction.question.vo.QuestionVo;

@Service
public class QuestionServiceImpl implements QuestionService {
	@Autowired private QuestionDao questionDao;
	@Override
	public void addQuestion(QuestionVo questionVo) {
		// TODO Auto-generated method stub
		questionDao.insertQuestion(questionVo);
	}
	@Override
	public List<QuestionVo> getQuestions(String auctionGoodsCode) {
		// TODO Auto-generated method stub
		return questionDao.getQuestions(auctionGoodsCode);
	}

}
