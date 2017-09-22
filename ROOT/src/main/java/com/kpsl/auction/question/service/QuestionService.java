package com.kpsl.auction.question.service;

import java.util.List;

import com.kpsl.auction.question.vo.QuestionReplyVo;
import com.kpsl.auction.question.vo.QuestionVo;

public interface QuestionService {

	void addQuestion(QuestionVo questionVo);

	//물품 문의 다 가져오기
	List<QuestionVo> getQuestions(String auctionGoodsCode);

	QuestionReplyVo getQuestionReply(String questionCode);

}
