package com.kpsl.auction.question.vo;

public class QuestionVo {
	private String question_code; 		//경매물품문의코드(PK)
	private String auction_goodsCode; 	//경매물품코드(PK)(FK)
	private String user_sellerId; 		//판매자아이디(PK)(FK)
	private String user_buyerId;		// 구매자아이디(FK)
	private String questionType;		//문의유형
	private String questionForm;		// 문의형식
	private String questionContents; 	//문의내용
	private String questionDate; 		//문의날짜
	
	public String getQuestion_code() {
		return question_code;
	}
	public void setQuestion_code(String question_code) {
		this.question_code = question_code;
	}
	public String getAuction_goodsCode() {
		return auction_goodsCode;
	}
	public void setAuction_goodsCode(String auction_goodsCode) {
		this.auction_goodsCode = auction_goodsCode;
	}
	public String getUser_sellerId() {
		return user_sellerId;
	}
	public void setUser_sellerId(String user_sellerId) {
		this.user_sellerId = user_sellerId;
	}
	public String getUser_buyerId() {
		return user_buyerId;
	}
	public void setUser_buyerId(String user_buyerId) {
		this.user_buyerId = user_buyerId;
	}
	public String getQuestionType() {
		return questionType;
	}
	public void setQuestionType(String questionType) {
		this.questionType = questionType;
	}
	public String getQuestionForm() {
		return questionForm;
	}
	public void setQuestionForm(String questionForm) {
		this.questionForm = questionForm;
	}
	public String getQuestionContents() {
		return questionContents;
	}
	public void setQuestionContents(String questionContents) {
		this.questionContents = questionContents;
	}
	public String getQuestionDate() {
		return questionDate;
	}
	public void setQuestionDate(String questionDate) {
		this.questionDate = questionDate;
	}
	@Override
	public String toString() {
		return "QuestionVo [question_code=" + question_code + ", auction_goodsCode=" + auction_goodsCode
				+ ", user_sellerId=" + user_sellerId + ", user_buyerId=" + user_buyerId + ", questionType="
				+ questionType + ", questionForm=" + questionForm + ", questionContents=" + questionContents
				+ ", questionDate=" + questionDate + "]";
	}


}
