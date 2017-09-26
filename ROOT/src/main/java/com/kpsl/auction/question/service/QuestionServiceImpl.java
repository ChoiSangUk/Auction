package com.kpsl.auction.question.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kpsl.auction.question.vo.QuestionReplyVo;
import com.kpsl.auction.question.vo.QuestionVo;

@Service
public class QuestionServiceImpl implements QuestionService {
	@Autowired private QuestionDao questionDao;
	@Autowired private QuestionReplyDao questionReplyDao;
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
	@Override
	public QuestionReplyVo getQuestionReply(String questionCode) {
		
		// TODO Auto-generated method stub
		int questionReply = questionReplyDao.selectQuestionReplyExist(questionCode);
		System.out.println("답변 갯수가 0인가 ?" + questionReply);
		if(questionReply == 0){
			QuestionReplyVo questionReplyVo = new QuestionReplyVo();
			questionReplyVo.setQuestionReplyCode("0");
			return questionReplyVo;
		}
		
		return questionReplyDao.selectQuestionReply(questionCode);
	}

}
