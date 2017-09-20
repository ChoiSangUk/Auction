package com.kpsl.auction.restController;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.kpsl.auction.question.service.QuestionService;
import com.kpsl.auction.question.vo.QuestionVo;

@RestController
public class QuestionRestController {
	@Autowired private QuestionService questionService;
	@RequestMapping(value = "/question/questionInsert", method = RequestMethod.POST)
	public String questionInsert(Model model, QuestionVo questionVo){
		System.out.println("물품등록 컨트롤러");
		System.out.println(questionVo.toString());
		questionService.addQuestion(questionVo);
		return "0";
	}
	@RequestMapping(value = "/question/getQuestion", method = RequestMethod.GET, produces = "application/json; charset=UTF-8")
	public String getQuestions(Model model,
			@RequestParam(value = "auctionGoodsCode", required = true) String auctionGoodsCode){
				System.out.println("문의 받아오기 컨트롤러");
				List<QuestionVo> questionList = questionService.getQuestions(auctionGoodsCode);
				
				System.out.println("물품문의 리스트 컨트롤러");
				System.out.println(questionList.toString());
		Gson gson = new Gson();
		return gson.toJson(questionList);
	}
}
