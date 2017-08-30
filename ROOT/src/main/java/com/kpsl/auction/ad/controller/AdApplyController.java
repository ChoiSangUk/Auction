package com.kpsl.auction.ad.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.kpsl.auction.ad.service.AdApplyService;
import com.kpsl.auction.ad.service.AdPaymentService;
import com.kpsl.auction.ad.service.AdUnitPriceService;
import com.kpsl.auction.ad.vo.AdApplyAndAdImageAndAdPaymentVo;
import com.kpsl.auction.ad.vo.AdApplyAndAdImageAndAdUnitPriceAndAuctionGoodsVo;
import com.kpsl.auction.ad.vo.AdApplyVo;
import com.kpsl.auction.ad.vo.AdImageVo;
import com.kpsl.auction.ad.vo.AdUnitPriceVo;
import com.kpsl.auction.auctiongoods.vo.AuctionGoodsVo;
import com.kpsl.auction.util.UtilFile;

@Controller
public class AdApplyController {
	//@Autowired AdApplyService adApplyService;
	@Autowired AdUnitPriceService adUnitPriceService;
	@Autowired AdApplyService adApplyService;
	@Autowired AdPaymentService adPaymentService;
	
	Logger log = Logger.getLogger(this.getClass());
	
	// 나의 광고신청 업데이트페이지 요청
	@RequestMapping(value = "/mypage/adApplyUpdateForm", method = RequestMethod.GET)
	public String myAdApplyModify(Model model, HttpSession session
								,@RequestParam (value="adApplyCode", required=true) String adApplyCode
								,@RequestParam (value="adImageCode", required=true) String adImageCode) {
								
		log.info("myAdApplyModify 요청 확인");
		log.info(adApplyCode+"<--- adApplyCode 확인");
		log.info(adImageCode+"<--- adImageCode 확인");
		String userId = (String) session.getAttribute("userId");
		/*String userId = "id002";*/
		List<AdApplyAndAdImageAndAdUnitPriceAndAuctionGoodsVo> myApplyList = 
				adApplyService.getMyAdApplyList(userId);
		List<AdUnitPriceVo> adUnitPriceList = adUnitPriceService.getAdUnitPirceList();
		List<AuctionGoodsVo> auctionGoodsList = adApplyService.getAuctionGoodsListByUserId(userId);
		
		model.addAttribute("myApplyList",myApplyList);
		model.addAttribute("adUnitPriceList",adUnitPriceList);
		model.addAttribute("auctionGoodsList",auctionGoodsList);
		model.addAttribute("adApplyCode",adApplyCode);
		model.addAttribute("adImageCode",adImageCode);		
		
		return "/mypage/mypage_adApply_updateForm";
	}
	// 나의 광고신청 업데이트(액션) 요청
	@RequestMapping(value = "/mypage/adApplyUpdateForm", method = RequestMethod.POST)
	public String myAdApplyModify(AdApplyVo adApplyVo, AdImageVo adImageVo
								, @RequestParam("adImage") MultipartFile adImage
	    						, MultipartHttpServletRequest multipartRequest) {
		
		log.info("myAdApplyModify 요청(액션) 확인");
		UtilFile utilFile = new UtilFile();
		HashMap<String, String> adFile= utilFile.fileUpload(multipartRequest, adImage);
		adImageVo.setAdImagePath(adFile.get("adImagePath"));
		adImageVo.setAdImageName(adFile.get("adImageName"));
		adApplyService.modifyAdApply(adApplyVo);
		adApplyService.modifyAdImage(adImageVo);
		
		return "redirect:/mypage/adApplyList";
	}
	
	// 나의 광고신청리스트 요청
	@RequestMapping(value = "/mypage/adApplyList", method = RequestMethod.GET)
	public String myAdApplyList(Model model, HttpSession session) {
		
		log.info("myAdApplyList 요청 확인");
		String userId = (String) session.getAttribute("userId");
		log.info(userId);
		//String userId = "id002";
		List<AdApplyAndAdImageAndAdUnitPriceAndAuctionGoodsVo> myApplyList = 
				adApplyService.getMyAdApplyList(userId);
		model.addAttribute("myApplyList",myApplyList);
		
		return "/mypage/mypage_adApply_list";		
	}
	
	// 광고상세정보 액션(수정) 요청
	@RequestMapping(value = "/ad/adminAdApplyDetail", method = RequestMethod.POST)
	public String adApplyDetail(AdApplyVo adApplyVo) {
		
		log.info("adApplyDetail 액션확인");
		adApplyService.modifyAdApply(adApplyVo);
		
		return "redirect:/ad/adminAdApplySearch";
	}
	
