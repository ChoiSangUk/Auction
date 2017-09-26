package com.kpsl.auction.question.service;

import com.kpsl.auction.question.vo.QuestionReplyVo;

public interface QuestionReplyDao {

	QuestionReplyVo selectQuestionReply(String questionCode);

	int selectQuestionReplyExist(String questionCode);

}
