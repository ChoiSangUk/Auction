package com.kpsl.auction.question.vo;

public class QuestionReplyVo {
	private String questionReplyCode; 		//경매물품문의답글코드(PK)
	private String questionCode; 			//경매물품문의코드(FK)
	private String auctionGoodsCode; 		//경매물품코드(FK)
	private String userSellerId; 			//판매자아이디(FK)
	private String questionReplyContents; 	//답글내용
	private String questionReplyDate; 		//답글날짜
	
	public String getQuestionReplyCode() {
		return questionReplyCode;
	}
	public void setQuestionReplyCode(String questionReplyCode) {
		this.questionReplyCode = questionReplyCode;
	}
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
	public String getQuestionReplyContents() {
		return questionReplyContents;
	}
	public void setQuestionReplyContents(String questionReplyContents) {
		this.questionReplyContents = questionReplyContents;
	}
	public String getQuestionReplyDate() {
		return questionReplyDate;
	}
	public void setQuestionReplyDate(String questionReplyDate) {
		this.questionReplyDate = questionReplyDate;
	}
	@Override
	public String toString() {
		return "QuestionReplyVo [questionReplyCode=" + questionReplyCode + ", questionCode=" + questionCode
				+ ", auctionGoodsCode=" + auctionGoodsCode + ", userSellerId=" + userSellerId
				+ ", questionReplyContents=" + questionReplyContents + ", questionReplyDate=" + questionReplyDate + "]";
	}

}