	// 광고상세정보 페이지 요청
	@RequestMapping(value = "/ad/adminAdApplyDetail", method = RequestMethod.GET)
	public String adApplyDetail(Model model,
								@RequestParam(value="adApplyCode", required=true) String adApplyCode) {
		
		log.info(adApplyCode+"<--- adApplyCode 확인");
		log.info("adApplyDetail 확인");
		AdApplyAndAdImageAndAdUnitPriceAndAuctionGoodsVo adApplyAndAdImageAndAdUnitPriceVo = adApplyService.getAdApplyDetail(adApplyCode);	
		AdApplyVo adApplyList = adApplyAndAdImageAndAdUnitPriceVo.getAdApplyVo();	
		AdImageVo adImageList = adApplyAndAdImageAndAdUnitPriceVo.getAdImageVo();
		AdUnitPriceVo adUnitPriceList = adApplyAndAdImageAndAdUnitPriceVo.getAdUnitPriceVo();
		model.addAttribute("adApplyList",adApplyList);
		model.addAttribute("adImageList",adImageList);
		model.addAttribute("adUnitPriceList",adUnitPriceList);
		
		return "/admin/ad/admin_adApply_detail";
	}
	
	// 관리자 광고신청 리스트 페이지 요청
	@RequestMapping(value = "/ad/adminAdApplySearch", method = RequestMethod.GET)
	public String adApplyList(Model model, AdApplyVo adApplyVo) {
		
		log.info("adApplyList 확인");
		List<AdApplyVo> adApplyList = adApplyService.getAdApplyList(adApplyVo);
		model.addAttribute("adApplyList",adApplyList);
		
		return "/admin/ad/admin_adApply_search";
	}
	
	// 광고신청 리스트 조회
	@RequestMapping(value = "/ad/adminAdApplySearch", method = RequestMethod.POST)
	public String adApplySearch(Model model, AdApplyVo adApplyVo
								,@RequestParam(value="sk", required=true) String sk) {
		
		log.info("adApplyList 확인");
		log.info(sk+"<--- 신청날짜 확인");
		List<AdApplyVo> adApplyList = adApplyService.getAdApplyList(adApplyVo);
		model.addAttribute("adApplyList",adApplyList);
		
		return "/admin/ad/admin_adApply_search";
	}
	
	// 광고정보 및 정책 페이지 요청
	@RequestMapping(value = "/mypage/mypageAdInfo", method = RequestMethod.GET)
	public String adApplyInfo(Model model) {
		
		log.info("adApplyInfo 확인");
		List<AdUnitPriceVo> adUnitPriceList = adUnitPriceService.getAdUnitPirceList();		
		model.addAttribute("adUnitPriceList",adUnitPriceList);
		
		return "/mypage/mypage_ad_info";
	}
	// 광고 신청 폼 요청
	@RequestMapping(value = "/mypage/adApplyInsertForm", method = RequestMethod.GET)
	public String adApplyAdd(Model model, String userId, HttpSession session) {
		
		log.info("adApplyAdd 확인");
		userId = (String) session.getAttribute("userId");
		//userId = "id002";
		List<AdUnitPriceVo> adUnitPriceList = adUnitPriceService.getAdUnitPirceList();
		List<AuctionGoodsVo> auctionGoodsList = adApplyService.getAuctionGoodsListByUserId(userId);
		List<AdApplyAndAdImageAndAdPaymentVo> currentAdList = adPaymentService.getPaymentSuccessList();
		model.addAttribute("adUnitPriceList", adUnitPriceList);
		model.addAttribute("auctionGoodsList", auctionGoodsList);
		model.addAttribute("currentAdList", currentAdList);
		
		return "/mypage/mypage_adApply_insertForm";
	}
	// 신청한 광고가 3개 이상이면 첫번째 광고의 종료날짜를 리턴
	@RequestMapping(value = "/dateAjax", method = RequestMethod.POST)
	public @ResponseBody String dateAjax() {
		
		log.info("ajax 호출 확인");
		List<AdApplyAndAdImageAndAdPaymentVo> currentAdList = adPaymentService.getPaymentSuccessList();
		String endDate = currentAdList.get(0).getAdApplyVo().getAdApplyEndDate();
		log.info(currentAdList.size()+"<--- size");
		
		if(currentAdList.size() >= 3) {
			return endDate;
		}else {
			return null;
		}
	}
	
	// 광고신청 (액션) 요청
	@RequestMapping(value = "/mypage/adApplyInsertForm", method = RequestMethod.POST)
	public String adApplyAdd(AdApplyVo adApplyVo ,AdImageVo adImageVo, HttpSession session
    						, @RequestParam("adImage") MultipartFile adImage,
    						MultipartHttpServletRequest multipartRequest) {
		log.info("adApplyAdd 확인");
		UtilFile utilFile = new UtilFile();
		HashMap<String, String> adFile= utilFile.fileUpload(multipartRequest, adImage);
		String userId = (String) session.getAttribute("userId");
		adApplyVo.setUserId(userId);
		adImageVo.setAdImagePath(adFile.get("adImagePath"));
		adImageVo.setAdImageName(adFile.get("adImageName"));		
		adApplyService.adApplyTransaction(adApplyVo, adImageVo);
		
		return "redirect:/mypage/mypageMain";
	}
}
