package com.kpsl.auction.goodscategory.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kpsl.auction.goodscategory.service.GoodsCategoryService;
import com.kpsl.auction.goodscategory.vo.LargeCategoryVo;

@Controller
public class GoodsCategoryController {
	@Autowired
	private GoodsCategoryService goodsCategoryService;

	@RequestMapping(value = "/goodscategory/largecategory", method = RequestMethod.GET)
	public String auctionGoodsList(Model model) {
	
		System.out.println("GoodsCategoryController.java 시작전");
	List<LargeCategoryVo> largeCategory = goodsCategoryService.getAllLargeCategory();
	System.out.println("GoodsCategoryController.java vo 받아오기");
	model.addAttribute("largeCategory",largeCategory);
	System.out.println("GoodsCategoryController.java 시작후");
	return "/auctiongoods/auctiongoods_list";
	}
}
