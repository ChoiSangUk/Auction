package com.kpsl.auction.question.vo;

public class QuestionVo {
	private String questionCode; 		//경매물품문의코드(PK)
	private String auctionGoodsCode; 	//경매물품코드(PK)(FK)
	private String userSellerId; 		//판매자아이디(PK)(FK)
	private String userBuyerId;			// 구매자아이디(FK)
	private String questionType;		//문의유형
	private String questionContents; 	//문의내용
	private String questionTitle;
	private String questionDate; 		//문의날짜
	private String questionState;		//공개 , 비공개
	public String getQuestionTitle() {
		return questionTitle;
	}
	public void setQuestionTitle(String questionTitle) {
		this.questionTitle = questionTitle;
	}
	private String questionReplyState;	//답변상태
	
	public String getQuestionCode() {
		return questionCode;
	}
	public void setQuestionCode(String questionCode) {
		this.questionCode = questionCode;
	}
	public String getAuctionGoodsCode() {
		return auctionGoodsCode;
	}
	public void setAuctionGoodsCode(String auctionGoodsCode) {
		this.auctionGoodsCode = auctionGoodsCode;
	}
	public String getUserSellerId() {
		return userSellerId;
	}
	public void setUserSellerId(String userSellerId) {
		this.userSellerId = userSellerId;
	}
	public String getUserBuyerId() {
		return userBuyerId;
	}
	public void setUserBuyerId(String userBuyerId) {
		this.userBuyerId = userBuyerId;
	}
	public String getQuestionType() {
		return questionType;
	}
	public void setQuestionType(String questionType) {
		this.questionType = questionType;
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
	public String getQuestionState() {
		return questionState;
	}
	public void setQuestionState(String questionState) {
		this.questionState = questionState;
	}
	public String getQuestionReplyState() {
		return questionReplyState;
	}
	public void setQuestionReplyState(String questionReplyState) {
		this.questionReplyState = questionReplyState;
	}
	@Override
	public String toString() {
		return "QuestionVo [questionCode=" + questionCode + ", auctionGoodsCode=" + auctionGoodsCode + ", userSellerId="
				+ userSellerId + ", userBuyerId=" + userBuyerId + ", questionType=" + questionType
				+ ", questionContents=" + questionContents + ", questionDate=" + questionDate + ", questionState="
				+ questionState + ", questionReplyState=" + questionReplyState + "]";
	}
	
	
}
