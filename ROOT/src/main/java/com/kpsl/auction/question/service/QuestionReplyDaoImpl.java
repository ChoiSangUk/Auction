package com.kpsl.auction.question.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kpsl.auction.question.vo.QuestionReplyVo;
@Repository
public class QuestionReplyDaoImpl implements QuestionReplyDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	final String NS = "com.kpsl.auction.question.service.QuestionReplyMapper.";
	@Override
	public QuestionReplyVo selectQuestionReply(String questionCode) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne(NS+"selectQuestionReply", questionCode);
	}
	@Override
	public int selectQuestionReplyExist(String questionCode) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne(NS+"questionReplyExist", questionCode);
	}

}
