package com.kpsl.auction.question.service;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.kpsl.auction.question.vo.QuestionVo;

public interface QuestionDao {

	void insertQuestion(QuestionVo questionVo);

	List<QuestionVo> getQuestions(String auctionGoodsCode);

}
